defmodule MatrixReader do
  @moduledoc """
    Модуль предназначен для чтения матрицы из файла
  """

  import Matrix

  @doc """
    Читает файл и возвращает Matrix
  """
  def read(file_path) do
    file_path
    |> File.read!()
    |> String.split("\n")
    |> Enum.map(&parse_row/1)
    |> Matrix.new
  end

  @doc """
    Бьет строку на список целых чисел
  """
  defp parse_row(row) do
    row
    |> String.split(" ")
    |> Enum.map(&String.to_integer/1)
  end
end
