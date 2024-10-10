defmodule Matrix do
  defstruct rows: []

  def new(), do: %Matrix{rows: []}
  def new(rows), do: %Matrix{rows: rows}
end
