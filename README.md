[![Hex pm](http://img.shields.io/hexpm/v/tron.svg?style=flat)](https://hex.pm/packages/tron)
[![Build Status](https://semaphoreci.com/api/v1/syfgkjasdkn/tron-protocol/branches/master/shields_badge.svg)](https://semaphoreci.com/syfgkjasdkn/tron-protocol)

WIP [TRON protocol](https://tron.network) implementation

### Examples

```elixir
# your private key
privkey = <<...>>

# where you want to send TRX to
to_address = <<...>>

# build a transfer contract
transfer_contract = Tron.TransferContract.new(
  owner_address: Tron.address(privkey), # your address
  to_address: to_address,
  amount: 100_000 # 0.1 TRX
)

# embed the transfer contract in a transaction contract
transaction_contract = Tron.Transaction.Contract.new(
  type: Tron.Transaction.Contract.ContractType.value(:TransferContract),
  parameter:
    Google.Protobuf.Any.new(
      value: Tron.TransferContract.encode(transfer_contract),
      type_url: "type.googleapis.com/protocol.TransferContract"
    )
)

timestamp = DateTime.to_unix(DateTime.utc_now(), :millisecond)

# build a transaction
transaction = Tron.Transaction.new(
  raw_data: Tron.Transaction.Raw.new(contract: [transaction_contract], timestamp: timestamp),
  signature: []
)

# connect to a node (https://github.com/tronprotocol/Documentation/blob/master/TRX/Official_Public_Node.md)
{:ok, channel} = GRPC.Stub.connect("47.254.77.146:50051")

# get latest block for reference
{:ok,
   %Tron.BlockExtention{
     block_header: %Tron.BlockHeader{raw_data: %Tron.BlockHeader.Raw{} = block_header_raw}
   }} = Tron.Client.get_now_block2(channel, Tron.EmptyMessage.new())

# set transaction's block reference and sign it
transaction =
  transaction
  |> Tron.set_reference(block_header_raw)
  |> Tron.sign_transaction(privkey)

# broadcast the transaction
{:ok, %Tron.Return{code: 0, message: "", result: true}} =
  Tron.Client.broadcast_transaction(channel, transaction)
```
