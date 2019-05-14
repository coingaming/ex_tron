defmodule TronTest do
  use ExUnit.Case
  doctest Tron, import: true

  @private_key Base.decode16!(File.read!("keys/1.priv"), case: :lower)
  @private_key2 Base.decode16!(File.read!("keys/2.priv"), case: :lower)

  test "greets the world" do
    private_key = Tron.private_key()
    assert is_binary(private_key) === true
  end
end
