defmodule HighScore do
  import Map
  @zero 0

  def new(), do: %{}

  def add_player(scores, name), do: put(scores, name, @zero)
  def add_player(scores, name, score), do: put(scores, name, score)

  def remove_player(scores, name), do: delete(scores, name)

  def reset_score(scores, name), do: add_player(scores, name)

  def update_score(scores, name, score), do: update(scores, name, score, &(&1 + score))

  def get_players(scores), do: keys(scores)
end
