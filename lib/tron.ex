defmodule Tron do
  @moduledoc File.read!("README.md")

  @type private_key :: <<_::256>>
  @type public_key :: <<_::520>>
  @type address :: <<_::168>>

  @doc """
  Generates a private key.

  Example:

      iex> <<key::32-bytes>> = private_key()
      iex> byte_size(key)
      32

  """
  @spec private_key :: private_key
  def private_key do
    :crypto.strong_rand_bytes(32)
  end

  @doc """
  Computes a public key from a private key.

  Example:

      iex> privkey_base16 = "b9a367686d7fce1a5fdceb9b3b6ff116b5df5c9c8c9899dbaeaa00c1cb7b02a6"
      iex> privkey = Base.decode16!(privkey_base16, case: :lower)
      iex> pubkey = public_key(privkey)
      iex> Base.encode16(pubkey, case: :lower)
      "047adf4255f518ca27b9b41ddfd97d4a3799e02347b3b1b7c525b67371b3db350" <> 
      "a571b3bddb9732868daeab70f9ac9bd842c8b26e605855899f32f8526c2e6d5ed"

  """
  @spec public_key(private_key) :: public_key
  def public_key(<<privkey::32-bytes>>) do
    {:ok, pubkey} = :libsecp256k1.ec_pubkey_create(privkey, :uncompressed)
    pubkey
  end

  @doc """
  Computes an address from a private key

  Example:

      iex> privkey_base16 = "b9a367686d7fce1a5fdceb9b3b6ff116b5df5c9c8c9899dbaeaa00c1cb7b02a6"
      iex> privkey = Base.decode16!(privkey_base16, case: :lower)
      iex> address(privkey)
      <<65, 192, 82, 108, 106, 223, 154, 173, 171, 167>> <>
      <<80, 45, 69, 65, 191, 240, 51, 185, 140, 72, 181>>

  """
  @spec address(private_key) :: address
  def address(<<privkey::32-bytes>>) do
    <<4, pubkey::64-bytes>> = public_key(privkey)
    <<_::12-bytes, address::20-bytes>> = :keccakf1600.hash(:sha3_256, pubkey)
    <<0x41, address::bytes>>
  end

  @doc """
  Signs a transaction with a private key.
  A transactions needs to be signed before being broadcasted.

  Example:

      iex> transaction = Tron.Transaction.new(raw_data: Tron.Transaction.Raw.new())
      iex> privkey_base16 = "b9a367686d7fce1a5fdceb9b3b6ff116b5df5c9c8c9899dbaeaa00c1cb7b02a6"
      iex> privkey = Base.decode16!(privkey_base16, case: :lower)
      iex> %Tron.Transaction{signature: [signature]} = sign_transaction(transaction, privkey)
      iex> Base.encode16(signature, case: :lower)
      "a7cb7d32e8e50097a65d0ca3c5a2f54491d018346dc5a6cbdbcb7086e4ffcc6a4" <>
      "19dcbe0630b9d09cf8ec76d3b74fbc3d2adc78f307c260ec3f9b651dc37c8db01"

  """
  @spec sign_transaction(Tron.Transaction.t(), private_key) :: Tron.Transaction.t()
  def sign_transaction(
        %Tron.Transaction{raw_data: raw_data, signature: []} = transaction,
        <<privkey::32-bytes>>
      ) do
    hash = :crypto.hash(:sha256, Tron.Transaction.Raw.encode(raw_data))
    %{transaction | signature: [signature(hash, privkey)]}
  end

  @doc """
  Populates a transaction's refs with a block.
  Needs to be done before broadcasting the transaction.

  Example:

      iex> transaction = Tron.Transaction.new(raw_data: Tron.Transaction.Raw.new())
      iex> block_header = Tron.BlockHeader.Raw.new(
      ...>   number: 123,
      ...>   parentHash: (1..30 |> Enum.into([]) |> to_string()),
      ...>   timestamp: 12334556787
      ...> )
      iex> %Tron.Transaction{raw_data: raw_data} = set_reference(transaction, block_header)
      iex> {raw_data.ref_block_bytes, raw_data.ref_block_hash, raw_data.expiration}
      {<<0, 123>>, <<9, 10, 11, 12, 13, 14, 15, 16>>, 12370556787}

  """
  @spec set_reference(Tron.Transaction.t(), Tron.BlockHeader.Raw.t()) :: Tron.Transaction.t()
  def set_reference(
        %Tron.Transaction{raw_data: raw_data} = transaction,
        %Tron.BlockHeader.Raw{
          number: ref_block_num,
          parentHash: hash,
          timestamp: timestamp
        }
      ) do
    <<_::6-bytes, ref_block_bytes::2-bytes>> = <<ref_block_num::64>>
    <<_::8-bytes, ref_block_hash::8-bytes, _::bytes>> = hash

    %{
      transaction
      | raw_data: %{
          raw_data
          | ref_block_bytes: ref_block_bytes,
            ref_block_hash: ref_block_hash,
            expiration: timestamp + 10 * 60 * 60 * 1000
        }
    }
  end

  @spec signature(binary, private_key) :: <<_::520>>
  defp signature(hash, <<privkey::32-bytes>>) do
    {:ok, <<sig_r::32-bytes, sig_s::32-bytes>>, recovery} =
      :libsecp256k1.ecdsa_sign_compact(hash, privkey, :default, <<>>)

    sig_r <> sig_s <> <<recovery>>
  end
end
