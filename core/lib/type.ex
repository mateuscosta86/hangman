defmodule Type do
  @type tally :: %{
          turns_left: integer,
          game_state: Game.state(),
          letters: list(String.t()),
          used: list(String.t())
        }
end
