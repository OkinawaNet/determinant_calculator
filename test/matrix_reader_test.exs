defmodule MatrixReaderTest do
  use ExUnit.Case
  import MatrixReader

  test "пустой файл" do
    assert read("test/fixtures/matrix_empty") == Matrix.new()
  end

  test "Файл с норм данными" do
    expected_matrix = Matrix.new([[1, -2], [1, 1]])

    assert read("test/fixtures/matrix_2_det_3") == expected_matrix
  end

  test "Файл с плохими данными" do
    assert_raise ArgumentError, fn ->
      read("test/fixtures/matrix_10_bad_symbol")
    end
  end
end
