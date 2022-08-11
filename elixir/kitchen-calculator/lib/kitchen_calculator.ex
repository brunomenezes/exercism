defmodule KitchenCalculator do
  defp new_measurement(volume, unit \\ :milliliter), do: {unit, volume}

  def get_volume({_, volume}), do: volume

  def to_milliliter({:cup, volume}), do: new_measurement(volume * 240)
  def to_milliliter({:fluid_ounce, volume}), do: new_measurement(volume * 30)
  def to_milliliter({:teaspoon, volume}), do: new_measurement(volume * 5)
  def to_milliliter({:tablespoon, volume}), do: new_measurement(volume * 15)
  def to_milliliter(tuple), do: tuple

  def from_milliliter({_, volume}, :cup = u), do: (volume / 240) |> new_measurement(u)
  def from_milliliter({_, volume}, :fluid_ounce = u), do: (volume / 30) |> new_measurement(u)
  def from_milliliter({_, volume}, :teaspoon = u), do: (volume / 5) |> new_measurement(u)
  def from_milliliter({_, volume}, :tablespoon = u), do: (volume / 15) |> new_measurement(u)
  def from_milliliter(tuple, _), do: tuple

  def convert(volume_pair, unit), do: to_milliliter(volume_pair) |> from_milliliter(unit)
end
