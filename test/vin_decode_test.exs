defmodule VinDecodeTest do
  use ExUnit.Case
  doctest VinDecode

  test "#info - for valid VIN" do
    vin = "1FMCU04112KA71263"

    assert VinDecode.info(vin) == %{
             country: "United States",
             manafacturer: "Ford Motor Company",
             serial: "A71263",
             year: 2002
           }
  end

  test "#info - for invalid VIN" do
    vin = "1FMCU0411271263"
    assert VinDecode.info(vin) == {:error, :invalid_length}
  end

  test "#info - for VIN with bad checksum" do
    vin = "1FMCU03112KA71263"
    assert VinDecode.info(vin) == {:error, :invalid_checksum}
  end
end
