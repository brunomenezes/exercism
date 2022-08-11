defmodule HighSchoolSweetheart do
  def first_letter(name) do
    name
    |> String.trim()
    |> String.first()
  end

  def initial(name), do: first_letter(name) |> String.capitalize() |> Kernel.<>(".")

  def initials(full_name),
    do:
      String.split(full_name, " ", trim: true)
      |> Kernel.then(fn [name, surname] -> "#{initial(name)} #{initial(surname)}" end)

  def pair(full_name1, full_name2) do
    """
         ******       ******
       **      **   **      **
     **         ** **         **
    **            *            **
    **                         **
    **     #{initials(full_name1)}  +  #{initials(full_name2)}     **
     **                       **
       **                   **
         **               **
           **           **
             **       **
               **   **
                 ***
                  *
    """
  end
end
