defmodule Protocol.InventoryItems do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          type: integer,
          items: [String.t()]
        }
  defstruct [:type, :items]

  field :type, 1, type: :int32
  field :items, 2, repeated: true, type: :bytes
end
