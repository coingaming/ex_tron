defmodule Protocol.AccountCreateContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          owner_address: String.t(),
          account_address: String.t(),
          type: integer
        }
  defstruct [:owner_address, :account_address, :type]

  field :owner_address, 1, type: :bytes
  field :account_address, 2, type: :bytes
  field :type, 3, type: Protocol.AccountType, enum: true
end

defmodule Protocol.AccountUpdateContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          account_name: String.t(),
          owner_address: String.t()
        }
  defstruct [:account_name, :owner_address]

  field :account_name, 1, type: :bytes
  field :owner_address, 2, type: :bytes
end

defmodule Protocol.SetAccountIdContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          account_id: String.t(),
          owner_address: String.t()
        }
  defstruct [:account_id, :owner_address]

  field :account_id, 1, type: :bytes
  field :owner_address, 2, type: :bytes
end

defmodule Protocol.TransferContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          owner_address: String.t(),
          to_address: String.t(),
          amount: integer
        }
  defstruct [:owner_address, :to_address, :amount]

  field :owner_address, 1, type: :bytes
  field :to_address, 2, type: :bytes
  field :amount, 3, type: :int64
end

defmodule Protocol.TransferAssetContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          asset_name: String.t(),
          owner_address: String.t(),
          to_address: String.t(),
          amount: integer
        }
  defstruct [:asset_name, :owner_address, :to_address, :amount]

  field :asset_name, 1, type: :bytes
  field :owner_address, 2, type: :bytes
  field :to_address, 3, type: :bytes
  field :amount, 4, type: :int64
end

defmodule Protocol.VoteAssetContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          owner_address: String.t(),
          vote_address: [String.t()],
          support: boolean,
          count: integer
        }
  defstruct [:owner_address, :vote_address, :support, :count]

  field :owner_address, 1, type: :bytes
  field :vote_address, 2, repeated: true, type: :bytes
  field :support, 3, type: :bool
  field :count, 5, type: :int32
end

defmodule Protocol.VoteWitnessContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          owner_address: String.t(),
          votes: [Protocol.VoteWitnessContract.Vote.t()],
          support: boolean
        }
  defstruct [:owner_address, :votes, :support]

  field :owner_address, 1, type: :bytes
  field :votes, 2, repeated: true, type: Protocol.VoteWitnessContract.Vote
  field :support, 3, type: :bool
end

defmodule Protocol.VoteWitnessContract.Vote do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          vote_address: String.t(),
          vote_count: integer
        }
  defstruct [:vote_address, :vote_count]

  field :vote_address, 1, type: :bytes
  field :vote_count, 2, type: :int64
end

defmodule Protocol.UpdateSettingContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          owner_address: String.t(),
          contract_address: String.t(),
          consume_user_resource_percent: integer
        }
  defstruct [:owner_address, :contract_address, :consume_user_resource_percent]

  field :owner_address, 1, type: :bytes
  field :contract_address, 2, type: :bytes
  field :consume_user_resource_percent, 3, type: :int64
end

defmodule Protocol.UpdateSettingForEnergyLimitContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          owner_address: String.t(),
          contract_address: String.t(),
          energy_limit: String.t()
        }
  defstruct [:owner_address, :contract_address, :energy_limit]

  field :owner_address, 1, type: :bytes
  field :contract_address, 2, type: :bytes
  field :energy_limit, 3, type: :bytes
end

defmodule Protocol.WitnessCreateContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          owner_address: String.t(),
          url: String.t()
        }
  defstruct [:owner_address, :url]

  field :owner_address, 1, type: :bytes
  field :url, 2, type: :bytes
end

defmodule Protocol.WitnessUpdateContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          owner_address: String.t(),
          update_url: String.t()
        }
  defstruct [:owner_address, :update_url]

  field :owner_address, 1, type: :bytes
  field :update_url, 12, type: :bytes
end

defmodule Protocol.AssetIssueContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          owner_address: String.t(),
          name: String.t(),
          abbr: String.t(),
          total_supply: integer,
          frozen_supply: [Protocol.AssetIssueContract.FrozenSupply.t()],
          trx_num: integer,
          num: integer,
          start_time: integer,
          end_time: integer,
          order: integer,
          vote_score: integer,
          description: String.t(),
          url: String.t(),
          free_asset_net_limit: integer,
          public_free_asset_net_limit: integer,
          public_free_asset_net_usage: integer,
          public_latest_free_net_time: integer
        }
  defstruct [
    :owner_address,
    :name,
    :abbr,
    :total_supply,
    :frozen_supply,
    :trx_num,
    :num,
    :start_time,
    :end_time,
    :order,
    :vote_score,
    :description,
    :url,
    :free_asset_net_limit,
    :public_free_asset_net_limit,
    :public_free_asset_net_usage,
    :public_latest_free_net_time
  ]

  field :owner_address, 1, type: :bytes
  field :name, 2, type: :bytes
  field :abbr, 3, type: :bytes
  field :total_supply, 4, type: :int64
  field :frozen_supply, 5, repeated: true, type: Protocol.AssetIssueContract.FrozenSupply
  field :trx_num, 6, type: :int32
  field :num, 8, type: :int32
  field :start_time, 9, type: :int64
  field :end_time, 10, type: :int64
  field :order, 11, type: :int64
  field :vote_score, 16, type: :int32
  field :description, 20, type: :bytes
  field :url, 21, type: :bytes
  field :free_asset_net_limit, 22, type: :int64
  field :public_free_asset_net_limit, 23, type: :int64
  field :public_free_asset_net_usage, 24, type: :int64
  field :public_latest_free_net_time, 25, type: :int64
end

defmodule Protocol.AssetIssueContract.FrozenSupply do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          frozen_amount: integer,
          frozen_days: integer
        }
  defstruct [:frozen_amount, :frozen_days]

  field :frozen_amount, 1, type: :int64
  field :frozen_days, 2, type: :int64
end

defmodule Protocol.ParticipateAssetIssueContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          owner_address: String.t(),
          to_address: String.t(),
          asset_name: String.t(),
          amount: integer
        }
  defstruct [:owner_address, :to_address, :asset_name, :amount]

  field :owner_address, 1, type: :bytes
  field :to_address, 2, type: :bytes
  field :asset_name, 3, type: :bytes
  field :amount, 4, type: :int64
end

defmodule Protocol.FreezeBalanceContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          owner_address: String.t(),
          frozen_balance: integer,
          frozen_duration: integer,
          resource: integer
        }
  defstruct [:owner_address, :frozen_balance, :frozen_duration, :resource]

  field :owner_address, 1, type: :bytes
  field :frozen_balance, 2, type: :int64
  field :frozen_duration, 3, type: :int64
  field :resource, 10, type: Protocol.ResourceCode, enum: true
end

defmodule Protocol.UnfreezeBalanceContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          owner_address: String.t(),
          resource: integer
        }
  defstruct [:owner_address, :resource]

  field :owner_address, 1, type: :bytes
  field :resource, 10, type: Protocol.ResourceCode, enum: true
end

defmodule Protocol.UnfreezeAssetContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          owner_address: String.t()
        }
  defstruct [:owner_address]

  field :owner_address, 1, type: :bytes
end

defmodule Protocol.WithdrawBalanceContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          owner_address: String.t()
        }
  defstruct [:owner_address]

  field :owner_address, 1, type: :bytes
end

defmodule Protocol.UpdateAssetContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          owner_address: String.t(),
          description: String.t(),
          url: String.t(),
          new_limit: integer,
          new_public_limit: integer
        }
  defstruct [:owner_address, :description, :url, :new_limit, :new_public_limit]

  field :owner_address, 1, type: :bytes
  field :description, 2, type: :bytes
  field :url, 3, type: :bytes
  field :new_limit, 4, type: :int64
  field :new_public_limit, 5, type: :int64
end

defmodule Protocol.ProposalCreateContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          owner_address: String.t(),
          parameters: %{integer => integer}
        }
  defstruct [:owner_address, :parameters]

  field :owner_address, 1, type: :bytes

  field :parameters, 2,
    repeated: true,
    type: Protocol.ProposalCreateContract.ParametersEntry,
    map: true
end

defmodule Protocol.ProposalCreateContract.ParametersEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: integer,
          value: integer
        }
  defstruct [:key, :value]

  field :key, 1, type: :int64
  field :value, 2, type: :int64
end

defmodule Protocol.ProposalApproveContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          owner_address: String.t(),
          proposal_id: integer,
          is_add_approval: boolean
        }
  defstruct [:owner_address, :proposal_id, :is_add_approval]

  field :owner_address, 1, type: :bytes
  field :proposal_id, 2, type: :int64
  field :is_add_approval, 3, type: :bool
end

defmodule Protocol.ProposalDeleteContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          owner_address: String.t(),
          proposal_id: integer
        }
  defstruct [:owner_address, :proposal_id]

  field :owner_address, 1, type: :bytes
  field :proposal_id, 2, type: :int64
end

defmodule Protocol.CreateSmartContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          owner_address: String.t(),
          new_contract: Protocol.SmartContract.t()
        }
  defstruct [:owner_address, :new_contract]

  field :owner_address, 1, type: :bytes
  field :new_contract, 2, type: Protocol.SmartContract
end

defmodule Protocol.TriggerSmartContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          owner_address: String.t(),
          contract_address: String.t(),
          call_value: integer,
          data: String.t()
        }
  defstruct [:owner_address, :contract_address, :call_value, :data]

  field :owner_address, 1, type: :bytes
  field :contract_address, 2, type: :bytes
  field :call_value, 3, type: :int64
  field :data, 4, type: :bytes
end

defmodule Protocol.BuyStorageContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          owner_address: String.t(),
          quant: integer
        }
  defstruct [:owner_address, :quant]

  field :owner_address, 1, type: :bytes
  field :quant, 2, type: :int64
end

defmodule Protocol.BuyStorageBytesContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          owner_address: String.t(),
          bytes: integer
        }
  defstruct [:owner_address, :bytes]

  field :owner_address, 1, type: :bytes
  field :bytes, 2, type: :int64
end

defmodule Protocol.SellStorageContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          owner_address: String.t(),
          storage_bytes: integer
        }
  defstruct [:owner_address, :storage_bytes]

  field :owner_address, 1, type: :bytes
  field :storage_bytes, 2, type: :int64
end

defmodule Protocol.ExchangeCreateContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          owner_address: String.t(),
          first_token_id: String.t(),
          first_token_balance: integer,
          second_token_id: String.t(),
          second_token_balance: integer
        }
  defstruct [
    :owner_address,
    :first_token_id,
    :first_token_balance,
    :second_token_id,
    :second_token_balance
  ]

  field :owner_address, 1, type: :bytes
  field :first_token_id, 2, type: :bytes
  field :first_token_balance, 3, type: :int64
  field :second_token_id, 4, type: :bytes
  field :second_token_balance, 5, type: :int64
end

defmodule Protocol.ExchangeInjectContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          owner_address: String.t(),
          exchange_id: integer,
          token_id: String.t(),
          quant: integer
        }
  defstruct [:owner_address, :exchange_id, :token_id, :quant]

  field :owner_address, 1, type: :bytes
  field :exchange_id, 2, type: :int64
  field :token_id, 3, type: :bytes
  field :quant, 4, type: :int64
end

defmodule Protocol.ExchangeWithdrawContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          owner_address: String.t(),
          exchange_id: integer,
          token_id: String.t(),
          quant: integer
        }
  defstruct [:owner_address, :exchange_id, :token_id, :quant]

  field :owner_address, 1, type: :bytes
  field :exchange_id, 2, type: :int64
  field :token_id, 3, type: :bytes
  field :quant, 4, type: :int64
end

defmodule Protocol.ExchangeTransactionContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          owner_address: String.t(),
          exchange_id: integer,
          token_id: String.t(),
          quant: integer,
          expected: integer
        }
  defstruct [:owner_address, :exchange_id, :token_id, :quant, :expected]

  field :owner_address, 1, type: :bytes
  field :exchange_id, 2, type: :int64
  field :token_id, 3, type: :bytes
  field :quant, 4, type: :int64
  field :expected, 5, type: :int64
end

defmodule Protocol.ResourceCode do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field :BANDWIDTH, 0
  field :ENERGY, 1
end
