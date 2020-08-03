defmodule VinDecode.ValidationTest do
  use ExUnit.Case
  alias VinDecode.Validation

  test "#valid?" do
    valid_vin = "1M8GDM9AXKP042788"
    invalid_vin = "1M8GDM9A0KP042788"
    assert Validation.valid?(valid_vin) == true
    assert Validation.valid?(invalid_vin) == false
  end

  test "#valid? - all valid VINs" do
    vins = [
      "5TBBV54168S522191",
      "SALAK2D42AA532152",
      "2T3KF4DV4BW054145",
      "2HGFB2F75FH512430",
      "1GNKRFED1DJ104386"
    ]

    assert Enum.all?(vins, &Validation.valid?/1) == true
  end

  test "#valid? - all invalid VINs" do
    vins = [
      "5TBBV14168S522191",
      "SALAK2D42AA532132",
      "2T3KF4DV4BW053145",
      "2HGFB2F75FH312430",
      "1GNKRAED1DJ104386"
    ]

    assert Enum.filter(vins, &Validation.valid?/1) == []
  end
end
