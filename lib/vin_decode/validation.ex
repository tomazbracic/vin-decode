defmodule VinDecode.Validation do
  @weights %{
    0 => 8,
    1 => 7,
    2 => 6,
    3 => 5,
    4 => 4,
    5 => 3,
    6 => 2,
    7 => 10,
    8 => 0,
    9 => 9,
    10 => 8,
    11 => 7,
    12 => 6,
    13 => 5,
    14 => 4,
    15 => 3,
    16 => 2
  }

  @transliterating %{
    "A" => 1,
    "B" => 2,
    "C" => 3,
    "D" => 4,
    "E" => 5,
    "F" => 6,
    "G" => 7,
    "H" => 8,
    "J" => 1,
    "K" => 2,
    "L" => 3,
    "M" => 4,
    "N" => 5,
    "P" => 7,
    "R" => 9,
    "S" => 2,
    "T" => 3,
    "U" => 4,
    "V" => 5,
    "W" => 6,
    "X" => 7,
    "Y" => 8,
    "Z" => 9,
    "1" => 1,
    "2" => 2,
    "3" => 3,
    "4" => 4,
    "5" => 5,
    "6" => 6,
    "7" => 7,
    "8" => 8,
    "9" => 9,
    "0" => 0
  }

  def valid?(vin) do
    product =
      vin
      |> String.codepoints()
      |> Enum.with_index()
      |> Enum.map(fn {char, index} -> transliterating(char) * weight(index) end)
      |> Enum.sum()

    char9 = String.at(vin, 8)

    char9 == check_digit(product)
  end

  defp transliterating(char) do
    @transliterating[char]
  end

  defp check_digit(product_result) do
    mod = Kernel.ceil(:math.fmod(product_result, 11))

    if mod == 10 do
      "X"
    else
      to_string(mod)
    end
  end

  defp weight(position) do
    @weights[position]
  end
end
