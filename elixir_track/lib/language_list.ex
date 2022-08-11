defmodule LanguageList do

  def new(), do: []

  def add(list, language), do: [language | list]

  def remove([_ | tail]), do: tail

  def remove([]), do: new()

  def first([first | _]), do: first
  def first([]), do: nil

  def count(list), do: length(list)

  def functional_list?(list), do: "Elixir" in list

end
