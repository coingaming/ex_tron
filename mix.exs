defmodule Tron.MixProject do
  use Mix.Project

  @version "0.1.1-rc"

  def project do
    [
      app: :tron,
      version: @version,
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      consolidate_protocols: Mix.env() != :test,
      deps: deps(),
      description: description(),
      package: package(),
      docs: docs()
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
      {:grpc, git: "https://github.com/elixir-grpc/grpc.git"},
      {:keccakf1600, "~> 2.0", hex: :keccakf1600_orig},
      {:libsecp256k1, "~> 0.1.10"},
      {:ex_doc, "~> 0.19", only: :dev, runtime: false},
      {:cortex, "~> 0.5", only: [:dev, :test]}
    ]
  end

  defp description do
    """
    TRON protocol implementation in elixir.
    """
  end

  defp package do
    [
      maintainers: ["mlamp"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/mlamp/tron-protocol"}
    ]
  end

  defp docs do
    [
      main: "readme",
      name: "Tron",
      source_ref: "v#{@version}",
      canonical: "http://hexdocs.pm/tron",
      source_url: "https://github.com/mlamp/tron-protocol",
      extras: [
        "README.md"
      ]
    ]
  end
end
