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


  def contains?(deck,card) do
    Enum.member?(deck,card)
  end


end
