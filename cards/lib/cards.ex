defmodule Cards do


  def create_deck do
   values = ["Age","Name","Group","School"]
   people = ["Kenneth","Gladys","Mary","Dennis"]

  #  list comprehension

   for person <- people, value <- values  do
    "#{person} of #{value}"
   end

  end

  def shuffle (deck) do
    Enum.shuffle(deck)
  end


  def deal(decks,hand) do
    Enum.split(decks,hand)
  end

  def contains?(deck,card) do
    Enum.member?(deck,card)
  end

  def save(deck,filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename,binary)
  end

  def read(filename) do
    # read the file from the file system
    {status,binary} = File.read(filename)
    # convert the binary into a normal text format.
    case status do
       :ok-> :erlang.binary_to_term binary
       :error-> "Sorry the file does not exist"

    end


  end

end
