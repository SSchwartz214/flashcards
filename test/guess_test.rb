require 'minitest/autorun'
require 'minitest/pride'
require './lib/guess'
require './lib/card'

class GuessTest < Minitest::Test
  def test_it_exists
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)

    assert_instance_of Guess, guess
  end

  def test_each_guess_has_a_card
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)
    assert_equal card, guess.card
  end

  def test_each_guess_has_a_response
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)

    assert_equal "Juneau", guess.response
  end

  def test_if_guess_is_right
    card1 = Card.new("What is the capital of Alaska?", "Juneau")
    card2 = Card.new("Which planet is closest to the sun?", "Mercury")

    guess1 = Guess.new("Juneau", card1)
    guess2 = Guess.new("Saturn", card2)

    assert guess1.correct?
    refute guess2.correct?
  end

  def test_give_feedback
    card1 = Card.new("What is the capital of Alaska?", "Juneau")
    card2 = Card.new("Which planet is closest to the sun?", "Mercury")

    guess1 = Guess.new("Juneau", card1)
    guess2 = Guess.new("Saturn", card2)

    assert_equal "Correct!", guess1.feedback
    assert_equal "Incorrect.", guess2.feedback
  end

end
