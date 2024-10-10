defmodule Matrix do
  defstruct rows: []

  def new(rows), do: %Matrix{rows: rows}
end
