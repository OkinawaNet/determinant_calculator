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
    |> parse()
  end

  defp parse(""), do: Matrix.new()
  defp parse(file_string) do
    file_string
    |> String.split("\n")
    |> Enum.map(&parse_row/1)
    |> Matrix.new()
  end

  defp parse_row(""), do: []
  defp parse_row(row) do
    row
    |> String.split(" ")
    |> Enum.map(&String.to_integer/1)
  end
end
