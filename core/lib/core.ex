defmodule Core do
  alias Core.Impl.Game

  @spec new_game :: Game.t()
  defdelegate new_game, to: Game

  @spec make_move(Game.t(), String.t()) :: {Game.t(), Type.tally()}
  defdelegate make_move(game, guess), to: Game

  @spec tally(Game.t()) :: Type.tally()
  defdelegate tally(game), to: Game
end
