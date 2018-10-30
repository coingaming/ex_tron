defmodule Tron.Client do
  use GRPC.Stub, service: Tron.Wallet.Service
end
