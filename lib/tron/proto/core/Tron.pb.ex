defmodule Protocol.AccountId do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          name: String.t(),
          address: String.t()
        }
  defstruct [:name, :address]

  field :name, 1, type: :bytes
  field :address, 2, type: :bytes
end

defmodule Protocol.Vote do
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

defmodule Protocol.Proposal do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          proposal_id: integer,
          proposer_address: String.t(),
          parameters: %{integer => integer},
          expiration_time: integer,
          create_time: integer,
          approvals: [String.t()],
          state: integer
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

  field :proposal_id, 1, type: :int64
  field :proposer_address, 2, type: :bytes
  field :parameters, 3, repeated: true, type: Protocol.Proposal.ParametersEntry, map: true
  field :expiration_time, 4, type: :int64
  field :create_time, 5, type: :int64
  field :approvals, 6, repeated: true, type: :bytes
  field :state, 7, type: Protocol.Proposal.State, enum: true
end

defmodule Protocol.Proposal.ParametersEntry do
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

defmodule Protocol.Proposal.State do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field :PENDING, 0
  field :DISAPPROVED, 1
  field :APPROVED, 2
  field :CANCELED, 3
end

defmodule Protocol.Exchange do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          exchange_id: integer,
          creator_address: String.t(),
          create_time: integer,
          first_token_id: String.t(),
          first_token_balance: integer,
          second_token_id: String.t(),
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

  field :exchange_id, 1, type: :int64
  field :creator_address, 2, type: :bytes
  field :create_time, 3, type: :int64
  field :first_token_id, 6, type: :bytes
  field :first_token_balance, 7, type: :int64
  field :second_token_id, 8, type: :bytes
  field :second_token_balance, 9, type: :int64
end

defmodule Protocol.ChainParameters do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          chainParameter: [Protocol.ChainParameters.ChainParameter.t()]
        }
  defstruct [:chainParameter]

  field :chainParameter, 1, repeated: true, type: Protocol.ChainParameters.ChainParameter
end

defmodule Protocol.ChainParameters.ChainParameter do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          value: integer
        }
  defstruct [:key, :value]

  field :key, 1, type: :string
  field :value, 2, type: :int64
end

defmodule Protocol.Account do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          account_name: String.t(),
          type: integer,
          address: String.t(),
          balance: integer,
          votes: [Protocol.Vote.t()],
          asset: %{String.t() => integer},
          frozen: [Protocol.Account.Frozen.t()],
          net_usage: integer,
          create_time: integer,
          latest_opration_time: integer,
          allowance: integer,
          latest_withdraw_time: integer,
          code: String.t(),
          is_witness: boolean,
          is_committee: boolean,
          frozen_supply: [Protocol.Account.Frozen.t()],
          asset_issued_name: String.t(),
          latest_asset_operation_time: %{String.t() => integer},
          free_net_usage: integer,
          free_asset_net_usage: %{String.t() => integer},
          latest_consume_time: integer,
          latest_consume_free_time: integer,
          account_id: String.t(),
          account_resource: Protocol.Account.AccountResource.t(),
          codeHash: String.t()
        }
  defstruct [
    :account_name,
    :type,
    :address,
    :balance,
    :votes,
    :asset,
    :frozen,
    :net_usage,
    :create_time,
    :latest_opration_time,
    :allowance,
    :latest_withdraw_time,
    :code,
    :is_witness,
    :is_committee,
    :frozen_supply,
    :asset_issued_name,
    :latest_asset_operation_time,
    :free_net_usage,
    :free_asset_net_usage,
    :latest_consume_time,
    :latest_consume_free_time,
    :account_id,
    :account_resource,
    :codeHash
  ]

  field :account_name, 1, type: :bytes
  field :type, 2, type: Protocol.AccountType, enum: true
  field :address, 3, type: :bytes
  field :balance, 4, type: :int64
  field :votes, 5, repeated: true, type: Protocol.Vote
  field :asset, 6, repeated: true, type: Protocol.Account.AssetEntry, map: true
  field :frozen, 7, repeated: true, type: Protocol.Account.Frozen
  field :net_usage, 8, type: :int64
  field :create_time, 9, type: :int64
  field :latest_opration_time, 10, type: :int64
  field :allowance, 11, type: :int64
  field :latest_withdraw_time, 12, type: :int64
  field :code, 13, type: :bytes
  field :is_witness, 14, type: :bool
  field :is_committee, 15, type: :bool
  field :frozen_supply, 16, repeated: true, type: Protocol.Account.Frozen
  field :asset_issued_name, 17, type: :bytes

  field :latest_asset_operation_time, 18,
    repeated: true,
    type: Protocol.Account.LatestAssetOperationTimeEntry,
    map: true

  field :free_net_usage, 19, type: :int64

  field :free_asset_net_usage, 20,
    repeated: true,
    type: Protocol.Account.FreeAssetNetUsageEntry,
    map: true

  field :latest_consume_time, 21, type: :int64
  field :latest_consume_free_time, 22, type: :int64
  field :account_id, 23, type: :bytes
  field :account_resource, 26, type: Protocol.Account.AccountResource
  field :codeHash, 30, type: :bytes
end

defmodule Protocol.Account.Frozen do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          frozen_balance: integer,
          expire_time: integer
        }
  defstruct [:frozen_balance, :expire_time]

  field :frozen_balance, 1, type: :int64
  field :expire_time, 2, type: :int64
end

defmodule Protocol.Account.AssetEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          value: integer
        }
  defstruct [:key, :value]

  field :key, 1, type: :string
  field :value, 2, type: :int64
end

defmodule Protocol.Account.LatestAssetOperationTimeEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          value: integer
        }
  defstruct [:key, :value]

  field :key, 1, type: :string
  field :value, 2, type: :int64
end

defmodule Protocol.Account.FreeAssetNetUsageEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          value: integer
        }
  defstruct [:key, :value]

  field :key, 1, type: :string
  field :value, 2, type: :int64
end

defmodule Protocol.Account.AccountResource do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          energy_usage: integer,
          frozen_balance_for_energy: Protocol.Account.Frozen.t(),
          latest_consume_time_for_energy: integer,
          storage_limit: integer,
          storage_usage: integer,
          latest_exchange_storage_time: integer
        }
  defstruct [
    :energy_usage,
    :frozen_balance_for_energy,
    :latest_consume_time_for_energy,
    :storage_limit,
    :storage_usage,
    :latest_exchange_storage_time
  ]

  field :energy_usage, 1, type: :int64
  field :frozen_balance_for_energy, 2, type: Protocol.Account.Frozen
  field :latest_consume_time_for_energy, 3, type: :int64
  field :storage_limit, 6, type: :int64
  field :storage_usage, 7, type: :int64
  field :latest_exchange_storage_time, 8, type: :int64
end

defmodule Protocol.Authority do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          account: Protocol.AccountId.t(),
          permission_name: String.t()
        }
  defstruct [:account, :permission_name]

  field :account, 1, type: Protocol.AccountId
  field :permission_name, 2, type: :bytes
end

defmodule Protocol.Permission do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          account: Protocol.AccountId.t()
        }
  defstruct [:account]

  field :account, 1, type: Protocol.AccountId
end

defmodule Protocol.Witness do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          address: String.t(),
          voteCount: integer,
          pubKey: String.t(),
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

  field :address, 1, type: :bytes
  field :voteCount, 2, type: :int64
  field :pubKey, 3, type: :bytes
  field :url, 4, type: :string
  field :totalProduced, 5, type: :int64
  field :totalMissed, 6, type: :int64
  field :latestBlockNum, 7, type: :int64
  field :latestSlotNum, 8, type: :int64
  field :isJobs, 9, type: :bool
end

defmodule Protocol.Votes do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          address: String.t(),
          old_votes: [Protocol.Vote.t()],
          new_votes: [Protocol.Vote.t()]
        }
  defstruct [:address, :old_votes, :new_votes]

  field :address, 1, type: :bytes
  field :old_votes, 2, repeated: true, type: Protocol.Vote
  field :new_votes, 3, repeated: true, type: Protocol.Vote
end

defmodule Protocol.TXOutput do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          value: integer,
          pubKeyHash: String.t()
        }
  defstruct [:value, :pubKeyHash]

  field :value, 1, type: :int64
  field :pubKeyHash, 2, type: :bytes
end

defmodule Protocol.TXInput do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          raw_data: Protocol.TXInput.Raw.t(),
          signature: String.t()
        }
  defstruct [:raw_data, :signature]

  field :raw_data, 1, type: Protocol.TXInput.Raw
  field :signature, 4, type: :bytes
end

defmodule Protocol.TXInput.Raw do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          txID: String.t(),
          vout: integer,
          pubKey: String.t()
        }
  defstruct [:txID, :vout, :pubKey]

  field :txID, 1, type: :bytes
  field :vout, 2, type: :int64
  field :pubKey, 3, type: :bytes
end

defmodule Protocol.TXOutputs do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          outputs: [Protocol.TXOutput.t()]
        }
  defstruct [:outputs]

  field :outputs, 1, repeated: true, type: Protocol.TXOutput
end

defmodule Protocol.ResourceReceipt do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          energy_usage: integer,
          energy_fee: integer,
          origin_energy_usage: integer,
          energy_usage_total: integer,
          net_usage: integer,
          net_fee: integer,
          result: integer
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

  field :energy_usage, 1, type: :int64
  field :energy_fee, 2, type: :int64
  field :origin_energy_usage, 3, type: :int64
  field :energy_usage_total, 4, type: :int64
  field :net_usage, 5, type: :int64
  field :net_fee, 6, type: :int64
  field :result, 7, type: Protocol.Transaction.Result.ContractResult, enum: true
end

defmodule Protocol.Transaction do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          raw_data: Protocol.Transaction.Raw.t(),
          signature: [String.t()],
          ret: [Protocol.Transaction.Result.t()]
        }
  defstruct [:raw_data, :signature, :ret]

  field :raw_data, 1, type: Protocol.Transaction.Raw
  field :signature, 2, repeated: true, type: :bytes
  field :ret, 5, repeated: true, type: Protocol.Transaction.Result
end

defmodule Protocol.Transaction.Contract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          type: integer,
          parameter: Google.Protobuf.Any.t(),
          provider: String.t(),
          ContractName: String.t()
        }
  defstruct [:type, :parameter, :provider, :ContractName]

  field :type, 1, type: Protocol.Transaction.Contract.ContractType, enum: true
  field :parameter, 2, type: Google.Protobuf.Any
  field :provider, 3, type: :bytes
  field :ContractName, 4, type: :bytes
end

defmodule Protocol.Transaction.Contract.ContractType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field :AccountCreateContract, 0
  field :TransferContract, 1
  field :TransferAssetContract, 2
  field :VoteAssetContract, 3
  field :VoteWitnessContract, 4
  field :WitnessCreateContract, 5
  field :AssetIssueContract, 6
  field :WitnessUpdateContract, 8
  field :ParticipateAssetIssueContract, 9
  field :AccountUpdateContract, 10
  field :FreezeBalanceContract, 11
  field :UnfreezeBalanceContract, 12
  field :WithdrawBalanceContract, 13
  field :UnfreezeAssetContract, 14
  field :UpdateAssetContract, 15
  field :ProposalCreateContract, 16
  field :ProposalApproveContract, 17
  field :ProposalDeleteContract, 18
  field :SetAccountIdContract, 19
  field :CustomContract, 20
  field :CreateSmartContract, 30
  field :TriggerSmartContract, 31
  field :GetContract, 32
  field :UpdateSettingContract, 33
  field :ExchangeCreateContract, 41
  field :ExchangeInjectContract, 42
  field :ExchangeWithdrawContract, 43
  field :ExchangeTransactionContract, 44
end

defmodule Protocol.Transaction.Result do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          fee: integer,
          ret: integer,
          contractRet: integer,
          withdraw_amount: integer,
          unfreeze_amount: integer
        }
  defstruct [:fee, :ret, :contractRet, :withdraw_amount, :unfreeze_amount]

  field :fee, 1, type: :int64
  field :ret, 2, type: Protocol.Transaction.Result.Code, enum: true
  field :contractRet, 3, type: Protocol.Transaction.Result.ContractResult, enum: true
  field :withdraw_amount, 15, type: :int64
  field :unfreeze_amount, 16, type: :int64
end

defmodule Protocol.Transaction.Result.Code do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field :SUCESS, 0
  field :FAILED, 1
end

defmodule Protocol.Transaction.Result.ContractResult do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field :DEFAULT, 0
  field :SUCCESS, 1
  field :REVERT, 2
  field :BAD_JUMP_DESTINATION, 3
  field :OUT_OF_MEMORY, 4
  field :PRECOMPILED_CONTRACT, 5
  field :STACK_TOO_SMALL, 6
  field :STACK_TOO_LARGE, 7
  field :ILLEGAL_OPERATION, 8
  field :STACK_OVERFLOW, 9
  field :OUT_OF_ENERGY, 10
  field :OUT_OF_TIME, 11
  field :JVM_STACK_OVER_FLOW, 12
  field :UNKNOWN, 13
end

defmodule Protocol.Transaction.Raw do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          ref_block_bytes: String.t(),
          ref_block_num: integer,
          ref_block_hash: String.t(),
          expiration: integer,
          auths: [Protocol.Authority.t()],
          data: String.t(),
          contract: [Protocol.Transaction.Contract.t()],
          scripts: String.t(),
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

  field :ref_block_bytes, 1, type: :bytes
  field :ref_block_num, 3, type: :int64
  field :ref_block_hash, 4, type: :bytes
  field :expiration, 8, type: :int64
  field :auths, 9, repeated: true, type: Protocol.Authority
  field :data, 10, type: :bytes
  field :contract, 11, repeated: true, type: Protocol.Transaction.Contract
  field :scripts, 12, type: :bytes
  field :timestamp, 14, type: :int64
  field :fee_limit, 18, type: :int64
end

defmodule Protocol.TransactionInfo do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          id: String.t(),
          fee: integer,
          blockNumber: integer,
          blockTimeStamp: integer,
          contractResult: [String.t()],
          contract_address: String.t(),
          receipt: Protocol.ResourceReceipt.t(),
          log: [Protocol.TransactionInfo.Log.t()],
          result: integer,
          resMessage: String.t(),
          withdraw_amount: integer,
          unfreeze_amount: integer,
          internal_transactions: [Protocol.InternalTransaction.t()]
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
    :withdraw_amount,
    :unfreeze_amount,
    :internal_transactions
  ]

  field :id, 1, type: :bytes
  field :fee, 2, type: :int64
  field :blockNumber, 3, type: :int64
  field :blockTimeStamp, 4, type: :int64
  field :contractResult, 5, repeated: true, type: :bytes
  field :contract_address, 6, type: :bytes
  field :receipt, 7, type: Protocol.ResourceReceipt
  field :log, 8, repeated: true, type: Protocol.TransactionInfo.Log
  field :result, 9, type: Protocol.TransactionInfo.Code, enum: true
  field :resMessage, 10, type: :bytes
  field :withdraw_amount, 15, type: :int64
  field :unfreeze_amount, 16, type: :int64
  field :internal_transactions, 17, repeated: true, type: Protocol.InternalTransaction
end

defmodule Protocol.TransactionInfo.Log do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          address: String.t(),
          topics: [String.t()],
          data: String.t()
        }
  defstruct [:address, :topics, :data]

  field :address, 1, type: :bytes
  field :topics, 2, repeated: true, type: :bytes
  field :data, 3, type: :bytes
end

defmodule Protocol.TransactionInfo.Code do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field :SUCESS, 0
  field :FAILED, 1
end

defmodule Protocol.Transactions do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          transactions: [Protocol.Transaction.t()]
        }
  defstruct [:transactions]

  field :transactions, 1, repeated: true, type: Protocol.Transaction
end

defmodule Protocol.TransactionSign do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          transaction: Protocol.Transaction.t(),
          privateKey: String.t()
        }
  defstruct [:transaction, :privateKey]

  field :transaction, 1, type: Protocol.Transaction
  field :privateKey, 2, type: :bytes
end

defmodule Protocol.BlockHeader do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          raw_data: Protocol.BlockHeader.Raw.t(),
          witness_signature: String.t()
        }
  defstruct [:raw_data, :witness_signature]

  field :raw_data, 1, type: Protocol.BlockHeader.Raw
  field :witness_signature, 2, type: :bytes
end

defmodule Protocol.BlockHeader.Raw do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          timestamp: integer,
          txTrieRoot: String.t(),
          parentHash: String.t(),
          number: integer,
          witness_id: integer,
          witness_address: String.t(),
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

  field :timestamp, 1, type: :int64
  field :txTrieRoot, 2, type: :bytes
  field :parentHash, 3, type: :bytes
  field :number, 7, type: :int64
  field :witness_id, 8, type: :int64
  field :witness_address, 9, type: :bytes
  field :version, 10, type: :int32
end

defmodule Protocol.Block do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          transactions: [Protocol.Transaction.t()],
          block_header: Protocol.BlockHeader.t()
        }
  defstruct [:transactions, :block_header]

  field :transactions, 1, repeated: true, type: Protocol.Transaction
  field :block_header, 2, type: Protocol.BlockHeader
end

defmodule Protocol.ChainInventory do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          ids: [Protocol.ChainInventory.BlockId.t()],
          remain_num: integer
        }
  defstruct [:ids, :remain_num]

  field :ids, 1, repeated: true, type: Protocol.ChainInventory.BlockId
  field :remain_num, 2, type: :int64
end

defmodule Protocol.ChainInventory.BlockId do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          hash: String.t(),
          number: integer
        }
  defstruct [:hash, :number]

  field :hash, 1, type: :bytes
  field :number, 2, type: :int64
end

defmodule Protocol.BlockInventory do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          ids: [Protocol.BlockInventory.BlockId.t()],
          type: integer
        }
  defstruct [:ids, :type]

  field :ids, 1, repeated: true, type: Protocol.BlockInventory.BlockId
  field :type, 2, type: Protocol.BlockInventory.Type, enum: true
end

defmodule Protocol.BlockInventory.BlockId do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          hash: String.t(),
          number: integer
        }
  defstruct [:hash, :number]

  field :hash, 1, type: :bytes
  field :number, 2, type: :int64
end

defmodule Protocol.BlockInventory.Type do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field :SYNC, 0
  field :ADVTISE, 1
  field :FETCH, 2
end

defmodule Protocol.Inventory do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          type: integer,
          ids: [String.t()]
        }
  defstruct [:type, :ids]

  field :type, 1, type: Protocol.Inventory.InventoryType, enum: true
  field :ids, 2, repeated: true, type: :bytes
end

defmodule Protocol.Inventory.InventoryType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field :TRX, 0
  field :BLOCK, 1
end

defmodule Protocol.Items do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          type: integer,
          blocks: [Protocol.Block.t()],
          block_headers: [Protocol.BlockHeader.t()],
          transactions: [Protocol.Transaction.t()]
        }
  defstruct [:type, :blocks, :block_headers, :transactions]

  field :type, 1, type: Protocol.Items.ItemType, enum: true
  field :blocks, 2, repeated: true, type: Protocol.Block
  field :block_headers, 3, repeated: true, type: Protocol.BlockHeader
  field :transactions, 4, repeated: true, type: Protocol.Transaction
end

defmodule Protocol.Items.ItemType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field :ERR, 0
  field :TRX, 1
  field :BLOCK, 2
  field :BLOCKHEADER, 3
end

defmodule Protocol.DynamicProperties do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          last_solidity_block_num: integer
        }
  defstruct [:last_solidity_block_num]

  field :last_solidity_block_num, 1, type: :int64
end

defmodule Protocol.DisconnectMessage do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          reason: integer
        }
  defstruct [:reason]

  field :reason, 1, type: Protocol.ReasonCode, enum: true
end

defmodule Protocol.HelloMessage do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          from: Protocol.Endpoint.t(),
          version: integer,
          timestamp: integer,
          genesisBlockId: Protocol.HelloMessage.BlockId.t(),
          solidBlockId: Protocol.HelloMessage.BlockId.t(),
          headBlockId: Protocol.HelloMessage.BlockId.t()
        }
  defstruct [:from, :version, :timestamp, :genesisBlockId, :solidBlockId, :headBlockId]

  field :from, 1, type: Protocol.Endpoint
  field :version, 2, type: :int32
  field :timestamp, 3, type: :int64
  field :genesisBlockId, 4, type: Protocol.HelloMessage.BlockId
  field :solidBlockId, 5, type: Protocol.HelloMessage.BlockId
  field :headBlockId, 6, type: Protocol.HelloMessage.BlockId
end

defmodule Protocol.HelloMessage.BlockId do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          hash: String.t(),
          number: integer
        }
  defstruct [:hash, :number]

  field :hash, 1, type: :bytes
  field :number, 2, type: :int64
end

defmodule Protocol.SmartContract do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          origin_address: String.t(),
          contract_address: String.t(),
          abi: Protocol.SmartContract.ABI.t(),
          bytecode: String.t(),
          call_value: integer,
          consume_user_resource_percent: integer,
          name: String.t(),
          energy_limit: integer
        }
  defstruct [
    :origin_address,
    :contract_address,
    :abi,
    :bytecode,
    :call_value,
    :consume_user_resource_percent,
    :name,
    :energy_limit
  ]

  field :origin_address, 1, type: :bytes
  field :contract_address, 2, type: :bytes
  field :abi, 3, type: Protocol.SmartContract.ABI
  field :bytecode, 4, type: :bytes
  field :call_value, 5, type: :int64
  field :consume_user_resource_percent, 6, type: :int64
  field :name, 7, type: :string
  field :energy_limit, 8, type: :int64
end

defmodule Protocol.SmartContract.ABI do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          entrys: [Protocol.SmartContract.ABI.Entry.t()]
        }
  defstruct [:entrys]

  field :entrys, 1, repeated: true, type: Protocol.SmartContract.ABI.Entry
end

defmodule Protocol.SmartContract.ABI.Entry do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          anonymous: boolean,
          constant: boolean,
          name: String.t(),
          inputs: [Protocol.SmartContract.ABI.Entry.Param.t()],
          outputs: [Protocol.SmartContract.ABI.Entry.Param.t()],
          type: integer,
          payable: boolean,
          stateMutability: integer
        }
  defstruct [:anonymous, :constant, :name, :inputs, :outputs, :type, :payable, :stateMutability]

  field :anonymous, 1, type: :bool
  field :constant, 2, type: :bool
  field :name, 3, type: :string
  field :inputs, 4, repeated: true, type: Protocol.SmartContract.ABI.Entry.Param
  field :outputs, 5, repeated: true, type: Protocol.SmartContract.ABI.Entry.Param
  field :type, 6, type: Protocol.SmartContract.ABI.Entry.EntryType, enum: true
  field :payable, 7, type: :bool

  field :stateMutability, 8,
    type: Protocol.SmartContract.ABI.Entry.StateMutabilityType,
    enum: true
end

defmodule Protocol.SmartContract.ABI.Entry.Param do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          indexed: boolean,
          name: String.t(),
          type: String.t()
        }
  defstruct [:indexed, :name, :type]

  field :indexed, 1, type: :bool
  field :name, 2, type: :string
  field :type, 3, type: :string
end

defmodule Protocol.SmartContract.ABI.Entry.EntryType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field :UnknownEntryType, 0
  field :Constructor, 1
  field :Function, 2
  field :Event, 3
  field :Fallback, 4
end

defmodule Protocol.SmartContract.ABI.Entry.StateMutabilityType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field :UnknownMutabilityType, 0
  field :Pure, 1
  field :View, 2
  field :Nonpayable, 3
  field :Payable, 4
end

defmodule Protocol.InternalTransaction do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          hash: String.t(),
          caller_address: String.t(),
          transferTo_address: String.t(),
          callValueInfo: [Protocol.InternalTransaction.CallValueInfo.t()],
          note: String.t(),
          rejected: boolean
        }
  defstruct [:hash, :caller_address, :transferTo_address, :callValueInfo, :note, :rejected]

  field :hash, 1, type: :bytes
  field :caller_address, 2, type: :bytes
  field :transferTo_address, 3, type: :bytes
  field :callValueInfo, 4, repeated: true, type: Protocol.InternalTransaction.CallValueInfo
  field :note, 5, type: :bytes
  field :rejected, 6, type: :bool
end

defmodule Protocol.InternalTransaction.CallValueInfo do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          callValue: integer,
          tokenName: String.t()
        }
  defstruct [:callValue, :tokenName]

  field :callValue, 1, type: :int64
  field :tokenName, 2, type: :bytes
end

defmodule Protocol.AccountType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field :Normal, 0
  field :AssetIssue, 1
  field :Contract, 2
end

defmodule Protocol.ReasonCode do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field :REQUESTED, 0
  field :BAD_PROTOCOL, 2
  field :TOO_MANY_PEERS, 4
  field :DUPLICATE_PEER, 5
  field :INCOMPATIBLE_PROTOCOL, 6
  field :NULL_IDENTITY, 7
  field :PEER_QUITING, 8
  field :UNEXPECTED_IDENTITY, 9
  field :LOCAL_IDENTITY, 10
  field :PING_TIMEOUT, 11
  field :USER_REASON, 16
  field :RESET, 17
  field :SYNC_FAIL, 18
  field :FETCH_FAIL, 19
  field :BAD_TX, 20
  field :BAD_BLOCK, 21
  field :FORKED, 22
  field :UNLINKABLE, 23
  field :INCOMPATIBLE_VERSION, 24
  field :INCOMPATIBLE_CHAIN, 25
  field :TIME_OUT, 32
  field :CONNECT_FAIL, 33
  field :TOO_MANY_PEERS_WITH_SAME_IP, 34
  field :UNKNOWN, 255
end
