defmodule Core do
  alias Core.Runtime.Server

  @spec new_game :: Server.t()
  def new_game do
    {:ok, pid} = Core.Runtime.Application.start_game()
    pid
  end

  @spec make_move(Server.t(), String.t()) :: {Server.t(), Type.tally()}
  def make_move(game, guess) do
    GenServer.call(game, {:make_move, guess})
  end

  @spec tally(Server.t()) :: Type.tally()
  def tally(game) do
    GenServer.call(game, {:tally})
  end
end
