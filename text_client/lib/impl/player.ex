defmodule TextClient.Impl.Player do
  @typep game :: Core.Impl.Game.t()
  @typep tally :: Type.tally()
  @typep state :: {game, tally}

  def start(game) do
    tally = Core.tally(game)

    interact({game, tally})
  end

  @spec interact(state) :: :ok
  def interact({_game, %{game_state: :won}}) do
    IO.puts("Congratulations. You won!")
  end

  def interact({game, %{game_state: :lost}}) do
    IO.puts("Sorry, You lost! The word was #{game.letters |> Enum.join()}.")
  end

  def interact({game, tally}) do
    IO.puts(feedback_for(tally))
    IO.puts(current_word(tally))
    tally = Core.make_move(game, get_guess())
    interact({game, tally})
  end

  defp feedback_for(tally = %{game_state: :initializing}) do
    "Welcome! I'm thinking of a #{tally.letters |> length()} letters word."
  end

  defp feedback_for(%{game_state: :good_guess}), do: "Good guess!"
  defp feedback_for(%{game_state: :bad_guess}), do: "Sorry, that letter's not in the word."
  defp feedback_for(%{game_state: :already_used}), do: "You already used that letter."

  defp current_word(tally) do
    [
      "Word so far: ",
      tally.letters |> Enum.join(" "),
      "\nTurns left: ",
      tally.turns_left |> to_string(),
      "\nUsed so far: ",
      tally.used |> Enum.join(", ")
    ]
  end

  defp get_guess() do
    IO.gets("Next letter: ")
    |> String.trim()
    |> String.downcase()
  end
end
