require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'

class CardTest < Minitest::Test
  def test_it_exists
    card = Card.new("What is the capital of Alaska?", "Juneau")

    assert_instance_of Card, card
  end

  def test_card_has_question_and_answer
    card = Card.new("What is the capital of Alaska?", "Juneau")
#format?
    expected_question = "What is the capital of Alaska?"
    expected_answer = "Juneau"

    assert_equal expected_question, card.question
    assert_equal expected_answer, card.answer
  end

end
