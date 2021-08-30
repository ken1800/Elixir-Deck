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
    # convert the binary into a normal text format. This is a two way comparison.
    # we are comparing both the values and assigning it at the same time.
    case File.read(filename) do
       {:ok,binary} -> :erlang.binary_to_term binary
       {:error, _reason}-> "Sorry the file does not exist"
    end
  end

  def creat_hand(hand) do
    # using pipe operator
    Cards.create_deck |> Cards.shuffle |> Cards.deal(hand)
  end


  def maps do
   obj= %{name: "Kenneth",age: 24}
   obj
  end


  def cases do
     case 1 do
        x when hd(x) -> "Won't match"
        x -> "Got #{x}"
      end
  end
end
