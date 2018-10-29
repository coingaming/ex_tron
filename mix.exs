defmodule Tron.MixProject do
  use Mix.Project

  @version "0.1.0-rc"

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
      {:grpc, "~> 0.3.0-alpha.2"},
      {:keccakf1600, "~> 2.0", hex: :keccakf1600_orig},
      {:libsecp256k1, "~> 0.1.10"},
      {:ex_doc, "~> 0.19", only: :dev, runtime: false}
    ]
  end

  defp description do
    """
    TRON protocol implementation in elixir.
    """
  end

  defp package do
    [
      maintainers: ["doijaps"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/syfgkjasdkn/tron-protocol"}
    ]
  end

  defp docs do
    [
      main: "readme",
      name: "Tron",
      source_ref: "v#{@version}",
      canonical: "http://hexdocs.pm/tron",
      source_url: "https://github.com/syfgkjasdkn/tron-protocol",
      extras: [
        "README.md"
      ]
    ]
  end
end
