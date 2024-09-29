defmodule DiaOK do
  def x(arg) do
    with {:foo, :ok} <- {:foo, foo(arg)},
         {:bar, :ok} <- {:bar, bar(arg)} do
      :ok
    else
      {:foo, :error} ->
        raise ""

      {:bar, :error} ->
        :ok
    end
  end

  defp foo(x) when x >= 1, do: :ok
  defp foo(_), do: :error

  defp bar(x) when x >= 1, do: :ok
  defp bar(_), do: :error
end

# ELIXIR 1.16.3 - ERLANG 26.2.5
# ---------------------------
# OK

# ELIXIR 1.17.3 - ERLANG 26.2.5
# -----------------------------
# lib/dia_ok.ex:3:apply
# Function application with arguments (_ :: {:foo, :error}) will never return since the 1st arguments differ
# from the success typing arguments:
#
# ({:bar, :error})


# ELIXIR 1.17.3 - ERLANG 27.1
# ---------------------------
# lib/dia_ok.ex:3:apply
# Function application with arguments (_ :: {:foo, :error}) will never return since the 1st arguments differ
# from the success typing arguments:
#
# ({:bar, :error})
