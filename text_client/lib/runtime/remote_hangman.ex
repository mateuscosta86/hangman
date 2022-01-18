defmodule TextClient.Runtime.RemoteHangman do
  @remote_Server :hangman@SA19203

  def connect() do
    :rpc.call(@remote_Server, Core, :new_game, [])
  end
end
