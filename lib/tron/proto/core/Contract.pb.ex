defmodule Tron.AccountCreateContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          owner_address: binary,
          account_address: binary,
          type: atom | integer
        }
  defstruct [:owner_address, :account_address, :type]

  field(:owner_address, 1, type: :bytes)
  field(:account_address, 2, type: :bytes)
  field(:type, 3, type: Tron.AccountType, enum: true)
end

defmodule Tron.AccountUpdateContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          account_name: binary,
          owner_address: binary
        }
  defstruct [:account_name, :owner_address]

  field(:account_name, 1, type: :bytes)
  field(:owner_address, 2, type: :bytes)
end

defmodule Tron.SetAccountIdContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          account_id: binary,
          owner_address: binary
        }
  defstruct [:account_id, :owner_address]

  field(:account_id, 1, type: :bytes)
  field(:owner_address, 2, type: :bytes)
end

defmodule Tron.TransferContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          owner_address: binary,
          to_address: binary,
          amount: integer
        }
  defstruct [:owner_address, :to_address, :amount]

  field(:owner_address, 1, type: :bytes)
  field(:to_address, 2, type: :bytes)
  field(:amount, 3, type: :int64)
end

defmodule Tron.TransferAssetContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          asset_name: binary,
          owner_address: binary,
          to_address: binary,
          amount: integer
        }
  defstruct [:asset_name, :owner_address, :to_address, :amount]

  field(:asset_name, 1, type: :bytes)
  field(:owner_address, 2, type: :bytes)
  field(:to_address, 3, type: :bytes)
  field(:amount, 4, type: :int64)
end

defmodule Tron.VoteAssetContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          owner_address: binary,
          vote_address: [binary],
          support: boolean,
          count: integer
        }
  defstruct [:owner_address, :vote_address, :support, :count]

  field(:owner_address, 1, type: :bytes)
  field(:vote_address, 2, repeated: true, type: :bytes)
  field(:support, 3, type: :bool)
  field(:count, 5, type: :int32)
end

defmodule Tron.VoteWitnessContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          owner_address: binary,
          votes: [Tron.VoteWitnessContract.Vote.t()],
          support: boolean
        }
  defstruct [:owner_address, :votes, :support]

  field(:owner_address, 1, type: :bytes)
  field(:votes, 2, repeated: true, type: Tron.VoteWitnessContract.Vote)
  field(:support, 3, type: :bool)
end

defmodule Tron.VoteWitnessContract.Vote do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          vote_address: binary,
          vote_count: integer
        }
  defstruct [:vote_address, :vote_count]

  field(:vote_address, 1, type: :bytes)
  field(:vote_count, 2, type: :int64)
end

defmodule Tron.UpdateSettingContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          owner_address: binary,
          contract_address: binary,
          consume_user_resource_percent: integer
        }
  defstruct [:owner_address, :contract_address, :consume_user_resource_percent]

  field(:owner_address, 1, type: :bytes)
  field(:contract_address, 2, type: :bytes)
  field(:consume_user_resource_percent, 3, type: :int64)
end

defmodule Tron.UpdateEnergyLimitContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          owner_address: binary,
          contract_address: binary,
          origin_energy_limit: integer
        }
  defstruct [:owner_address, :contract_address, :origin_energy_limit]

  field(:owner_address, 1, type: :bytes)
  field(:contract_address, 2, type: :bytes)
  field(:origin_energy_limit, 3, type: :int64)
end

defmodule Tron.WitnessCreateContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          owner_address: binary,
          url: binary
        }
  defstruct [:owner_address, :url]

  field(:owner_address, 1, type: :bytes)
  field(:url, 2, type: :bytes)
end

defmodule Tron.WitnessUpdateContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          owner_address: binary,
          update_url: binary
        }
  defstruct [:owner_address, :update_url]

  field(:owner_address, 1, type: :bytes)
  field(:update_url, 12, type: :bytes)
end

defmodule Tron.AssetIssueContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          id: String.t(),
          owner_address: binary,
          name: binary,
          abbr: binary,
          total_supply: integer,
          frozen_supply: [Tron.AssetIssueContract.FrozenSupply.t()],
          trx_num: integer,
          precision: integer,
          num: integer,
          start_time: integer,
          end_time: integer,
          order: integer,
          vote_score: integer,
          description: binary,
          url: binary,
          free_asset_net_limit: integer,
          public_free_asset_net_limit: integer,
          public_free_asset_net_usage: integer,
          public_latest_free_net_time: integer
        }
  defstruct [
    :id,
    :owner_address,
    :name,
    :abbr,
    :total_supply,
    :frozen_supply,
    :trx_num,
    :precision,
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

  field(:id, 41, type: :string)
  field(:owner_address, 1, type: :bytes)
  field(:name, 2, type: :bytes)
  field(:abbr, 3, type: :bytes)
  field(:total_supply, 4, type: :int64)
  field(:frozen_supply, 5, repeated: true, type: Tron.AssetIssueContract.FrozenSupply)
  field(:trx_num, 6, type: :int32)
  field(:precision, 7, type: :int32)
  field(:num, 8, type: :int32)
  field(:start_time, 9, type: :int64)
  field(:end_time, 10, type: :int64)
  field(:order, 11, type: :int64)
  field(:vote_score, 16, type: :int32)
  field(:description, 20, type: :bytes)
  field(:url, 21, type: :bytes)
  field(:free_asset_net_limit, 22, type: :int64)
  field(:public_free_asset_net_limit, 23, type: :int64)
  field(:public_free_asset_net_usage, 24, type: :int64)
  field(:public_latest_free_net_time, 25, type: :int64)
end

defmodule Tron.AssetIssueContract.FrozenSupply do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          frozen_amount: integer,
          frozen_days: integer
        }
  defstruct [:frozen_amount, :frozen_days]

  field(:frozen_amount, 1, type: :int64)
  field(:frozen_days, 2, type: :int64)
end

defmodule Tron.ParticipateAssetIssueContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          owner_address: binary,
          to_address: binary,
          asset_name: binary,
          amount: integer
        }
  defstruct [:owner_address, :to_address, :asset_name, :amount]

  field(:owner_address, 1, type: :bytes)
  field(:to_address, 2, type: :bytes)
  field(:asset_name, 3, type: :bytes)
  field(:amount, 4, type: :int64)
end

defmodule Tron.FreezeBalanceContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          owner_address: binary,
          frozen_balance: integer,
          frozen_duration: integer,
          resource: atom | integer,
          receiver_address: binary
        }
  defstruct [:owner_address, :frozen_balance, :frozen_duration, :resource, :receiver_address]

  field(:owner_address, 1, type: :bytes)
  field(:frozen_balance, 2, type: :int64)
  field(:frozen_duration, 3, type: :int64)
  field(:resource, 10, type: Tron.ResourceCode, enum: true)
  field(:receiver_address, 15, type: :bytes)
end

defmodule Tron.UnfreezeBalanceContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          owner_address: binary,
          resource: atom | integer,
          receiver_address: binary
        }
  defstruct [:owner_address, :resource, :receiver_address]

  field(:owner_address, 1, type: :bytes)
  field(:resource, 10, type: Tron.ResourceCode, enum: true)
  field(:receiver_address, 15, type: :bytes)
end

defmodule Tron.UnfreezeAssetContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          owner_address: binary
        }
  defstruct [:owner_address]

  field(:owner_address, 1, type: :bytes)
end

defmodule Tron.WithdrawBalanceContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          owner_address: binary
        }
  defstruct [:owner_address]

  field(:owner_address, 1, type: :bytes)
end

defmodule Tron.UpdateAssetContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          owner_address: binary,
          description: binary,
          url: binary,
          new_limit: integer,
          new_public_limit: integer
        }
  defstruct [:owner_address, :description, :url, :new_limit, :new_public_limit]

  field(:owner_address, 1, type: :bytes)
  field(:description, 2, type: :bytes)
  field(:url, 3, type: :bytes)
  field(:new_limit, 4, type: :int64)
  field(:new_public_limit, 5, type: :int64)
end

defmodule Tron.ProposalCreateContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          owner_address: binary,
          parameters: %{integer => integer}
        }
  defstruct [:owner_address, :parameters]

  field(:owner_address, 1, type: :bytes)

  field(:parameters, 2,
    repeated: true,
    type: Tron.ProposalCreateContract.ParametersEntry,
    map: true
  )
end

defmodule Tron.ProposalCreateContract.ParametersEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: integer,
          value: integer
        }
  defstruct [:key, :value]

  field(:key, 1, type: :int64)
  field(:value, 2, type: :int64)
end

defmodule Tron.ProposalApproveContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          owner_address: binary,
          proposal_id: integer,
          is_add_approval: boolean
        }
  defstruct [:owner_address, :proposal_id, :is_add_approval]

  field(:owner_address, 1, type: :bytes)
  field(:proposal_id, 2, type: :int64)
  field(:is_add_approval, 3, type: :bool)
end

defmodule Tron.ProposalDeleteContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          owner_address: binary,
          proposal_id: integer
        }
  defstruct [:owner_address, :proposal_id]

  field(:owner_address, 1, type: :bytes)
  field(:proposal_id, 2, type: :int64)
end

defmodule Tron.CreateSmartContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          owner_address: binary,
          new_contract: Tron.SmartContract.t() | nil,
          call_token_value: integer,
          token_id: integer
        }
  defstruct [:owner_address, :new_contract, :call_token_value, :token_id]

  field(:owner_address, 1, type: :bytes)
  field(:new_contract, 2, type: Tron.SmartContract)
  field(:call_token_value, 3, type: :int64)
  field(:token_id, 4, type: :int64)
end

defmodule Tron.TriggerSmartContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          owner_address: binary,
          contract_address: binary,
          call_value: integer,
          data: binary,
          call_token_value: integer,
          token_id: integer
        }
  defstruct [:owner_address, :contract_address, :call_value, :data, :call_token_value, :token_id]

  field(:owner_address, 1, type: :bytes)
  field(:contract_address, 2, type: :bytes)
  field(:call_value, 3, type: :int64)
  field(:data, 4, type: :bytes)
  field(:call_token_value, 5, type: :int64)
  field(:token_id, 6, type: :int64)
end

defmodule Tron.BuyStorageContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          owner_address: binary,
          quant: integer
        }
  defstruct [:owner_address, :quant]

  field(:owner_address, 1, type: :bytes)
  field(:quant, 2, type: :int64)
end

defmodule Tron.BuyStorageBytesContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          owner_address: binary,
          bytes: integer
        }
  defstruct [:owner_address, :bytes]

  field(:owner_address, 1, type: :bytes)
  field(:bytes, 2, type: :int64)
end

defmodule Tron.SellStorageContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          owner_address: binary,
          storage_bytes: integer
        }
  defstruct [:owner_address, :storage_bytes]

  field(:owner_address, 1, type: :bytes)
  field(:storage_bytes, 2, type: :int64)
end

defmodule Tron.ExchangeCreateContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          owner_address: binary,
          first_token_id: binary,
          first_token_balance: integer,
          second_token_id: binary,
          second_token_balance: integer
        }
  defstruct [
    :owner_address,
    :first_token_id,
    :first_token_balance,
    :second_token_id,
    :second_token_balance
  ]

  field(:owner_address, 1, type: :bytes)
  field(:first_token_id, 2, type: :bytes)
  field(:first_token_balance, 3, type: :int64)
  field(:second_token_id, 4, type: :bytes)
  field(:second_token_balance, 5, type: :int64)
end

defmodule Tron.ExchangeInjectContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          owner_address: binary,
          exchange_id: integer,
          token_id: binary,
          quant: integer
        }
  defstruct [:owner_address, :exchange_id, :token_id, :quant]

  field(:owner_address, 1, type: :bytes)
  field(:exchange_id, 2, type: :int64)
  field(:token_id, 3, type: :bytes)
  field(:quant, 4, type: :int64)
end

defmodule Tron.ExchangeWithdrawContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          owner_address: binary,
          exchange_id: integer,
          token_id: binary,
          quant: integer
        }
  defstruct [:owner_address, :exchange_id, :token_id, :quant]

  field(:owner_address, 1, type: :bytes)
  field(:exchange_id, 2, type: :int64)
  field(:token_id, 3, type: :bytes)
  field(:quant, 4, type: :int64)
end

defmodule Tron.ExchangeTransactionContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          owner_address: binary,
          exchange_id: integer,
          token_id: binary,
          quant: integer,
          expected: integer
        }
  defstruct [:owner_address, :exchange_id, :token_id, :quant, :expected]

  field(:owner_address, 1, type: :bytes)
  field(:exchange_id, 2, type: :int64)
  field(:token_id, 3, type: :bytes)
  field(:quant, 4, type: :int64)
  field(:expected, 5, type: :int64)
end

defmodule Tron.ResourceCode do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:BANDWIDTH, 0)
  field(:ENERGY, 1)
end
