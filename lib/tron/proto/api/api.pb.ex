defmodule Tron.Return do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          result: boolean,
          code: integer,
          message: String.t()
        }
  defstruct [:result, :code, :message]

  field :result, 1, type: :bool
  field :code, 2, type: Tron.Return.ResponseCode, enum: true
  field :message, 3, type: :bytes
end

defmodule Tron.Return.ResponseCode do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field :SUCCESS, 0
  field :SIGERROR, 1
  field :CONTRACT_VALIDATE_ERROR, 2
  field :CONTRACT_EXE_ERROR, 3
  field :BANDWITH_ERROR, 4
  field :DUP_TRANSACTION_ERROR, 5
  field :TAPOS_ERROR, 6
  field :TOO_BIG_TRANSACTION_ERROR, 7
  field :TRANSACTION_EXPIRATION_ERROR, 8
  field :SERVER_BUSY, 9
  field :OTHER_ERROR, 20
end

defmodule Tron.BlockReference do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          block_num: integer,
          block_hash: String.t()
        }
  defstruct [:block_num, :block_hash]

  field :block_num, 1, type: :int64
  field :block_hash, 2, type: :bytes
end

defmodule Tron.WitnessList do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          witnesses: [Tron.Witness.t()]
        }
  defstruct [:witnesses]

  field :witnesses, 1, repeated: true, type: Tron.Witness
end

defmodule Tron.ProposalList do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          proposals: [Tron.Proposal.t()]
        }
  defstruct [:proposals]

  field :proposals, 1, repeated: true, type: Tron.Proposal
end

defmodule Tron.ExchangeList do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          exchanges: [Tron.Exchange.t()]
        }
  defstruct [:exchanges]

  field :exchanges, 1, repeated: true, type: Tron.Exchange
end

defmodule Tron.AssetIssueList do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          assetIssue: [Tron.AssetIssueContract.t()]
        }
  defstruct [:assetIssue]

  field :assetIssue, 1, repeated: true, type: Tron.AssetIssueContract
end

defmodule Tron.BlockList do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          block: [Tron.Block.t()]
        }
  defstruct [:block]

  field :block, 1, repeated: true, type: Tron.Block
end

defmodule Tron.TransactionList do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          transaction: [Tron.Transaction.t()]
        }
  defstruct [:transaction]

  field :transaction, 1, repeated: true, type: Tron.Transaction
end

defmodule Tron.NodeList do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          nodes: [Tron.Node.t()]
        }
  defstruct [:nodes]

  field :nodes, 1, repeated: true, type: Tron.Node
end

defmodule Tron.Node do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          address: Tron.Address.t() | nil
        }
  defstruct [:address]

  field :address, 1, type: Tron.Address
end

defmodule Tron.Address do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          host: String.t(),
          port: integer
        }
  defstruct [:host, :port]

  field :host, 1, type: :bytes
  field :port, 2, type: :int32
end

defmodule Tron.EmptyMessage do
  @moduledoc false
  use Protobuf, syntax: :proto3

  defstruct []
end

defmodule Tron.NumberMessage do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          num: integer
        }
  defstruct [:num]

  field :num, 1, type: :int64
end

defmodule Tron.BytesMessage do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          value: String.t()
        }
  defstruct [:value]

  field :value, 1, type: :bytes
end

defmodule Tron.TimeMessage do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          beginInMilliseconds: integer,
          endInMilliseconds: integer
        }
  defstruct [:beginInMilliseconds, :endInMilliseconds]

  field :beginInMilliseconds, 1, type: :int64
  field :endInMilliseconds, 2, type: :int64
end

defmodule Tron.BlockLimit do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          startNum: integer,
          endNum: integer
        }
  defstruct [:startNum, :endNum]

  field :startNum, 1, type: :int64
  field :endNum, 2, type: :int64
end

defmodule Tron.TransactionLimit do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          transactionId: String.t(),
          limitNum: integer
        }
  defstruct [:transactionId, :limitNum]

  field :transactionId, 1, type: :bytes
  field :limitNum, 2, type: :int64
end

defmodule Tron.AccountPaginated do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          account: Tron.Account.t() | nil,
          offset: integer,
          limit: integer
        }
  defstruct [:account, :offset, :limit]

  field :account, 1, type: Tron.Account
  field :offset, 2, type: :int64
  field :limit, 3, type: :int64
end

defmodule Tron.TimePaginatedMessage do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          timeMessage: Tron.TimeMessage.t() | nil,
          offset: integer,
          limit: integer
        }
  defstruct [:timeMessage, :offset, :limit]

  field :timeMessage, 1, type: Tron.TimeMessage
  field :offset, 2, type: :int64
  field :limit, 3, type: :int64
end

defmodule Tron.AccountNetMessage do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          freeNetUsed: integer,
          freeNetLimit: integer,
          NetUsed: integer,
          NetLimit: integer,
          assetNetUsed: %{String.t() => integer},
          assetNetLimit: %{String.t() => integer},
          TotalNetLimit: integer,
          TotalNetWeight: integer
        }
  defstruct [
    :freeNetUsed,
    :freeNetLimit,
    :NetUsed,
    :NetLimit,
    :assetNetUsed,
    :assetNetLimit,
    :TotalNetLimit,
    :TotalNetWeight
  ]

  field :freeNetUsed, 1, type: :int64
  field :freeNetLimit, 2, type: :int64
  field :NetUsed, 3, type: :int64
  field :NetLimit, 4, type: :int64

  field :assetNetUsed, 5,
    repeated: true,
    type: Tron.AccountNetMessage.AssetNetUsedEntry,
    map: true

  field :assetNetLimit, 6,
    repeated: true,
    type: Tron.AccountNetMessage.AssetNetLimitEntry,
    map: true

  field :TotalNetLimit, 7, type: :int64
  field :TotalNetWeight, 8, type: :int64
end

defmodule Tron.AccountNetMessage.AssetNetUsedEntry do
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

defmodule Tron.AccountNetMessage.AssetNetLimitEntry do
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

defmodule Tron.AccountResourceMessage do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          freeNetUsed: integer,
          freeNetLimit: integer,
          NetUsed: integer,
          NetLimit: integer,
          assetNetUsed: %{String.t() => integer},
          assetNetLimit: %{String.t() => integer},
          TotalNetLimit: integer,
          TotalNetWeight: integer,
          EnergyUsed: integer,
          EnergyLimit: integer,
          TotalEnergyLimit: integer,
          TotalEnergyWeight: integer,
          storageUsed: integer,
          storageLimit: integer
        }
  defstruct [
    :freeNetUsed,
    :freeNetLimit,
    :NetUsed,
    :NetLimit,
    :assetNetUsed,
    :assetNetLimit,
    :TotalNetLimit,
    :TotalNetWeight,
    :EnergyUsed,
    :EnergyLimit,
    :TotalEnergyLimit,
    :TotalEnergyWeight,
    :storageUsed,
    :storageLimit
  ]

  field :freeNetUsed, 1, type: :int64
  field :freeNetLimit, 2, type: :int64
  field :NetUsed, 3, type: :int64
  field :NetLimit, 4, type: :int64

  field :assetNetUsed, 5,
    repeated: true,
    type: Tron.AccountResourceMessage.AssetNetUsedEntry,
    map: true

  field :assetNetLimit, 6,
    repeated: true,
    type: Tron.AccountResourceMessage.AssetNetLimitEntry,
    map: true

  field :TotalNetLimit, 7, type: :int64
  field :TotalNetWeight, 8, type: :int64
  field :EnergyUsed, 13, type: :int64
  field :EnergyLimit, 14, type: :int64
  field :TotalEnergyLimit, 15, type: :int64
  field :TotalEnergyWeight, 16, type: :int64
  field :storageUsed, 21, type: :int64
  field :storageLimit, 22, type: :int64
end

defmodule Tron.AccountResourceMessage.AssetNetUsedEntry do
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

defmodule Tron.AccountResourceMessage.AssetNetLimitEntry do
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

defmodule Tron.PaginatedMessage do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          offset: integer,
          limit: integer
        }
  defstruct [:offset, :limit]

  field :offset, 1, type: :int64
  field :limit, 2, type: :int64
end

defmodule Tron.EasyTransferMessage do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          passPhrase: String.t(),
          toAddress: String.t(),
          amount: integer
        }
  defstruct [:passPhrase, :toAddress, :amount]

  field :passPhrase, 1, type: :bytes
  field :toAddress, 2, type: :bytes
  field :amount, 3, type: :int64
end

defmodule Tron.EasyTransferByPrivateMessage do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          privateKey: String.t(),
          toAddress: String.t(),
          amount: integer
        }
  defstruct [:privateKey, :toAddress, :amount]

  field :privateKey, 1, type: :bytes
  field :toAddress, 2, type: :bytes
  field :amount, 3, type: :int64
end

defmodule Tron.EasyTransferResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          transaction: Tron.Transaction.t() | nil,
          result: Tron.Return.t() | nil,
          txid: String.t()
        }
  defstruct [:transaction, :result, :txid]

  field :transaction, 1, type: Tron.Transaction
  field :result, 2, type: Tron.Return
  field :txid, 3, type: :bytes
end

defmodule Tron.AddressPrKeyPairMessage do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          address: String.t(),
          privateKey: String.t()
        }
  defstruct [:address, :privateKey]

  field :address, 1, type: :string
  field :privateKey, 2, type: :string
end

defmodule Tron.TransactionExtention do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          transaction: Tron.Transaction.t() | nil,
          txid: String.t(),
          constant_result: [String.t()],
          result: Tron.Return.t() | nil
        }
  defstruct [:transaction, :txid, :constant_result, :result]

  field :transaction, 1, type: Tron.Transaction
  field :txid, 2, type: :bytes
  field :constant_result, 3, repeated: true, type: :bytes
  field :result, 4, type: Tron.Return
end

defmodule Tron.BlockExtention do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          transactions: [Tron.TransactionExtention.t()],
          block_header: Tron.BlockHeader.t() | nil,
          blockid: String.t()
        }
  defstruct [:transactions, :block_header, :blockid]

  field :transactions, 1, repeated: true, type: Tron.TransactionExtention
  field :block_header, 2, type: Tron.BlockHeader
  field :blockid, 3, type: :bytes
end

defmodule Tron.BlockListExtention do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          block: [Tron.BlockExtention.t()]
        }
  defstruct [:block]

  field :block, 1, repeated: true, type: Tron.BlockExtention
end

defmodule Tron.TransactionListExtention do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          transaction: [Tron.TransactionExtention.t()]
        }
  defstruct [:transaction]

  field :transaction, 1, repeated: true, type: Tron.TransactionExtention
end

defmodule Tron.Wallet.Service do
  @moduledoc false
  use GRPC.Service, name: "protocol.Wallet"

  rpc :GetAccount, Tron.Account, Tron.Account
  rpc :GetAccountById, Tron.Account, Tron.Account
  rpc :CreateTransaction, Tron.TransferContract, Tron.Transaction
  rpc :CreateTransaction2, Tron.TransferContract, Tron.TransactionExtention
  rpc :BroadcastTransaction, Tron.Transaction, Tron.Return
  rpc :UpdateAccount, Tron.AccountUpdateContract, Tron.Transaction
  rpc :SetAccountId, Tron.SetAccountIdContract, Tron.Transaction
  rpc :UpdateAccount2, Tron.AccountUpdateContract, Tron.TransactionExtention
  rpc :VoteWitnessAccount, Tron.VoteWitnessContract, Tron.Transaction
  rpc :UpdateSetting, Tron.UpdateSettingContract, Tron.TransactionExtention

  rpc :UpdateSettingForEnergyLimit,
      Tron.UpdateSettingForEnergyLimitContract,
      Tron.TransactionExtention

  rpc :VoteWitnessAccount2, Tron.VoteWitnessContract, Tron.TransactionExtention
  rpc :CreateAssetIssue, Tron.AssetIssueContract, Tron.Transaction
  rpc :CreateAssetIssue2, Tron.AssetIssueContract, Tron.TransactionExtention
  rpc :UpdateWitness, Tron.WitnessUpdateContract, Tron.Transaction
  rpc :UpdateWitness2, Tron.WitnessUpdateContract, Tron.TransactionExtention
  rpc :CreateAccount, Tron.AccountCreateContract, Tron.Transaction
  rpc :CreateAccount2, Tron.AccountCreateContract, Tron.TransactionExtention
  rpc :CreateWitness, Tron.WitnessCreateContract, Tron.Transaction
  rpc :CreateWitness2, Tron.WitnessCreateContract, Tron.TransactionExtention
  rpc :TransferAsset, Tron.TransferAssetContract, Tron.Transaction
  rpc :TransferAsset2, Tron.TransferAssetContract, Tron.TransactionExtention
  rpc :ParticipateAssetIssue, Tron.ParticipateAssetIssueContract, Tron.Transaction
  rpc :ParticipateAssetIssue2, Tron.ParticipateAssetIssueContract, Tron.TransactionExtention
  rpc :FreezeBalance, Tron.FreezeBalanceContract, Tron.Transaction
  rpc :FreezeBalance2, Tron.FreezeBalanceContract, Tron.TransactionExtention
  rpc :UnfreezeBalance, Tron.UnfreezeBalanceContract, Tron.Transaction
  rpc :UnfreezeBalance2, Tron.UnfreezeBalanceContract, Tron.TransactionExtention
  rpc :UnfreezeAsset, Tron.UnfreezeAssetContract, Tron.Transaction
  rpc :UnfreezeAsset2, Tron.UnfreezeAssetContract, Tron.TransactionExtention
  rpc :WithdrawBalance, Tron.WithdrawBalanceContract, Tron.Transaction
  rpc :WithdrawBalance2, Tron.WithdrawBalanceContract, Tron.TransactionExtention
  rpc :UpdateAsset, Tron.UpdateAssetContract, Tron.Transaction
  rpc :UpdateAsset2, Tron.UpdateAssetContract, Tron.TransactionExtention
  rpc :ProposalCreate, Tron.ProposalCreateContract, Tron.TransactionExtention
  rpc :ProposalApprove, Tron.ProposalApproveContract, Tron.TransactionExtention
  rpc :ProposalDelete, Tron.ProposalDeleteContract, Tron.TransactionExtention
  rpc :BuyStorage, Tron.BuyStorageContract, Tron.TransactionExtention
  rpc :BuyStorageBytes, Tron.BuyStorageBytesContract, Tron.TransactionExtention
  rpc :SellStorage, Tron.SellStorageContract, Tron.TransactionExtention
  rpc :ExchangeCreate, Tron.ExchangeCreateContract, Tron.TransactionExtention
  rpc :ExchangeInject, Tron.ExchangeInjectContract, Tron.TransactionExtention
  rpc :ExchangeWithdraw, Tron.ExchangeWithdrawContract, Tron.TransactionExtention
  rpc :ExchangeTransaction, Tron.ExchangeTransactionContract, Tron.TransactionExtention
  rpc :ListNodes, Tron.EmptyMessage, Tron.NodeList
  rpc :GetAssetIssueByAccount, Tron.Account, Tron.AssetIssueList
  rpc :GetAccountNet, Tron.Account, Tron.AccountNetMessage
  rpc :GetAccountResource, Tron.Account, Tron.AccountResourceMessage
  rpc :GetAssetIssueByName, Tron.BytesMessage, Tron.AssetIssueContract
  rpc :GetNowBlock, Tron.EmptyMessage, Tron.Block
  rpc :GetNowBlock2, Tron.EmptyMessage, Tron.BlockExtention
  rpc :GetBlockByNum, Tron.NumberMessage, Tron.Block
  rpc :GetBlockByNum2, Tron.NumberMessage, Tron.BlockExtention
  rpc :GetTransactionCountByBlockNum, Tron.NumberMessage, Tron.NumberMessage
  rpc :GetBlockById, Tron.BytesMessage, Tron.Block
  rpc :GetBlockByLimitNext, Tron.BlockLimit, Tron.BlockList
  rpc :GetBlockByLimitNext2, Tron.BlockLimit, Tron.BlockListExtention
  rpc :GetBlockByLatestNum, Tron.NumberMessage, Tron.BlockList
  rpc :GetBlockByLatestNum2, Tron.NumberMessage, Tron.BlockListExtention
  rpc :GetTransactionById, Tron.BytesMessage, Tron.Transaction
  rpc :DeployContract, Tron.CreateSmartContract, Tron.TransactionExtention
  rpc :GetContract, Tron.BytesMessage, Tron.SmartContract
  rpc :TriggerContract, Tron.TriggerSmartContract, Tron.TransactionExtention
  rpc :ListWitnesses, Tron.EmptyMessage, Tron.WitnessList
  rpc :ListProposals, Tron.EmptyMessage, Tron.ProposalList
  rpc :GetPaginatedProposalList, Tron.PaginatedMessage, Tron.ProposalList
  rpc :GetProposalById, Tron.BytesMessage, Tron.Proposal
  rpc :ListExchanges, Tron.EmptyMessage, Tron.ExchangeList
  rpc :GetPaginatedExchangeList, Tron.PaginatedMessage, Tron.ExchangeList
  rpc :GetExchangeById, Tron.BytesMessage, Tron.Exchange
  rpc :GetChainParameters, Tron.EmptyMessage, Tron.ChainParameters
  rpc :GetAssetIssueList, Tron.EmptyMessage, Tron.AssetIssueList
  rpc :GetPaginatedAssetIssueList, Tron.PaginatedMessage, Tron.AssetIssueList
  rpc :TotalTransaction, Tron.EmptyMessage, Tron.NumberMessage
  rpc :GetNextMaintenanceTime, Tron.EmptyMessage, Tron.NumberMessage
  rpc :GetTransactionSign, Tron.TransactionSign, Tron.Transaction
  rpc :GetTransactionSign2, Tron.TransactionSign, Tron.TransactionExtention
  rpc :CreateAddress, Tron.BytesMessage, Tron.BytesMessage
  rpc :EasyTransfer, Tron.EasyTransferMessage, Tron.EasyTransferResponse
  rpc :EasyTransferByPrivate, Tron.EasyTransferByPrivateMessage, Tron.EasyTransferResponse
  rpc :GenerateAddress, Tron.EmptyMessage, Tron.AddressPrKeyPairMessage
  rpc :GetTransactionInfoById, Tron.BytesMessage, Tron.TransactionInfo
end

defmodule Tron.Wallet.Stub do
  @moduledoc false
  use GRPC.Stub, service: Tron.Wallet.Service
end

defmodule Tron.WalletSolidity.Service do
  @moduledoc false
  use GRPC.Service, name: "protocol.WalletSolidity"

  rpc :GetAccount, Tron.Account, Tron.Account
  rpc :GetAccountById, Tron.Account, Tron.Account
  rpc :ListWitnesses, Tron.EmptyMessage, Tron.WitnessList
  rpc :GetAssetIssueList, Tron.EmptyMessage, Tron.AssetIssueList
  rpc :GetPaginatedAssetIssueList, Tron.PaginatedMessage, Tron.AssetIssueList
  rpc :GetNowBlock, Tron.EmptyMessage, Tron.Block
  rpc :GetNowBlock2, Tron.EmptyMessage, Tron.BlockExtention
  rpc :GetBlockByNum, Tron.NumberMessage, Tron.Block
  rpc :GetBlockByNum2, Tron.NumberMessage, Tron.BlockExtention
  rpc :GetTransactionCountByBlockNum, Tron.NumberMessage, Tron.NumberMessage
  rpc :GetTransactionById, Tron.BytesMessage, Tron.Transaction
  rpc :GetTransactionInfoById, Tron.BytesMessage, Tron.TransactionInfo
  rpc :GenerateAddress, Tron.EmptyMessage, Tron.AddressPrKeyPairMessage
end

defmodule Tron.WalletSolidity.Stub do
  @moduledoc false
  use GRPC.Stub, service: Tron.WalletSolidity.Service
end

defmodule Tron.WalletExtension.Service do
  @moduledoc false
  use GRPC.Service, name: "protocol.WalletExtension"

  rpc :GetTransactionsFromThis, Tron.AccountPaginated, Tron.TransactionList
  rpc :GetTransactionsFromThis2, Tron.AccountPaginated, Tron.TransactionListExtention
  rpc :GetTransactionsToThis, Tron.AccountPaginated, Tron.TransactionList
  rpc :GetTransactionsToThis2, Tron.AccountPaginated, Tron.TransactionListExtention
end

defmodule Tron.WalletExtension.Stub do
  @moduledoc false
  use GRPC.Stub, service: Tron.WalletExtension.Service
end

defmodule Tron.Database.Service do
  @moduledoc false
  use GRPC.Service, name: "protocol.Database"

  rpc :getBlockReference, Tron.EmptyMessage, Tron.BlockReference
  rpc :GetDynamicProperties, Tron.EmptyMessage, Tron.DynamicProperties
  rpc :GetNowBlock, Tron.EmptyMessage, Tron.Block
  rpc :GetBlockByNum, Tron.NumberMessage, Tron.Block
end

defmodule Tron.Database.Stub do
  @moduledoc false
  use GRPC.Stub, service: Tron.Database.Service
end

defmodule Tron.Network.Service do
  @moduledoc false
  use GRPC.Service, name: "protocol.Network"
end

defmodule Tron.Network.Stub do
  @moduledoc false
  use GRPC.Stub, service: Tron.Network.Service
end
