defmodule Bob do
  def hey(input) do
    input
    |> determine_response()
  end

  defp determine_response(input) do
    cond do
      empty?(input) -> "Fine. Be that way!"
      shouting_statement?(input) -> "Whoa, chill out!"
      shouting_question?(input) -> "Calm down, I know what I'm doing!"
      asking_question?(input) -> "Sure."
      true -> "Whatever."
    end
  end

  defp empty?(input) do
    String.trim(input) == ""
  end

  defp shouting_statement?(input) do
    String.match?(input, ~r/([[:upper:]]+\!$)|(\d\!$)|([[:upper:]]+$)/u)
  end

  defp shouting_question?(input) do
    String.match?(input, ~r/^\s*.*[A-Z]+\?$/)
  end

  defp asking_question?(input) do
    String.match?(input, ~r/([a-z]+\?$)|(\d\?$)/)
  end
end
