defmodule CardsTest do
  use ExUnit.Case
  doctest Cards #autotest examples in files :)

  test "Create deck 20 cards" do
    deck_length = length(Cards.create_deck)
    assert deck_length == 20
  end

  test "does it really shuffle a deck" do
    deck = Cards.create_deck
    refute deck == Cards.shuffle(deck) #reversed to assert where '!=', not '=='
  end

end
