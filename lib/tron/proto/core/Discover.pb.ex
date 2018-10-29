defmodule Tron.Endpoint do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          address: String.t(),
          port: integer,
          nodeId: String.t()
        }
  defstruct [:address, :port, :nodeId]

  field :address, 1, type: :bytes
  field :port, 2, type: :int32
  field :nodeId, 3, type: :bytes
end

defmodule Tron.PingMessage do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          from: Tron.Endpoint.t(),
          to: Tron.Endpoint.t(),
          version: integer,
          timestamp: integer
        }
  defstruct [:from, :to, :version, :timestamp]

  field :from, 1, type: Tron.Endpoint
  field :to, 2, type: Tron.Endpoint
  field :version, 3, type: :int32
  field :timestamp, 4, type: :int64
end

defmodule Tron.PongMessage do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          from: Tron.Endpoint.t(),
          echo: integer,
          timestamp: integer
        }
  defstruct [:from, :echo, :timestamp]

  field :from, 1, type: Tron.Endpoint
  field :echo, 2, type: :int32
  field :timestamp, 3, type: :int64
end

defmodule Tron.FindNeighbours do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          from: Tron.Endpoint.t(),
          targetId: String.t(),
          timestamp: integer
        }
  defstruct [:from, :targetId, :timestamp]

  field :from, 1, type: Tron.Endpoint
  field :targetId, 2, type: :bytes
  field :timestamp, 3, type: :int64
end

defmodule Tron.Neighbours do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          from: Tron.Endpoint.t(),
          neighbours: [Tron.Endpoint.t()],
          timestamp: integer
        }
  defstruct [:from, :neighbours, :timestamp]

  field :from, 1, type: Tron.Endpoint
  field :neighbours, 2, repeated: true, type: Tron.Endpoint
  field :timestamp, 3, type: :int64
end

defmodule Tron.BackupMessage do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          flag: boolean,
          priority: integer
        }
  defstruct [:flag, :priority]

  field :flag, 1, type: :bool
  field :priority, 2, type: :int32
end
