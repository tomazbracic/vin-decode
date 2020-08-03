# VinDecode

Library for decoding VIN number and Validation VIN number

# Contribution

Feel free to make a pull request. All contributions are appreciated!

## Usage

```elixir
vin = "1FMCU04112KA71263"

VinDecode.info(vin) # => %{
          country: "United States",
          manafacturer: "Ford Motor Company",
          serial: "A71263",
          year: 2002
        }
  

vin = "1FMCU0411271263"
VinDecode.info(vin) # => {:error, :invalid_length}

vin = "1FMCU03112KA71263"
VinDecode.info(vin) # => {:error, :invalid_checksum}

```

## Installation

```elixir
def deps do
  [
    {:vin_decode, "~> 0.1.0"}
  ]
end
```