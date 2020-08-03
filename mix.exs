defmodule VinDecode.MixProject do
  use Mix.Project

  def project do
    [
      app: :vin_decode,
      aliases: aliases(),
      version: "0.2.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      source_url: "https://github.com/CatTheMagician/vin-decode",
      name: "VinDecode",
      description: description(),
      package: package(),
      source_url: "https://github.com/CatTheMagician/vin-decode",
      homepage_url: "https://github.com/CatTheMagician/vin-decode",
      docs: [
        main: "readme",
        extras: ["README.md"]
      ]
    ]
  end

  defp description() do
    "Clickhouse client"
  end

  defp package() do
    [
      # This VinDecode is only needed when you don't want to use the OTP application name
      name: "vin_decode",
      # These are the default files included in the package
      files: ~w(lib .formatter.exs mix.exs README*),
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/CatTheMagician/vin-decode"}
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    []
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, "~> 0.21", only: :dev, runtime: false}
    ]
  end

  defp aliases() do
    [
      test: ["format --check-formatted", "test"]
    ]
  end
end
