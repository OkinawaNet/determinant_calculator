defmodule DeterminantCalculator do
  @moduledoc """
  Documentation for `DeterminantCalculator`.
  """

  def main do
    args = System.argv()

    MatrixReader.read(List.first(args))
    |> IO.inspect()
    |> Matrix.determinant()
    |> IO.inspect()
  end
end

if Mix.env() == :dev do
  DeterminantCalculator.main()
end
