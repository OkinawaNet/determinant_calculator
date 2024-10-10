defmodule Matrix do
  @moduledoc """
  Модуль для работы с матрицами и вычисления определителя.

  Этот модуль предоставляет функции для создания матриц и вычисления их определителей.
  """

  defstruct rows: []

  @doc """
  Создает новую матрицу с заданными рядами.
  """
  def new(), do: %Matrix{rows: []}
  def new(rows), do: %Matrix{rows: rows}

  @doc """
  Вычисляет определитель матрицы.
  """
  def determinant(%Matrix{rows: []}), do: 0
  def determinant(%Matrix{rows: matrix}), do: do_determinant(matrix)

  defp do_determinant([]), do: 0
  defp do_determinant([[a, b], [c, d]]), do: a * d - b * c

  defp do_determinant(matrix) do
    first_column = Enum.map(matrix, &List.first/1)

    other_columns =
      matrix
      |> Enum.map(&drop_nth_elm/1)

    first_column
    |> Enum.with_index()
    |> Enum.reduce(0, fn {value, n}, acc ->
      if value == 0 do
        acc
      else
        acc + -1 ** n * value * do_determinant(drop_nth_elm(other_columns, n))
      end
    end)
  end

  defp drop_nth_elm(list, n \\ 0)
  defp drop_nth_elm([_ | tail], 0), do: tail

  defp drop_nth_elm(list, n) do
    list
    |> Enum.with_index()
    |> Enum.filter(fn {_, i} -> i != n end)
    |> Enum.map(fn {elm, _} -> elm end)
  end
end
