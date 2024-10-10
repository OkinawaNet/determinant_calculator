defmodule MatrixTest do
  use ExUnit.Case
  import Matrix
  import MatrixReader

  test "Матрица порядка 2. Определитель 3." do
    matrix = read("test/fixtures/matrix_2_det_3")
    assert determinator(matrix) == 3
  end

  test "Матрица порядка 3. Определитель 5." do
    matrix = read("test/fixtures/matrix_3_det_5")
    assert determinator(matrix) == 5
  end

  test "Матрица порядка 10. Определитель 0." do
    matrix = read("test/fixtures/matrix_10_det_0")
    assert determinator(matrix) == 0
  end

  test "Матрица порядка 5. Определитель 64." do
    matrix = read("test/fixtures/matrix_5_det_64")
    assert determinator(matrix) == 64
  end

  test "Матрица порядка 10. Определитель 1." do
    matrix = read("test/fixtures/matrix_10_det_1")
    assert determinator(matrix) == 1
  end
end
