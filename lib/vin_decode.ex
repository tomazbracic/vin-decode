defmodule VinDecode do
  @moduledoc """
  Documentation for VinDecode.
  """

  alias VinDecode.Dictionaries.Countries
  alias VinDecode.Dictionaries.Years
  alias VinDecode.Dictionaries.Wmi
  alias VinDecode.Validation

  @spec info(any) :: {:ok, any} | {:error, any}
  def info(vin) when is_binary(vin) do
    cond do
      String.length(vin) != 17 ->
        {:error, :invalid_length}

      !Validation.valid?(vin) ->
        {:error, :invalid_checksum}

      true ->
        %{
          year: Years.year(vin),
          country: Countries.country(vin),
          manafacturer: Wmi.manafacturer(vin),
          serial: serial(vin)
        }
    end
  end

  def info(_vin) do
    {:error, :invalid_value}
  end

  defp serial(vin) do
    String.slice(vin, 11..16)
  end
end
