defmodule TronExamples do
  @private_key Base.decode16!(File.read!("keys/1.priv"), case: :lower)
  @private_key2 Base.decode16!(File.read!("keys/2.priv"), case: :lower)
end
