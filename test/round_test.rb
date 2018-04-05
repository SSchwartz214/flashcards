require 'minitest/autorun'
require 'minitest/pride'
require './lib/round'
require './lib/card'
require './lib/guess'
require './lib/deck'

class RoundTest < Minitest::Test
  def test_each_round_has_a_deck_of_cards
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical
      unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    assert_instance_of Deck, deck
  end

  def test_each_round_has_guesses
      card_1 = Card.new("What is the capital of Alaska?", "Juneau")
      card_2 = Card.new("Approximately how many miles are in one astronomical
        unit?", "93,000,000")
      deck = Deck.new([card_1, card_2])
      round = Round.new(deck)

      assert_equal [], round.guesses
  end

  def test_current_card
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical
      unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    assert_equal card_1, round.current_card
  end

  def test_record_guess

    # round.record_guess("Juneau")
    # => #<Guess:0x007ffdf19c8a00 @card=#<Card:0x007ffdf1820a90 @answer="Juneau", @question="What is the capital of Alaska?">, @response="Juneau">
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical
      unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    guess = Guess.new("Juneau", card_1)

    assert_instance_of Guess, guess
    assert_equal "Juneau", guess.response
  end

  def test_count_guesses
    # round.guesses.count
    # => 1
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical
      unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    response = "response"
    guess = Guess.new(response, card_1)
    round.record_guess(response, deck)

    assert_equal 1, round.guesses.count

  end

def test_feedback
  card_1 = Card.new("What is the capital of Alaska?", "Juneau")
  deck = Deck.new([card_1])
  round = Round.new(deck)

  response = "Juneau"
  guess = Guess.new(response, card_1)
  round.guesses << guess

  assert_equal "Correct!", round.guesses.first.feedback
end


end


# round.guesses.first.feedback
# => "Correct!"

# round.number_correct
# => 1

# round.current_card
# => #<Card:0x007ffdf1820a90 @answer="93,000,000", @question="Approximately how many miles are in one astronomical unit?">

# round.record_guess("2")
# => #<Guess:0x007ffdf19c8a00 @card=#<Card:0x007ffdf1820a90 @answer="93,000,000", @question="Approximately how many miles are in one astronomical unit?">, @response="2">

# round.guesses.count
# => 2

# round.guesses.last.feedback
# => "Incorrect."

# round.number_correct
# => 1

# round.percent_correct
# => 50
