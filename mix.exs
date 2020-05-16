defmodule Priority.MixProject do
  use Mix.Project

  def project do
    [
      app: :priority,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      dialyzer: dialyzer()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Priority.Application, []}
    ]
  end

  defp dialyzer,
    do: [
      dialyzer: [
        plt_file: {:no_warn, "priv/plts/dialyzer.plt"}
      ]
    ]

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:commanded, "~> 1.0"},
      {:commanded_eventstore_adapter, "~> 1.0.0"},
      {:eventstore, "~> 1.0"},
      {:jason, "~> 1.1"},
      {:typed_struct, "~> 0.1.4"},
      # DEV/TEST
      {:faker, "~> 0.13.0", only: :test},
      {:mix_test_watch, "~> 1.0", only: :dev, runtime: false},
      {:dialyxir, "~> 1.0", only: [:dev], runtime: false}
    ]
  end
end
