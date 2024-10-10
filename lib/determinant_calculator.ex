defmodule DeterminantCalculator do
  @moduledoc """
  Documentation for `DeterminantCalculator`.
  """

  def main do
    MatrixReader.read("test/fixtures/matrix_10_det_3")
    |> IO.inspect
  end
end

DeterminantCalculator.main()
