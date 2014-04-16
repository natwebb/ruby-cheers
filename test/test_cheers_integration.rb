require_relative 'helper'

class TestCheersIntegration < MiniTest::Unit::TestCase

  def test_a_regular_name
    actual_output = ''
    IO.popen('ruby cheers.rb', 'r+') do |pipe|
      pipe.puts 'Nat'
      pipe.close_write
      actual_output = pipe.read
    end

    expected_output = <<EOS
What's your name?
Give me an... N
Give me an... A
Give me a.... T
NAT's just GRAND!
EOS
    assert_equal expected_output, actual_output
  end

  def test_a_name_with_no_capitals
    actual_output = ''
    IO.popen('ruby cheers.rb', 'r+') do |pipe|
      pipe.puts 'eliza'
      pipe.close_write
      actual_output = pipe.read
    end

    expected_output = <<EOS
What's your name?
Give me an... E
Give me an... L
Give me an... I
Give me a.... Z
Give me an... A
ELIZA's just GRAND!
EOS
    assert_equal expected_output, actual_output
  end

  def test_a_name_with_all_capitals
    actual_output = ''
    IO.popen('ruby cheers.rb', 'r+') do |pipe|
      pipe.puts 'ALEX'
      pipe.close_write
      actual_output = pipe.read
    end

    expected_output = <<EOS
What's your name?
Give me an... A
Give me an... L
Give me an... E
Give me an... X
ALEX's just GRAND!
EOS
    assert_equal expected_output, actual_output
  end

  def test_a_name_with_all_vowels
    actual_output = ''
    IO.popen('ruby cheers.rb', 'r+') do |pipe|
      pipe.puts 'Aaeio'
      pipe.close_write
      actual_output = pipe.read
    end

    expected_output = <<EOS
What's your name?
Give me an... A
Give me an... A
Give me an... E
Give me an... I
Give me an... O
AAEIO's just GRAND!
EOS
    assert_equal expected_output, actual_output
  end

  def test_a_name_with_no_vowels
    actual_output = ''
    IO.popen('ruby cheers.rb', 'r+') do |pipe|
      pipe.puts 'Btgp'
      pipe.close_write
      actual_output = pipe.read
    end

    expected_output = <<EOS
What's your name?
Give me a.... B
Give me a.... T
Give me a.... G
Give me a.... P
BTGP's just GRAND!
EOS
    assert_equal expected_output, actual_output
  end

end

