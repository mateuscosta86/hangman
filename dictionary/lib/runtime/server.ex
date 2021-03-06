defmodule Dictionary.Runtime.Server do
  use Agent
  alias Dictionary.Impl.WordList

  @type t :: pid

  @spec start_link(any) :: {:error, any} | {:ok, pid}
  def start_link(_init) do
    Agent.start_link(&WordList.word_list/0, name: __MODULE__)
  end

  def random_word() do
    Agent.get(__MODULE__, &WordList.random_word/1)
  end
end
