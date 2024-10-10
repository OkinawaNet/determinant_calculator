defmodule Matrix do
  defstruct rows: []

  def new(), do: %Matrix{rows: []}
  def new(rows), do: %Matrix{rows: rows}

  def determinator(%Matrix{rows: []}), do: 0
  def determinator(%Matrix{rows: matrix}), do: do_determinator(matrix)

  defp do_determinator([]), do: 0
  defp do_determinator([[a,b],[c,d]]), do: a * d - b * c
  defp do_determinator(matrix) do
    first_column = Enum.map(matrix, &List.first/1)

    other_columns = matrix
    |> Enum.map(&drop_nth_elm/1)

    first_column
    |> Enum.with_index()
    |> Enum.reduce(0, fn {value , n}, acc ->
      acc + ((-1) ** n ) * value * do_determinator(drop_nth_elm(other_columns, n))
    end)
  end

  defp drop_nth_elm(list, n \\ 0)
  defp drop_nth_elm([head | tail], 0), do: tail
  defp drop_nth_elm(list, n) do
    list
    |> Enum.with_index()
    |> Enum.filter(fn {_, i} -> i != n end)
    |> Enum.map(fn {elm, _} -> elm end)
  end
end
