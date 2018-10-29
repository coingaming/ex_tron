defmodule Protocol.Return do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          result: boolean,
          code: integer,
          message: String.t()
        }
  defstruct [:result, :code, :message]

  field :result, 1, type: :bool
  field :code, 2, type: Protocol.Return.ResponseCode, enum: true
  field :message, 3, type: :bytes
end

defmodule Protocol.Return.ResponseCode do
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

defmodule Protocol.BlockReference do
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

defmodule Protocol.WitnessList do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          witnesses: [Protocol.Witness.t()]
        }
  defstruct [:witnesses]

  field :witnesses, 1, repeated: true, type: Protocol.Witness
end

defmodule Protocol.ProposalList do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          proposals: [Protocol.Proposal.t()]
        }
  defstruct [:proposals]

  field :proposals, 1, repeated: true, type: Protocol.Proposal
end

defmodule Protocol.ExchangeList do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          exchanges: [Protocol.Exchange.t()]
        }
  defstruct [:exchanges]

  field :exchanges, 1, repeated: true, type: Protocol.Exchange
end

defmodule Protocol.AssetIssueList do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          assetIssue: [Protocol.AssetIssueContract.t()]
        }
  defstruct [:assetIssue]

  field :assetIssue, 1, repeated: true, type: Protocol.AssetIssueContract
end

defmodule Protocol.BlockList do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          block: [Protocol.Block.t()]
        }
  defstruct [:block]

  field :block, 1, repeated: true, type: Protocol.Block
end

defmodule Protocol.TransactionList do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          transaction: [Protocol.Transaction.t()]
        }
  defstruct [:transaction]

  field :transaction, 1, repeated: true, type: Protocol.Transaction
end

defmodule Protocol.NodeList do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          nodes: [Protocol.Node.t()]
        }
  defstruct [:nodes]

  field :nodes, 1, repeated: true, type: Protocol.Node
end

defmodule Protocol.Node do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          address: Protocol.Address.t()
        }
  defstruct [:address]

  field :address, 1, type: Protocol.Address
end

defmodule Protocol.Address do
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

defmodule Protocol.EmptyMessage do
  @moduledoc false
  use Protobuf, syntax: :proto3

  defstruct []
end

defmodule Protocol.NumberMessage do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          num: integer
        }
  defstruct [:num]

  field :num, 1, type: :int64
end

defmodule Protocol.BytesMessage do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          value: String.t()
        }
  defstruct [:value]

  field :value, 1, type: :bytes
end

defmodule Protocol.TimeMessage do
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

defmodule Protocol.BlockLimit do
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

defmodule Protocol.TransactionLimit do
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

defmodule Protocol.AccountPaginated do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          account: Protocol.Account.t(),
          offset: integer,
          limit: integer
        }
  defstruct [:account, :offset, :limit]

  field :account, 1, type: Protocol.Account
  field :offset, 2, type: :int64
  field :limit, 3, type: :int64
end

defmodule Protocol.TimePaginatedMessage do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          timeMessage: Protocol.TimeMessage.t(),
          offset: integer,
          limit: integer
        }
  defstruct [:timeMessage, :offset, :limit]

  field :timeMessage, 1, type: Protocol.TimeMessage
  field :offset, 2, type: :int64
  field :limit, 3, type: :int64
end

defmodule Protocol.AccountNetMessage do
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
    type: Protocol.AccountNetMessage.AssetNetUsedEntry,
    map: true

  field :assetNetLimit, 6,
    repeated: true,
    type: Protocol.AccountNetMessage.AssetNetLimitEntry,
    map: true

  field :TotalNetLimit, 7, type: :int64
  field :TotalNetWeight, 8, type: :int64
end

defmodule Protocol.AccountNetMessage.AssetNetUsedEntry do
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

defmodule Protocol.AccountNetMessage.AssetNetLimitEntry do
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

defmodule Protocol.AccountResourceMessage do
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
    type: Protocol.AccountResourceMessage.AssetNetUsedEntry,
    map: true

  field :assetNetLimit, 6,
    repeated: true,
    type: Protocol.AccountResourceMessage.AssetNetLimitEntry,
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

defmodule Protocol.AccountResourceMessage.AssetNetUsedEntry do
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

defmodule Protocol.AccountResourceMessage.AssetNetLimitEntry do
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

defmodule Protocol.PaginatedMessage do
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

defmodule Protocol.EasyTransferMessage do
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

defmodule Protocol.EasyTransferByPrivateMessage do
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

defmodule Protocol.EasyTransferResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          transaction: Protocol.Transaction.t(),
          result: Protocol.Return.t(),
          txid: String.t()
        }
  defstruct [:transaction, :result, :txid]

  field :transaction, 1, type: Protocol.Transaction
  field :result, 2, type: Protocol.Return
  field :txid, 3, type: :bytes
end

defmodule Protocol.AddressPrKeyPairMessage do
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

defmodule Protocol.TransactionExtention do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          transaction: Protocol.Transaction.t(),
          txid: String.t(),
          constant_result: [String.t()],
          result: Protocol.Return.t()
        }
  defstruct [:transaction, :txid, :constant_result, :result]

  field :transaction, 1, type: Protocol.Transaction
  field :txid, 2, type: :bytes
  field :constant_result, 3, repeated: true, type: :bytes
  field :result, 4, type: Protocol.Return
end

defmodule Protocol.BlockExtention do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          transactions: [Protocol.TransactionExtention.t()],
          block_header: Protocol.BlockHeader.t(),
          blockid: String.t()
        }
  defstruct [:transactions, :block_header, :blockid]

  field :transactions, 1, repeated: true, type: Protocol.TransactionExtention
  field :block_header, 2, type: Protocol.BlockHeader
  field :blockid, 3, type: :bytes
end

defmodule Protocol.BlockListExtention do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          block: [Protocol.BlockExtention.t()]
        }
  defstruct [:block]

  field :block, 1, repeated: true, type: Protocol.BlockExtention
end

defmodule Protocol.TransactionListExtention do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          transaction: [Protocol.TransactionExtention.t()]
        }
  defstruct [:transaction]

  field :transaction, 1, repeated: true, type: Protocol.TransactionExtention
end

defmodule Protocol.Wallet.Service do
  @moduledoc false
  use GRPC.Service, name: "protocol.Wallet"

  rpc :GetAccount, Protocol.Account, Protocol.Account
  rpc :GetAccountById, Protocol.Account, Protocol.Account
  rpc :CreateTransaction, Protocol.TransferContract, Protocol.Transaction
  rpc :CreateTransaction2, Protocol.TransferContract, Protocol.TransactionExtention
  rpc :BroadcastTransaction, Protocol.Transaction, Protocol.Return
  rpc :UpdateAccount, Protocol.AccountUpdateContract, Protocol.Transaction
  rpc :SetAccountId, Protocol.SetAccountIdContract, Protocol.Transaction
  rpc :UpdateAccount2, Protocol.AccountUpdateContract, Protocol.TransactionExtention
  rpc :VoteWitnessAccount, Protocol.VoteWitnessContract, Protocol.Transaction
  rpc :UpdateSetting, Protocol.UpdateSettingContract, Protocol.TransactionExtention

  rpc :UpdateSettingForEnergyLimit,
      Protocol.UpdateSettingForEnergyLimitContract,
      Protocol.TransactionExtention

  rpc :VoteWitnessAccount2, Protocol.VoteWitnessContract, Protocol.TransactionExtention
  rpc :CreateAssetIssue, Protocol.AssetIssueContract, Protocol.Transaction
  rpc :CreateAssetIssue2, Protocol.AssetIssueContract, Protocol.TransactionExtention
  rpc :UpdateWitness, Protocol.WitnessUpdateContract, Protocol.Transaction
  rpc :UpdateWitness2, Protocol.WitnessUpdateContract, Protocol.TransactionExtention
  rpc :CreateAccount, Protocol.AccountCreateContract, Protocol.Transaction
  rpc :CreateAccount2, Protocol.AccountCreateContract, Protocol.TransactionExtention
  rpc :CreateWitness, Protocol.WitnessCreateContract, Protocol.Transaction
  rpc :CreateWitness2, Protocol.WitnessCreateContract, Protocol.TransactionExtention
  rpc :TransferAsset, Protocol.TransferAssetContract, Protocol.Transaction
  rpc :TransferAsset2, Protocol.TransferAssetContract, Protocol.TransactionExtention
  rpc :ParticipateAssetIssue, Protocol.ParticipateAssetIssueContract, Protocol.Transaction

  rpc :ParticipateAssetIssue2,
      Protocol.ParticipateAssetIssueContract,
      Protocol.TransactionExtention

  rpc :FreezeBalance, Protocol.FreezeBalanceContract, Protocol.Transaction
  rpc :FreezeBalance2, Protocol.FreezeBalanceContract, Protocol.TransactionExtention
  rpc :UnfreezeBalance, Protocol.UnfreezeBalanceContract, Protocol.Transaction
  rpc :UnfreezeBalance2, Protocol.UnfreezeBalanceContract, Protocol.TransactionExtention
  rpc :UnfreezeAsset, Protocol.UnfreezeAssetContract, Protocol.Transaction
  rpc :UnfreezeAsset2, Protocol.UnfreezeAssetContract, Protocol.TransactionExtention
  rpc :WithdrawBalance, Protocol.WithdrawBalanceContract, Protocol.Transaction
  rpc :WithdrawBalance2, Protocol.WithdrawBalanceContract, Protocol.TransactionExtention
  rpc :UpdateAsset, Protocol.UpdateAssetContract, Protocol.Transaction
  rpc :UpdateAsset2, Protocol.UpdateAssetContract, Protocol.TransactionExtention
  rpc :ProposalCreate, Protocol.ProposalCreateContract, Protocol.TransactionExtention
  rpc :ProposalApprove, Protocol.ProposalApproveContract, Protocol.TransactionExtention
  rpc :ProposalDelete, Protocol.ProposalDeleteContract, Protocol.TransactionExtention
  rpc :BuyStorage, Protocol.BuyStorageContract, Protocol.TransactionExtention
  rpc :BuyStorageBytes, Protocol.BuyStorageBytesContract, Protocol.TransactionExtention
  rpc :SellStorage, Protocol.SellStorageContract, Protocol.TransactionExtention
  rpc :ExchangeCreate, Protocol.ExchangeCreateContract, Protocol.TransactionExtention
  rpc :ExchangeInject, Protocol.ExchangeInjectContract, Protocol.TransactionExtention
  rpc :ExchangeWithdraw, Protocol.ExchangeWithdrawContract, Protocol.TransactionExtention
  rpc :ExchangeTransaction, Protocol.ExchangeTransactionContract, Protocol.TransactionExtention
  rpc :ListNodes, Protocol.EmptyMessage, Protocol.NodeList
  rpc :GetAssetIssueByAccount, Protocol.Account, Protocol.AssetIssueList
  rpc :GetAccountNet, Protocol.Account, Protocol.AccountNetMessage
  rpc :GetAccountResource, Protocol.Account, Protocol.AccountResourceMessage
  rpc :GetAssetIssueByName, Protocol.BytesMessage, Protocol.AssetIssueContract
  rpc :GetNowBlock, Protocol.EmptyMessage, Protocol.Block
  rpc :GetNowBlock2, Protocol.EmptyMessage, Protocol.BlockExtention
  rpc :GetBlockByNum, Protocol.NumberMessage, Protocol.Block
  rpc :GetBlockByNum2, Protocol.NumberMessage, Protocol.BlockExtention
  rpc :GetTransactionCountByBlockNum, Protocol.NumberMessage, Protocol.NumberMessage
  rpc :GetBlockById, Protocol.BytesMessage, Protocol.Block
  rpc :GetBlockByLimitNext, Protocol.BlockLimit, Protocol.BlockList
  rpc :GetBlockByLimitNext2, Protocol.BlockLimit, Protocol.BlockListExtention
  rpc :GetBlockByLatestNum, Protocol.NumberMessage, Protocol.BlockList
  rpc :GetBlockByLatestNum2, Protocol.NumberMessage, Protocol.BlockListExtention
  rpc :GetTransactionById, Protocol.BytesMessage, Protocol.Transaction
  rpc :DeployContract, Protocol.CreateSmartContract, Protocol.TransactionExtention
  rpc :GetContract, Protocol.BytesMessage, Protocol.SmartContract
  rpc :TriggerContract, Protocol.TriggerSmartContract, Protocol.TransactionExtention
  rpc :ListWitnesses, Protocol.EmptyMessage, Protocol.WitnessList
  rpc :ListProposals, Protocol.EmptyMessage, Protocol.ProposalList
  rpc :GetPaginatedProposalList, Protocol.PaginatedMessage, Protocol.ProposalList
  rpc :GetProposalById, Protocol.BytesMessage, Protocol.Proposal
  rpc :ListExchanges, Protocol.EmptyMessage, Protocol.ExchangeList
  rpc :GetPaginatedExchangeList, Protocol.PaginatedMessage, Protocol.ExchangeList
  rpc :GetExchangeById, Protocol.BytesMessage, Protocol.Exchange
  rpc :GetChainParameters, Protocol.EmptyMessage, Protocol.ChainParameters
  rpc :GetAssetIssueList, Protocol.EmptyMessage, Protocol.AssetIssueList
  rpc :GetPaginatedAssetIssueList, Protocol.PaginatedMessage, Protocol.AssetIssueList
  rpc :TotalTransaction, Protocol.EmptyMessage, Protocol.NumberMessage
  rpc :GetNextMaintenanceTime, Protocol.EmptyMessage, Protocol.NumberMessage
  rpc :GetTransactionSign, Protocol.TransactionSign, Protocol.Transaction
  rpc :GetTransactionSign2, Protocol.TransactionSign, Protocol.TransactionExtention
  rpc :CreateAddress, Protocol.BytesMessage, Protocol.BytesMessage
  rpc :EasyTransfer, Protocol.EasyTransferMessage, Protocol.EasyTransferResponse
  rpc :EasyTransferByPrivate, Protocol.EasyTransferByPrivateMessage, Protocol.EasyTransferResponse
  rpc :GenerateAddress, Protocol.EmptyMessage, Protocol.AddressPrKeyPairMessage
  rpc :GetTransactionInfoById, Protocol.BytesMessage, Protocol.TransactionInfo
end

defmodule Protocol.Wallet.Stub do
  @moduledoc false
  use GRPC.Stub, service: Protocol.Wallet.Service
end

defmodule Protocol.WalletSolidity.Service do
  @moduledoc false
  use GRPC.Service, name: "protocol.WalletSolidity"

  rpc :GetAccount, Protocol.Account, Protocol.Account
  rpc :GetAccountById, Protocol.Account, Protocol.Account
  rpc :ListWitnesses, Protocol.EmptyMessage, Protocol.WitnessList
  rpc :GetAssetIssueList, Protocol.EmptyMessage, Protocol.AssetIssueList
  rpc :GetPaginatedAssetIssueList, Protocol.PaginatedMessage, Protocol.AssetIssueList
  rpc :GetNowBlock, Protocol.EmptyMessage, Protocol.Block
  rpc :GetNowBlock2, Protocol.EmptyMessage, Protocol.BlockExtention
  rpc :GetBlockByNum, Protocol.NumberMessage, Protocol.Block
  rpc :GetBlockByNum2, Protocol.NumberMessage, Protocol.BlockExtention
  rpc :GetTransactionCountByBlockNum, Protocol.NumberMessage, Protocol.NumberMessage
  rpc :GetTransactionById, Protocol.BytesMessage, Protocol.Transaction
  rpc :GetTransactionInfoById, Protocol.BytesMessage, Protocol.TransactionInfo
  rpc :GenerateAddress, Protocol.EmptyMessage, Protocol.AddressPrKeyPairMessage
end

defmodule Protocol.WalletSolidity.Stub do
  @moduledoc false
  use GRPC.Stub, service: Protocol.WalletSolidity.Service
end

defmodule Protocol.WalletExtension.Service do
  @moduledoc false
  use GRPC.Service, name: "protocol.WalletExtension"

  rpc :GetTransactionsFromThis, Protocol.AccountPaginated, Protocol.TransactionList
  rpc :GetTransactionsFromThis2, Protocol.AccountPaginated, Protocol.TransactionListExtention
  rpc :GetTransactionsToThis, Protocol.AccountPaginated, Protocol.TransactionList
  rpc :GetTransactionsToThis2, Protocol.AccountPaginated, Protocol.TransactionListExtention
end

defmodule Protocol.WalletExtension.Stub do
  @moduledoc false
  use GRPC.Stub, service: Protocol.WalletExtension.Service
end

defmodule Protocol.Database.Service do
  @moduledoc false
  use GRPC.Service, name: "protocol.Database"

  rpc :getBlockReference, Protocol.EmptyMessage, Protocol.BlockReference
  rpc :GetDynamicProperties, Protocol.EmptyMessage, Protocol.DynamicProperties
  rpc :GetNowBlock, Protocol.EmptyMessage, Protocol.Block
  rpc :GetBlockByNum, Protocol.NumberMessage, Protocol.Block
end

defmodule Protocol.Database.Stub do
  @moduledoc false
  use GRPC.Stub, service: Protocol.Database.Service
end

defmodule Protocol.Network.Service do
  @moduledoc false
  use GRPC.Service, name: "protocol.Network"
end

defmodule Protocol.Network.Stub do
  @moduledoc false
  use GRPC.Stub, service: Protocol.Network.Service
end
