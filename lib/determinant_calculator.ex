defmodule DeterminantCalculator do
  @moduledoc """
  Documentation for `DeterminantCalculator`.
  """


  def main do
    MatrixReader.read("test/fixtures/matrix_2_det_3")
    |> Matrix.determinator()
    |> IO.inspect
  end
end

DeterminantCalculator.main()
