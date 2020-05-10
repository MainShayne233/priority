defmodule Priority.MixProject do
  use Mix.Project

  def project do
    [
      app: :priority,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Priority.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:eventstore, "~> 1.0"},
      {:jason, "~> 1.1"},
      {:typed_struct, "~> 0.1.4"},
      # DEV/TEST
      {:faker, "~> 0.13.0", only: :test},
      {:mix_test_watch, "~> 1.0", only: :dev, runtime: false}
    ]
  end
end
