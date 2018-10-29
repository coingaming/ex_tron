defmodule Tron.Client do
  use GRPC.Stub, service: Protocol.Wallet.Service
end
