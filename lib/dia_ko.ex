defmodule DiaKO do
  def x(arg) do
    case foo(arg) do
      :ok ->
        case bar(arg) do
          :ok ->
            :ok

          :error ->
            :ok
        end

      :error ->
        raise ""
    end
  end

  defp foo(x) when x >= 1, do: :ok
  defp foo(_), do: :error

  defp bar(x) when x >= 1, do: :ok
  defp bar(_), do: :error
end
