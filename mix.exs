defmodule Tron.MixProject do
  use Mix.Project

  def project do
    [
      app: :tron,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:httpoison, "~> 1.4"},
      # {:jason, "~> 1.1"},
      {:protobuf, "~> 0.5.3"},
      {:google_protos, "~> 0.1"},
      {:grpc, "~> 0.3.0-alpha.2"},
      {:keccakf1600, "~> 2.0", hex: :keccakf1600_orig},
      {:libsecp256k1, "~> 0.1.10"}
    ]
  end
end
