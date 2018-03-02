defmodule Cards do
  ### next - 30. Maps %{ } -> Structures [ same: 'hue', notsame: 'hue']; Keyword lists [ ] -> For Ecto. [same: 'some', same: 'some'];

  @moduledoc """
    Provides methods for creating and handling cards.
  """

  @doc """
    Returns a list with all cards.
  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits =  ["Spades", "Clubs", "Hearts", "Diamonds"]

    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  @doc """
    Shuffle cards in the deck.
  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end #enum for any bunch of elements

  @doc """
    Checking out is certain card in deck.
  ## Examples

      iex> deck = Cards.create_deck
      iex> Cards.contains?(deck, "Ace of Spades")
      true

  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
    Divides a deck into a hand and the remainder.
    The 'hand_size' - how many cards give to it.

  ## Examples

        iex> deck = Cards.create_deck
        iex> {hand, deck} = Cards.deal(deck, 1)
        iex> hand
        ["Ace of Spades"]

  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  @doc """
    Saving certain deck.
    The 'filename' is name of file for saving to.
  """
  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  @doc """
    Loading certain deck.
    The 'filename' is name of file for loading to.
  """
  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term binary
      {:error, _reason} -> "That file doesn't exist."
    end
  end

  @doc """
    Creating a deck and dealing cards.
  """
  def create_hand(hand_size) do
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size) #dont need /2 more
  end

end
















### OFFTOP
#
#   def twonny do
#     array = [1, 3, 4, 9, 12, 5, 6, 13, -1]
#     twonny(array)
#   end
#
#   def twonny([a | rest]) do
#     b = round(20 / a) #float to int convert must!
#     case Enum.member?(rest, b)  do
#       true -> "#{a} * #{b} = 20. This array has chance to fly to the moon"
#       false -> twonny(rest)
#     end
#   end
#
#   def twonny([]) do
#     "The list is empty"
#   end
#
# end

####
### colors = %{primary: "red"}
### %{primary: "red"}
### iex(9)> Map.put(colors, :primary, "blue")
### %{primary: "blue"}
### iex(10)> colors
### %{primary: "red"}
### iex(12)> %{ colors | primary: "blue" }
### %{primary: "blue"}
### iex(13)> colors
### %{primary: "red"}
