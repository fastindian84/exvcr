defmodule ExVCR.Util do
  @moduledoc """
  Provides utility functions.
  """

  @doc """
  Returns uniq_id string based on current timestamp (ex. 1407237617115869)
  """
  def uniq_id do
    :os.timestamp |> Tuple.to_list |> Enum.join("")
  end

  @doc """
  Takes a keyword lists and returns them as strings.
  """
  def stringify_keys(list), do: stringify_keys(list, [])
  def stringify_keys([], acc), do: acc
  def stringify_keys([head | tail], acc) do
    {key, value} = case is_map(head) do
      false -> head
      true -> head |> Map.to_list() |> hd
    end

    stringify_keys(tail, [{to_string(key), to_string(value)} | acc])
  end
end
