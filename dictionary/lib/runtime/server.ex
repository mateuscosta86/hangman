defmodule Dictionary.Runtime.Server do
  alias Dictionary.Impl.WordList

  @type t :: pid

  @spec start_link :: {:error, any} | {:ok, pid}
  def start_link() do
    Agent.start_link(&WordList.word_list/0, name: __MODULE__)
  end

  def random_word() do
    Agent.get(__MODULE__, &WordList.random_word/1)
  end
end
