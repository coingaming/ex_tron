defmodule Tron.AccountId do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          name: binary,
          address: binary
        }
  defstruct [:name, :address]

  field(:name, 1, type: :bytes)
  field(:address, 2, type: :bytes)
end

defmodule Tron.Vote do
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

defmodule Tron.Proposal do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          proposal_id: integer,
          proposer_address: binary,
          parameters: %{integer => integer},
          expiration_time: integer,
          create_time: integer,
          approvals: [binary],
          state: atom | integer
        }
  defstruct [
    :proposal_id,
    :proposer_address,
    :parameters,
    :expiration_time,
    :create_time,
    :approvals,
    :state
  ]

  field(:proposal_id, 1, type: :int64)
  field(:proposer_address, 2, type: :bytes)
  field(:parameters, 3, repeated: true, type: Tron.Proposal.ParametersEntry, map: true)
  field(:expiration_time, 4, type: :int64)
  field(:create_time, 5, type: :int64)
  field(:approvals, 6, repeated: true, type: :bytes)
  field(:state, 7, type: Tron.Proposal.State, enum: true)
end

defmodule Tron.Proposal.ParametersEntry do
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

defmodule Tron.Proposal.State do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:PENDING, 0)
  field(:DISAPPROVED, 1)
  field(:APPROVED, 2)
  field(:CANCELED, 3)
end

defmodule Tron.Exchange do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          exchange_id: integer,
          creator_address: binary,
          create_time: integer,
          first_token_id: binary,
          first_token_balance: integer,
          second_token_id: binary,
          second_token_balance: integer
        }
  defstruct [
    :exchange_id,
    :creator_address,
    :create_time,
    :first_token_id,
    :first_token_balance,
    :second_token_id,
    :second_token_balance
  ]

  field(:exchange_id, 1, type: :int64)
  field(:creator_address, 2, type: :bytes)
  field(:create_time, 3, type: :int64)
  field(:first_token_id, 6, type: :bytes)
  field(:first_token_balance, 7, type: :int64)
  field(:second_token_id, 8, type: :bytes)
  field(:second_token_balance, 9, type: :int64)
end

defmodule Tron.ChainParameters do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          chainParameter: [Tron.ChainParameters.ChainParameter.t()]
        }
  defstruct [:chainParameter]

  field(:chainParameter, 1, repeated: true, type: Tron.ChainParameters.ChainParameter)
end

defmodule Tron.ChainParameters.ChainParameter do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          value: integer
        }
  defstruct [:key, :value]

  field(:key, 1, type: :string)
  field(:value, 2, type: :int64)
end

defmodule Tron.Account do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          account_name: binary,
          type: atom | integer,
          address: binary,
          balance: integer,
          votes: [Tron.Vote.t()],
          asset: %{String.t() => integer},
          assetV2: %{String.t() => integer},
          frozen: [Tron.Account.Frozen.t()],
          net_usage: integer,
          acquired_delegated_frozen_balance_for_bandwidth: integer,
          delegated_frozen_balance_for_bandwidth: integer,
          create_time: integer,
          latest_opration_time: integer,
          allowance: integer,
          latest_withdraw_time: integer,
          code: binary,
          is_witness: boolean,
          is_committee: boolean,
          frozen_supply: [Tron.Account.Frozen.t()],
          asset_issued_name: binary,
          asset_issued_ID: binary,
          latest_asset_operation_time: %{String.t() => integer},
          latest_asset_operation_timeV2: %{String.t() => integer},
          free_net_usage: integer,
          free_asset_net_usage: %{String.t() => integer},
          free_asset_net_usageV2: %{String.t() => integer},
          latest_consume_time: integer,
          latest_consume_free_time: integer,
          account_id: binary,
          account_resource: Tron.Account.AccountResource.t() | nil,
          codeHash: binary,
          owner_permission: Tron.Permission.t() | nil,
          witness_permission: Tron.Permission.t() | nil,
          active_permission: [Tron.Permission.t()]
        }
  defstruct [
    :account_name,
    :type,
    :address,
    :balance,
    :votes,
    :asset,
    :assetV2,
    :frozen,
    :net_usage,
    :acquired_delegated_frozen_balance_for_bandwidth,
    :delegated_frozen_balance_for_bandwidth,
    :create_time,
    :latest_opration_time,
    :allowance,
    :latest_withdraw_time,
    :code,
    :is_witness,
    :is_committee,
    :frozen_supply,
    :asset_issued_name,
    :asset_issued_ID,
    :latest_asset_operation_time,
    :latest_asset_operation_timeV2,
    :free_net_usage,
    :free_asset_net_usage,
    :free_asset_net_usageV2,
    :latest_consume_time,
    :latest_consume_free_time,
    :account_id,
    :account_resource,
    :codeHash,
    :owner_permission,
    :witness_permission,
    :active_permission
  ]

  field(:account_name, 1, type: :bytes)
  field(:type, 2, type: Tron.AccountType, enum: true)
  field(:address, 3, type: :bytes)
  field(:balance, 4, type: :int64)
  field(:votes, 5, repeated: true, type: Tron.Vote)
  field(:asset, 6, repeated: true, type: Tron.Account.AssetEntry, map: true)
  field(:assetV2, 56, repeated: true, type: Tron.Account.AssetV2Entry, map: true)
  field(:frozen, 7, repeated: true, type: Tron.Account.Frozen)
  field(:net_usage, 8, type: :int64)
  field(:acquired_delegated_frozen_balance_for_bandwidth, 41, type: :int64)
  field(:delegated_frozen_balance_for_bandwidth, 42, type: :int64)
  field(:create_time, 9, type: :int64)
  field(:latest_opration_time, 10, type: :int64)
  field(:allowance, 11, type: :int64)
  field(:latest_withdraw_time, 12, type: :int64)
  field(:code, 13, type: :bytes)
  field(:is_witness, 14, type: :bool)
  field(:is_committee, 15, type: :bool)
  field(:frozen_supply, 16, repeated: true, type: Tron.Account.Frozen)
  field(:asset_issued_name, 17, type: :bytes)
  field(:asset_issued_ID, 57, type: :bytes)

  field(:latest_asset_operation_time, 18,
    repeated: true,
    type: Tron.Account.LatestAssetOperationTimeEntry,
    map: true
  )

  field(:latest_asset_operation_timeV2, 58,
    repeated: true,
    type: Tron.Account.LatestAssetOperationTimeV2Entry,
    map: true
  )

  field(:free_net_usage, 19, type: :int64)

  field(:free_asset_net_usage, 20,
    repeated: true,
    type: Tron.Account.FreeAssetNetUsageEntry,
    map: true
  )

  field(:free_asset_net_usageV2, 59,
    repeated: true,
    type: Tron.Account.FreeAssetNetUsageV2Entry,
    map: true
  )

  field(:latest_consume_time, 21, type: :int64)
  field(:latest_consume_free_time, 22, type: :int64)
  field(:account_id, 23, type: :bytes)
  field(:account_resource, 26, type: Tron.Account.AccountResource)
  field(:codeHash, 30, type: :bytes)
  field(:owner_permission, 31, type: Tron.Permission)
  field(:witness_permission, 32, type: Tron.Permission)
  field(:active_permission, 33, repeated: true, type: Tron.Permission)
end

defmodule Tron.Account.Frozen do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          frozen_balance: integer,
          expire_time: integer
        }
  defstruct [:frozen_balance, :expire_time]

  field(:frozen_balance, 1, type: :int64)
  field(:expire_time, 2, type: :int64)
end

defmodule Tron.Account.AssetEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          value: integer
        }
  defstruct [:key, :value]

  field(:key, 1, type: :string)
  field(:value, 2, type: :int64)
end

defmodule Tron.Account.AssetV2Entry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          value: integer
        }
  defstruct [:key, :value]

  field(:key, 1, type: :string)
  field(:value, 2, type: :int64)
end

defmodule Tron.Account.LatestAssetOperationTimeEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          value: integer
        }
  defstruct [:key, :value]

  field(:key, 1, type: :string)
  field(:value, 2, type: :int64)
end

defmodule Tron.Account.LatestAssetOperationTimeV2Entry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          value: integer
        }
  defstruct [:key, :value]

  field(:key, 1, type: :string)
  field(:value, 2, type: :int64)
end

defmodule Tron.Account.FreeAssetNetUsageEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          value: integer
        }
  defstruct [:key, :value]

  field(:key, 1, type: :string)
  field(:value, 2, type: :int64)
end

defmodule Tron.Account.FreeAssetNetUsageV2Entry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          value: integer
        }
  defstruct [:key, :value]

  field(:key, 1, type: :string)
  field(:value, 2, type: :int64)
end

defmodule Tron.Account.AccountResource do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          energy_usage: integer,
          frozen_balance_for_energy: Tron.Account.Frozen.t() | nil,
          latest_consume_time_for_energy: integer,
          acquired_delegated_frozen_balance_for_energy: integer,
          delegated_frozen_balance_for_energy: integer,
          storage_limit: integer,
          storage_usage: integer,
          latest_exchange_storage_time: integer
        }
  defstruct [
    :energy_usage,
    :frozen_balance_for_energy,
    :latest_consume_time_for_energy,
    :acquired_delegated_frozen_balance_for_energy,
    :delegated_frozen_balance_for_energy,
    :storage_limit,
    :storage_usage,
    :latest_exchange_storage_time
  ]

  field(:energy_usage, 1, type: :int64)
  field(:frozen_balance_for_energy, 2, type: Tron.Account.Frozen)
  field(:latest_consume_time_for_energy, 3, type: :int64)
  field(:acquired_delegated_frozen_balance_for_energy, 4, type: :int64)
  field(:delegated_frozen_balance_for_energy, 5, type: :int64)
  field(:storage_limit, 6, type: :int64)
  field(:storage_usage, 7, type: :int64)
  field(:latest_exchange_storage_time, 8, type: :int64)
end

defmodule Tron.Key do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          address: binary,
          weight: integer
        }
  defstruct [:address, :weight]

  field(:address, 1, type: :bytes)
  field(:weight, 2, type: :int64)
end

defmodule Tron.DelegatedResource do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          from: binary,
          to: binary,
          frozen_balance_for_bandwidth: integer,
          frozen_balance_for_energy: integer,
          expire_time_for_bandwidth: integer,
          expire_time_for_energy: integer
        }
  defstruct [
    :from,
    :to,
    :frozen_balance_for_bandwidth,
    :frozen_balance_for_energy,
    :expire_time_for_bandwidth,
    :expire_time_for_energy
  ]

  field(:from, 1, type: :bytes)
  field(:to, 2, type: :bytes)
  field(:frozen_balance_for_bandwidth, 3, type: :int64)
  field(:frozen_balance_for_energy, 4, type: :int64)
  field(:expire_time_for_bandwidth, 5, type: :int64)
  field(:expire_time_for_energy, 6, type: :int64)
end

defmodule Tron.Authority do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          account: Tron.AccountId.t() | nil,
          permission_name: binary
        }
  defstruct [:account, :permission_name]

  field(:account, 1, type: Tron.AccountId)
  field(:permission_name, 2, type: :bytes)
end

defmodule Tron.Permission do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          type: atom | integer,
          id: integer,
          permission_name: String.t(),
          threshold: integer,
          parent_id: integer,
          operations: binary,
          keys: [Tron.Key.t()]
        }
  defstruct [:type, :id, :permission_name, :threshold, :parent_id, :operations, :keys]

  field(:type, 1, type: Tron.Permission.PermissionType, enum: true)
  field(:id, 2, type: :int32)
  field(:permission_name, 3, type: :string)
  field(:threshold, 4, type: :int64)
  field(:parent_id, 5, type: :int32)
  field(:operations, 6, type: :bytes)
  field(:keys, 7, repeated: true, type: Tron.Key)
end

defmodule Tron.Permission.PermissionType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:Owner, 0)
  field(:Witness, 1)
  field(:Active, 2)
end

defmodule Tron.Witness do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          address: binary,
          voteCount: integer,
          pubKey: binary,
          url: String.t(),
          totalProduced: integer,
          totalMissed: integer,
          latestBlockNum: integer,
          latestSlotNum: integer,
          isJobs: boolean
        }
  defstruct [
    :address,
    :voteCount,
    :pubKey,
    :url,
    :totalProduced,
    :totalMissed,
    :latestBlockNum,
    :latestSlotNum,
    :isJobs
  ]

  field(:address, 1, type: :bytes)
  field(:voteCount, 2, type: :int64)
  field(:pubKey, 3, type: :bytes)
  field(:url, 4, type: :string)
  field(:totalProduced, 5, type: :int64)
  field(:totalMissed, 6, type: :int64)
  field(:latestBlockNum, 7, type: :int64)
  field(:latestSlotNum, 8, type: :int64)
  field(:isJobs, 9, type: :bool)
end

defmodule Tron.Votes do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          address: binary,
          old_votes: [Tron.Vote.t()],
          new_votes: [Tron.Vote.t()]
        }
  defstruct [:address, :old_votes, :new_votes]

  field(:address, 1, type: :bytes)
  field(:old_votes, 2, repeated: true, type: Tron.Vote)
  field(:new_votes, 3, repeated: true, type: Tron.Vote)
end

defmodule Tron.TXOutput do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          value: integer,
          pubKeyHash: binary
        }
  defstruct [:value, :pubKeyHash]

  field(:value, 1, type: :int64)
  field(:pubKeyHash, 2, type: :bytes)
end

defmodule Tron.TXInput do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          raw_data: Tron.TXInput.Raw.t() | nil,
          signature: binary
        }
  defstruct [:raw_data, :signature]

  field(:raw_data, 1, type: Tron.TXInput.Raw)
  field(:signature, 4, type: :bytes)
end

defmodule Tron.TXInput.Raw do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          txID: binary,
          vout: integer,
          pubKey: binary
        }
  defstruct [:txID, :vout, :pubKey]

  field(:txID, 1, type: :bytes)
  field(:vout, 2, type: :int64)
  field(:pubKey, 3, type: :bytes)
end

defmodule Tron.TXOutputs do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          outputs: [Tron.TXOutput.t()]
        }
  defstruct [:outputs]

  field(:outputs, 1, repeated: true, type: Tron.TXOutput)
end

defmodule Tron.ResourceReceipt do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          energy_usage: integer,
          energy_fee: integer,
          origin_energy_usage: integer,
          energy_usage_total: integer,
          net_usage: integer,
          net_fee: integer,
          result: atom | integer
        }
  defstruct [
    :energy_usage,
    :energy_fee,
    :origin_energy_usage,
    :energy_usage_total,
    :net_usage,
    :net_fee,
    :result
  ]

  field(:energy_usage, 1, type: :int64)
  field(:energy_fee, 2, type: :int64)
  field(:origin_energy_usage, 3, type: :int64)
  field(:energy_usage_total, 4, type: :int64)
  field(:net_usage, 5, type: :int64)
  field(:net_fee, 6, type: :int64)
  field(:result, 7, type: Tron.Transaction.Result.ContractResult, enum: true)
end

defmodule Tron.Transaction do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          raw_data: Tron.Transaction.Raw.t() | nil,
          signature: [binary],
          ret: [Tron.Transaction.Result.t()]
        }
  defstruct [:raw_data, :signature, :ret]

  field(:raw_data, 1, type: Tron.Transaction.Raw)
  field(:signature, 2, repeated: true, type: :bytes)
  field(:ret, 5, repeated: true, type: Tron.Transaction.Result)
end

defmodule Tron.Transaction.Contract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          type: atom | integer,
          parameter: Google.Protobuf.Any.t() | nil,
          provider: binary,
          ContractName: binary,
          Permission_id: integer
        }
  defstruct [:type, :parameter, :provider, :ContractName, :Permission_id]

  field(:type, 1, type: Tron.Transaction.Contract.ContractType, enum: true)
  field(:parameter, 2, type: Google.Protobuf.Any)
  field(:provider, 3, type: :bytes)
  field(:ContractName, 4, type: :bytes)
  field(:Permission_id, 5, type: :int32)
end

defmodule Tron.Transaction.Contract.ContractType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:AccountCreateContract, 0)
  field(:TransferContract, 1)
  field(:TransferAssetContract, 2)
  field(:VoteAssetContract, 3)
  field(:VoteWitnessContract, 4)
  field(:WitnessCreateContract, 5)
  field(:AssetIssueContract, 6)
  field(:WitnessUpdateContract, 8)
  field(:ParticipateAssetIssueContract, 9)
  field(:AccountUpdateContract, 10)
  field(:FreezeBalanceContract, 11)
  field(:UnfreezeBalanceContract, 12)
  field(:WithdrawBalanceContract, 13)
  field(:UnfreezeAssetContract, 14)
  field(:UpdateAssetContract, 15)
  field(:ProposalCreateContract, 16)
  field(:ProposalApproveContract, 17)
  field(:ProposalDeleteContract, 18)
  field(:SetAccountIdContract, 19)
  field(:CustomContract, 20)
  field(:CreateSmartContract, 30)
  field(:TriggerSmartContract, 31)
  field(:GetContract, 32)
  field(:UpdateSettingContract, 33)
  field(:ExchangeCreateContract, 41)
  field(:ExchangeInjectContract, 42)
  field(:ExchangeWithdrawContract, 43)
  field(:ExchangeTransactionContract, 44)
  field(:UpdateEnergyLimitContract, 45)
  field(:AccountPermissionUpdateContract, 46)
end

defmodule Tron.Transaction.Result do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          fee: integer,
          ret: atom | integer,
          contractRet: atom | integer,
          assetIssueID: String.t(),
          withdraw_amount: integer,
          unfreeze_amount: integer,
          exchange_received_amount: integer,
          exchange_inject_another_amount: integer,
          exchange_withdraw_another_amount: integer,
          exchange_id: integer
        }
  defstruct [
    :fee,
    :ret,
    :contractRet,
    :assetIssueID,
    :withdraw_amount,
    :unfreeze_amount,
    :exchange_received_amount,
    :exchange_inject_another_amount,
    :exchange_withdraw_another_amount,
    :exchange_id
  ]

  field(:fee, 1, type: :int64)
  field(:ret, 2, type: Tron.Transaction.Result.Code, enum: true)
  field(:contractRet, 3, type: Tron.Transaction.Result.ContractResult, enum: true)
  field(:assetIssueID, 14, type: :string)
  field(:withdraw_amount, 15, type: :int64)
  field(:unfreeze_amount, 16, type: :int64)
  field(:exchange_received_amount, 18, type: :int64)
  field(:exchange_inject_another_amount, 19, type: :int64)
  field(:exchange_withdraw_another_amount, 20, type: :int64)
  field(:exchange_id, 21, type: :int64)
end

defmodule Tron.Transaction.Result.Code do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:SUCESS, 0)
  field(:FAILED, 1)
end

defmodule Tron.Transaction.Result.ContractResult do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:DEFAULT, 0)
  field(:SUCCESS, 1)
  field(:REVERT, 2)
  field(:BAD_JUMP_DESTINATION, 3)
  field(:OUT_OF_MEMORY, 4)
  field(:PRECOMPILED_CONTRACT, 5)
  field(:STACK_TOO_SMALL, 6)
  field(:STACK_TOO_LARGE, 7)
  field(:ILLEGAL_OPERATION, 8)
  field(:STACK_OVERFLOW, 9)
  field(:OUT_OF_ENERGY, 10)
  field(:OUT_OF_TIME, 11)
  field(:JVM_STACK_OVER_FLOW, 12)
  field(:UNKNOWN, 13)
end

defmodule Tron.Transaction.Raw do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          ref_block_bytes: binary,
          ref_block_num: integer,
          ref_block_hash: binary,
          expiration: integer,
          auths: [Tron.Authority.t()],
          data: binary,
          contract: [Tron.Transaction.Contract.t()],
          scripts: binary,
          timestamp: integer,
          fee_limit: integer
        }
  defstruct [
    :ref_block_bytes,
    :ref_block_num,
    :ref_block_hash,
    :expiration,
    :auths,
    :data,
    :contract,
    :scripts,
    :timestamp,
    :fee_limit
  ]

  field(:ref_block_bytes, 1, type: :bytes)
  field(:ref_block_num, 3, type: :int64)
  field(:ref_block_hash, 4, type: :bytes)
  field(:expiration, 8, type: :int64)
  field(:auths, 9, repeated: true, type: Tron.Authority)
  field(:data, 10, type: :bytes)
  field(:contract, 11, repeated: true, type: Tron.Transaction.Contract)
  field(:scripts, 12, type: :bytes)
  field(:timestamp, 14, type: :int64)
  field(:fee_limit, 18, type: :int64)
end

defmodule Tron.TransactionInfo do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          id: binary,
          fee: integer,
          blockNumber: integer,
          blockTimeStamp: integer,
          contractResult: [binary],
          contract_address: binary,
          receipt: Tron.ResourceReceipt.t() | nil,
          log: [Tron.TransactionInfo.Log.t()],
          result: atom | integer,
          resMessage: binary,
          assetIssueID: String.t(),
          withdraw_amount: integer,
          unfreeze_amount: integer,
          internal_transactions: [Tron.InternalTransaction.t()],
          exchange_received_amount: integer,
          exchange_inject_another_amount: integer,
          exchange_withdraw_another_amount: integer,
          exchange_id: integer
        }
  defstruct [
    :id,
    :fee,
    :blockNumber,
    :blockTimeStamp,
    :contractResult,
    :contract_address,
    :receipt,
    :log,
    :result,
    :resMessage,
    :assetIssueID,
    :withdraw_amount,
    :unfreeze_amount,
    :internal_transactions,
    :exchange_received_amount,
    :exchange_inject_another_amount,
    :exchange_withdraw_another_amount,
    :exchange_id
  ]

  field(:id, 1, type: :bytes)
  field(:fee, 2, type: :int64)
  field(:blockNumber, 3, type: :int64)
  field(:blockTimeStamp, 4, type: :int64)
  field(:contractResult, 5, repeated: true, type: :bytes)
  field(:contract_address, 6, type: :bytes)
  field(:receipt, 7, type: Tron.ResourceReceipt)
  field(:log, 8, repeated: true, type: Tron.TransactionInfo.Log)
  field(:result, 9, type: Tron.TransactionInfo.Code, enum: true)
  field(:resMessage, 10, type: :bytes)
  field(:assetIssueID, 14, type: :string)
  field(:withdraw_amount, 15, type: :int64)
  field(:unfreeze_amount, 16, type: :int64)
  field(:internal_transactions, 17, repeated: true, type: Tron.InternalTransaction)
  field(:exchange_received_amount, 18, type: :int64)
  field(:exchange_inject_another_amount, 19, type: :int64)
  field(:exchange_withdraw_another_amount, 20, type: :int64)
  field(:exchange_id, 21, type: :int64)
end

defmodule Tron.TransactionInfo.Log do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          address: binary,
          topics: [binary],
          data: binary
        }
  defstruct [:address, :topics, :data]

  field(:address, 1, type: :bytes)
  field(:topics, 2, repeated: true, type: :bytes)
  field(:data, 3, type: :bytes)
end

defmodule Tron.TransactionInfo.Code do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:SUCESS, 0)
  field(:FAILED, 1)
end

defmodule Tron.Transactions do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          transactions: [Tron.Transaction.t()]
        }
  defstruct [:transactions]

  field(:transactions, 1, repeated: true, type: Tron.Transaction)
end

defmodule Tron.TransactionSign do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          transaction: Tron.Transaction.t() | nil,
          privateKey: binary
        }
  defstruct [:transaction, :privateKey]

  field(:transaction, 1, type: Tron.Transaction)
  field(:privateKey, 2, type: :bytes)
end

defmodule Tron.BlockHeader do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          raw_data: Tron.BlockHeader.Raw.t() | nil,
          witness_signature: binary
        }
  defstruct [:raw_data, :witness_signature]

  field(:raw_data, 1, type: Tron.BlockHeader.Raw)
  field(:witness_signature, 2, type: :bytes)
end

defmodule Tron.BlockHeader.Raw do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          timestamp: integer,
          txTrieRoot: binary,
          parentHash: binary,
          number: integer,
          witness_id: integer,
          witness_address: binary,
          version: integer
        }
  defstruct [
    :timestamp,
    :txTrieRoot,
    :parentHash,
    :number,
    :witness_id,
    :witness_address,
    :version
  ]

  field(:timestamp, 1, type: :int64)
  field(:txTrieRoot, 2, type: :bytes)
  field(:parentHash, 3, type: :bytes)
  field(:number, 7, type: :int64)
  field(:witness_id, 8, type: :int64)
  field(:witness_address, 9, type: :bytes)
  field(:version, 10, type: :int32)
end

defmodule Tron.Block do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          transactions: [Tron.Transaction.t()],
          block_header: Tron.BlockHeader.t() | nil
        }
  defstruct [:transactions, :block_header]

  field(:transactions, 1, repeated: true, type: Tron.Transaction)
  field(:block_header, 2, type: Tron.BlockHeader)
end

defmodule Tron.ChainInventory do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          ids: [Tron.ChainInventory.BlockId.t()],
          remain_num: integer
        }
  defstruct [:ids, :remain_num]

  field(:ids, 1, repeated: true, type: Tron.ChainInventory.BlockId)
  field(:remain_num, 2, type: :int64)
end

defmodule Tron.ChainInventory.BlockId do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          hash: binary,
          number: integer
        }
  defstruct [:hash, :number]

  field(:hash, 1, type: :bytes)
  field(:number, 2, type: :int64)
end

defmodule Tron.BlockInventory do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          ids: [Tron.BlockInventory.BlockId.t()],
          type: atom | integer
        }
  defstruct [:ids, :type]

  field(:ids, 1, repeated: true, type: Tron.BlockInventory.BlockId)
  field(:type, 2, type: Tron.BlockInventory.Type, enum: true)
end

defmodule Tron.BlockInventory.BlockId do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          hash: binary,
          number: integer
        }
  defstruct [:hash, :number]

  field(:hash, 1, type: :bytes)
  field(:number, 2, type: :int64)
end

defmodule Tron.BlockInventory.Type do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:SYNC, 0)
  field(:ADVTISE, 1)
  field(:FETCH, 2)
end

defmodule Tron.Inventory do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          type: atom | integer,
          ids: [binary]
        }
  defstruct [:type, :ids]

  field(:type, 1, type: Tron.Inventory.InventoryType, enum: true)
  field(:ids, 2, repeated: true, type: :bytes)
end

defmodule Tron.Inventory.InventoryType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:TRX, 0)
  field(:BLOCK, 1)
end

defmodule Tron.Items do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          type: atom | integer,
          blocks: [Tron.Block.t()],
          block_headers: [Tron.BlockHeader.t()],
          transactions: [Tron.Transaction.t()]
        }
  defstruct [:type, :blocks, :block_headers, :transactions]

  field(:type, 1, type: Tron.Items.ItemType, enum: true)
  field(:blocks, 2, repeated: true, type: Tron.Block)
  field(:block_headers, 3, repeated: true, type: Tron.BlockHeader)
  field(:transactions, 4, repeated: true, type: Tron.Transaction)
end

defmodule Tron.Items.ItemType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:ERR, 0)
  field(:TRX, 1)
  field(:BLOCK, 2)
  field(:BLOCKHEADER, 3)
end

defmodule Tron.DynamicProperties do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          last_solidity_block_num: integer
        }
  defstruct [:last_solidity_block_num]

  field(:last_solidity_block_num, 1, type: :int64)
end

defmodule Tron.DisconnectMessage do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          reason: atom | integer
        }
  defstruct [:reason]

  field(:reason, 1, type: Tron.ReasonCode, enum: true)
end

defmodule Tron.HelloMessage do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          from: Tron.Endpoint.t() | nil,
          version: integer,
          timestamp: integer,
          genesisBlockId: Tron.HelloMessage.BlockId.t() | nil,
          solidBlockId: Tron.HelloMessage.BlockId.t() | nil,
          headBlockId: Tron.HelloMessage.BlockId.t() | nil
        }
  defstruct [:from, :version, :timestamp, :genesisBlockId, :solidBlockId, :headBlockId]

  field(:from, 1, type: Tron.Endpoint)
  field(:version, 2, type: :int32)
  field(:timestamp, 3, type: :int64)
  field(:genesisBlockId, 4, type: Tron.HelloMessage.BlockId)
  field(:solidBlockId, 5, type: Tron.HelloMessage.BlockId)
  field(:headBlockId, 6, type: Tron.HelloMessage.BlockId)
end

defmodule Tron.HelloMessage.BlockId do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          hash: binary,
          number: integer
        }
  defstruct [:hash, :number]

  field(:hash, 1, type: :bytes)
  field(:number, 2, type: :int64)
end

defmodule Tron.SmartContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          origin_address: binary,
          contract_address: binary,
          abi: Tron.SmartContract.ABI.t() | nil,
          bytecode: binary,
          call_value: integer,
          consume_user_resource_percent: integer,
          name: String.t(),
          origin_energy_limit: integer
        }
  defstruct [
    :origin_address,
    :contract_address,
    :abi,
    :bytecode,
    :call_value,
    :consume_user_resource_percent,
    :name,
    :origin_energy_limit
  ]

  field(:origin_address, 1, type: :bytes)
  field(:contract_address, 2, type: :bytes)
  field(:abi, 3, type: Tron.SmartContract.ABI)
  field(:bytecode, 4, type: :bytes)
  field(:call_value, 5, type: :int64)
  field(:consume_user_resource_percent, 6, type: :int64)
  field(:name, 7, type: :string)
  field(:origin_energy_limit, 8, type: :int64)
end

defmodule Tron.SmartContract.ABI do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          entrys: [Tron.SmartContract.ABI.Entry.t()]
        }
  defstruct [:entrys]

  field(:entrys, 1, repeated: true, type: Tron.SmartContract.ABI.Entry)
end

defmodule Tron.SmartContract.ABI.Entry do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          anonymous: boolean,
          constant: boolean,
          name: String.t(),
          inputs: [Tron.SmartContract.ABI.Entry.Param.t()],
          outputs: [Tron.SmartContract.ABI.Entry.Param.t()],
          type: atom | integer,
          payable: boolean,
          stateMutability: atom | integer
        }
  defstruct [:anonymous, :constant, :name, :inputs, :outputs, :type, :payable, :stateMutability]

  field(:anonymous, 1, type: :bool)
  field(:constant, 2, type: :bool)
  field(:name, 3, type: :string)
  field(:inputs, 4, repeated: true, type: Tron.SmartContract.ABI.Entry.Param)
  field(:outputs, 5, repeated: true, type: Tron.SmartContract.ABI.Entry.Param)
  field(:type, 6, type: Tron.SmartContract.ABI.Entry.EntryType, enum: true)
  field(:payable, 7, type: :bool)
  field(:stateMutability, 8, type: Tron.SmartContract.ABI.Entry.StateMutabilityType, enum: true)
end

defmodule Tron.SmartContract.ABI.Entry.Param do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          indexed: boolean,
          name: String.t(),
          type: String.t()
        }
  defstruct [:indexed, :name, :type]

  field(:indexed, 1, type: :bool)
  field(:name, 2, type: :string)
  field(:type, 3, type: :string)
end

defmodule Tron.SmartContract.ABI.Entry.EntryType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:UnknownEntryType, 0)
  field(:Constructor, 1)
  field(:Function, 2)
  field(:Event, 3)
  field(:Fallback, 4)
end

defmodule Tron.SmartContract.ABI.Entry.StateMutabilityType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:UnknownMutabilityType, 0)
  field(:Pure, 1)
  field(:View, 2)
  field(:Nonpayable, 3)
  field(:Payable, 4)
end

defmodule Tron.InternalTransaction do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          hash: binary,
          caller_address: binary,
          transferTo_address: binary,
          callValueInfo: [Tron.InternalTransaction.CallValueInfo.t()],
          note: binary,
          rejected: boolean
        }
  defstruct [:hash, :caller_address, :transferTo_address, :callValueInfo, :note, :rejected]

  field(:hash, 1, type: :bytes)
  field(:caller_address, 2, type: :bytes)
  field(:transferTo_address, 3, type: :bytes)
  field(:callValueInfo, 4, repeated: true, type: Tron.InternalTransaction.CallValueInfo)
  field(:note, 5, type: :bytes)
  field(:rejected, 6, type: :bool)
end

defmodule Tron.InternalTransaction.CallValueInfo do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          callValue: integer,
          tokenId: String.t()
        }
  defstruct [:callValue, :tokenId]

  field(:callValue, 1, type: :int64)
  field(:tokenId, 2, type: :string)
end

defmodule Tron.DelegatedResourceAccountIndex do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          account: binary,
          fromAccounts: [binary],
          toAccounts: [binary]
        }
  defstruct [:account, :fromAccounts, :toAccounts]

  field(:account, 1, type: :bytes)
  field(:fromAccounts, 2, repeated: true, type: :bytes)
  field(:toAccounts, 3, repeated: true, type: :bytes)
end

defmodule Tron.NodeInfo do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          beginSyncNum: integer,
          block: String.t(),
          solidityBlock: String.t(),
          currentConnectCount: integer,
          activeConnectCount: integer,
          passiveConnectCount: integer,
          totalFlow: integer,
          peerInfoList: [Tron.NodeInfo.PeerInfo.t()],
          configNodeInfo: Tron.NodeInfo.ConfigNodeInfo.t() | nil,
          machineInfo: Tron.NodeInfo.MachineInfo.t() | nil,
          cheatWitnessInfoMap: %{String.t() => String.t()}
        }
  defstruct [
    :beginSyncNum,
    :block,
    :solidityBlock,
    :currentConnectCount,
    :activeConnectCount,
    :passiveConnectCount,
    :totalFlow,
    :peerInfoList,
    :configNodeInfo,
    :machineInfo,
    :cheatWitnessInfoMap
  ]

  field(:beginSyncNum, 1, type: :int64)
  field(:block, 2, type: :string)
  field(:solidityBlock, 3, type: :string)
  field(:currentConnectCount, 4, type: :int32)
  field(:activeConnectCount, 5, type: :int32)
  field(:passiveConnectCount, 6, type: :int32)
  field(:totalFlow, 7, type: :int64)
  field(:peerInfoList, 8, repeated: true, type: Tron.NodeInfo.PeerInfo)
  field(:configNodeInfo, 9, type: Tron.NodeInfo.ConfigNodeInfo)
  field(:machineInfo, 10, type: Tron.NodeInfo.MachineInfo)

  field(:cheatWitnessInfoMap, 11,
    repeated: true,
    type: Tron.NodeInfo.CheatWitnessInfoMapEntry,
    map: true
  )
end

defmodule Tron.NodeInfo.CheatWitnessInfoMapEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          value: String.t()
        }
  defstruct [:key, :value]

  field(:key, 1, type: :string)
  field(:value, 2, type: :string)
end

defmodule Tron.NodeInfo.PeerInfo do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          lastSyncBlock: String.t(),
          remainNum: integer,
          lastBlockUpdateTime: integer,
          syncFlag: boolean,
          headBlockTimeWeBothHave: integer,
          needSyncFromPeer: boolean,
          needSyncFromUs: boolean,
          host: String.t(),
          port: integer,
          nodeId: String.t(),
          connectTime: integer,
          avgLatency: float,
          syncToFetchSize: integer,
          syncToFetchSizePeekNum: integer,
          syncBlockRequestedSize: integer,
          unFetchSynNum: integer,
          blockInPorcSize: integer,
          headBlockWeBothHave: String.t(),
          isActive: boolean,
          score: integer,
          nodeCount: integer,
          inFlow: integer,
          disconnectTimes: integer,
          localDisconnectReason: String.t(),
          remoteDisconnectReason: String.t()
        }
  defstruct [
    :lastSyncBlock,
    :remainNum,
    :lastBlockUpdateTime,
    :syncFlag,
    :headBlockTimeWeBothHave,
    :needSyncFromPeer,
    :needSyncFromUs,
    :host,
    :port,
    :nodeId,
    :connectTime,
    :avgLatency,
    :syncToFetchSize,
    :syncToFetchSizePeekNum,
    :syncBlockRequestedSize,
    :unFetchSynNum,
    :blockInPorcSize,
    :headBlockWeBothHave,
    :isActive,
    :score,
    :nodeCount,
    :inFlow,
    :disconnectTimes,
    :localDisconnectReason,
    :remoteDisconnectReason
  ]

  field(:lastSyncBlock, 1, type: :string)
  field(:remainNum, 2, type: :int64)
  field(:lastBlockUpdateTime, 3, type: :int64)
  field(:syncFlag, 4, type: :bool)
  field(:headBlockTimeWeBothHave, 5, type: :int64)
  field(:needSyncFromPeer, 6, type: :bool)
  field(:needSyncFromUs, 7, type: :bool)
  field(:host, 8, type: :string)
  field(:port, 9, type: :int32)
  field(:nodeId, 10, type: :string)
  field(:connectTime, 11, type: :int64)
  field(:avgLatency, 12, type: :double)
  field(:syncToFetchSize, 13, type: :int32)
  field(:syncToFetchSizePeekNum, 14, type: :int64)
  field(:syncBlockRequestedSize, 15, type: :int32)
  field(:unFetchSynNum, 16, type: :int64)
  field(:blockInPorcSize, 17, type: :int32)
  field(:headBlockWeBothHave, 18, type: :string)
  field(:isActive, 19, type: :bool)
  field(:score, 20, type: :int32)
  field(:nodeCount, 21, type: :int32)
  field(:inFlow, 22, type: :int64)
  field(:disconnectTimes, 23, type: :int32)
  field(:localDisconnectReason, 24, type: :string)
  field(:remoteDisconnectReason, 25, type: :string)
end

defmodule Tron.NodeInfo.ConfigNodeInfo do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          codeVersion: String.t(),
          p2pVersion: String.t(),
          listenPort: integer,
          discoverEnable: boolean,
          activeNodeSize: integer,
          passiveNodeSize: integer,
          sendNodeSize: integer,
          maxConnectCount: integer,
          sameIpMaxConnectCount: integer,
          backupListenPort: integer,
          backupMemberSize: integer,
          backupPriority: integer,
          dbVersion: integer,
          minParticipationRate: integer,
          supportConstant: boolean,
          minTimeRatio: float,
          maxTimeRatio: float,
          allowCreationOfContracts: integer,
          allowAdaptiveEnergy: integer
        }
  defstruct [
    :codeVersion,
    :p2pVersion,
    :listenPort,
    :discoverEnable,
    :activeNodeSize,
    :passiveNodeSize,
    :sendNodeSize,
    :maxConnectCount,
    :sameIpMaxConnectCount,
    :backupListenPort,
    :backupMemberSize,
    :backupPriority,
    :dbVersion,
    :minParticipationRate,
    :supportConstant,
    :minTimeRatio,
    :maxTimeRatio,
    :allowCreationOfContracts,
    :allowAdaptiveEnergy
  ]

  field(:codeVersion, 1, type: :string)
  field(:p2pVersion, 2, type: :string)
  field(:listenPort, 3, type: :int32)
  field(:discoverEnable, 4, type: :bool)
  field(:activeNodeSize, 5, type: :int32)
  field(:passiveNodeSize, 6, type: :int32)
  field(:sendNodeSize, 7, type: :int32)
  field(:maxConnectCount, 8, type: :int32)
  field(:sameIpMaxConnectCount, 9, type: :int32)
  field(:backupListenPort, 10, type: :int32)
  field(:backupMemberSize, 11, type: :int32)
  field(:backupPriority, 12, type: :int32)
  field(:dbVersion, 13, type: :int32)
  field(:minParticipationRate, 14, type: :int32)
  field(:supportConstant, 15, type: :bool)
  field(:minTimeRatio, 16, type: :double)
  field(:maxTimeRatio, 17, type: :double)
  field(:allowCreationOfContracts, 18, type: :int64)
  field(:allowAdaptiveEnergy, 19, type: :int64)
end

defmodule Tron.NodeInfo.MachineInfo do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          threadCount: integer,
          deadLockThreadCount: integer,
          cpuCount: integer,
          totalMemory: integer,
          freeMemory: integer,
          cpuRate: float,
          javaVersion: String.t(),
          osName: String.t(),
          jvmTotalMemoery: integer,
          jvmFreeMemory: integer,
          processCpuRate: float,
          memoryDescInfoList: [Tron.NodeInfo.MachineInfo.MemoryDescInfo.t()],
          deadLockThreadInfoList: [Tron.NodeInfo.MachineInfo.DeadLockThreadInfo.t()]
        }
  defstruct [
    :threadCount,
    :deadLockThreadCount,
    :cpuCount,
    :totalMemory,
    :freeMemory,
    :cpuRate,
    :javaVersion,
    :osName,
    :jvmTotalMemoery,
    :jvmFreeMemory,
    :processCpuRate,
    :memoryDescInfoList,
    :deadLockThreadInfoList
  ]

  field(:threadCount, 1, type: :int32)
  field(:deadLockThreadCount, 2, type: :int32)
  field(:cpuCount, 3, type: :int32)
  field(:totalMemory, 4, type: :int64)
  field(:freeMemory, 5, type: :int64)
  field(:cpuRate, 6, type: :double)
  field(:javaVersion, 7, type: :string)
  field(:osName, 8, type: :string)
  field(:jvmTotalMemoery, 9, type: :int64)
  field(:jvmFreeMemory, 10, type: :int64)
  field(:processCpuRate, 11, type: :double)
  field(:memoryDescInfoList, 12, repeated: true, type: Tron.NodeInfo.MachineInfo.MemoryDescInfo)

  field(:deadLockThreadInfoList, 13,
    repeated: true,
    type: Tron.NodeInfo.MachineInfo.DeadLockThreadInfo
  )
end

defmodule Tron.NodeInfo.MachineInfo.MemoryDescInfo do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          name: String.t(),
          initSize: integer,
          useSize: integer,
          maxSize: integer,
          useRate: float
        }
  defstruct [:name, :initSize, :useSize, :maxSize, :useRate]

  field(:name, 1, type: :string)
  field(:initSize, 2, type: :int64)
  field(:useSize, 3, type: :int64)
  field(:maxSize, 4, type: :int64)
  field(:useRate, 5, type: :double)
end

defmodule Tron.NodeInfo.MachineInfo.DeadLockThreadInfo do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          name: String.t(),
          lockName: String.t(),
          lockOwner: String.t(),
          state: String.t(),
          blockTime: integer,
          waitTime: integer,
          stackTrace: String.t()
        }
  defstruct [:name, :lockName, :lockOwner, :state, :blockTime, :waitTime, :stackTrace]

  field(:name, 1, type: :string)
  field(:lockName, 2, type: :string)
  field(:lockOwner, 3, type: :string)
  field(:state, 4, type: :string)
  field(:blockTime, 5, type: :int64)
  field(:waitTime, 6, type: :int64)
  field(:stackTrace, 7, type: :string)
end

defmodule Tron.AccountType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:Normal, 0)
  field(:AssetIssue, 1)
  field(:Contract, 2)
end

defmodule Tron.ReasonCode do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field(:REQUESTED, 0)
  field(:BAD_PROTOCOL, 2)
  field(:TOO_MANY_PEERS, 4)
  field(:DUPLICATE_PEER, 5)
  field(:INCOMPATIBLE_PROTOCOL, 6)
  field(:NULL_IDENTITY, 7)
  field(:PEER_QUITING, 8)
  field(:UNEXPECTED_IDENTITY, 9)
  field(:LOCAL_IDENTITY, 10)
  field(:PING_TIMEOUT, 11)
  field(:USER_REASON, 16)
  field(:RESET, 17)
  field(:SYNC_FAIL, 18)
  field(:FETCH_FAIL, 19)
  field(:BAD_TX, 20)
  field(:BAD_BLOCK, 21)
  field(:FORKED, 22)
  field(:UNLINKABLE, 23)
  field(:INCOMPATIBLE_VERSION, 24)
  field(:INCOMPATIBLE_CHAIN, 25)
  field(:TIME_OUT, 32)
  field(:CONNECT_FAIL, 33)
  field(:TOO_MANY_PEERS_WITH_SAME_IP, 34)
  field(:UNKNOWN, 255)
end
