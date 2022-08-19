defmodule Username do

  def sanitize(''), do: ''

  @spec sanitize(charlist()) :: charlist()
  def sanitize([first | rest]) do
    case first do
      ?ä -> 'ae'
      ?ö -> 'oe'
      ?ü -> 'ue'
      ?ß -> 'ss'
      first when first >= ?a and first <= ?z -> [first]
      ?_ -> '_'
      _ -> ''
    end ++ sanitize(rest)
  end
end
