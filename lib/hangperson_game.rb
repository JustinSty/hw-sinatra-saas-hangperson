class HangpersonGame

  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/hangperson_game_spec.rb pass.

  # Get a word from remote "random word" service

  # def initialize()
  # end
  
  def initialize(word)
    @word = word.downcase
    @guesses = ''
    @wrong_guesses = ''
  end
  
  def word
    @word
  end
  
  def guesses
    @guesses
  end
  
  def wrong_guesses
    @wrong_guesses
  end
  
  def word= w
    @word = w.downcase
  end
  
  def guesses= g
    @guesses = g.downcase
  end
  
  def wrong_guesses= g
    @wrong_guesses = g.downcase
  end
  
  def guess c
    if c == nil or c == '' or not c =~ /[[:alpha:]]/
      raise ArgumentError
    end
    c = c.downcase
    if @word.include? c
      if not @guesses.include? c
        @guesses = @guesses + c
        true
      else
        false
      end
    else
      if not @wrong_guesses.include? c
        @wrong_guesses = @wrong_guesses + c
        true
      else
        false
      end
    end
  end
    
  def word_with_guesses
    d = ''
    @word.split('').each do |i|
      if @guesses.include? i
        d = d + i
      else
        d = d + '-'
      end
    end
    d
  end

  def check_win_or_lose
    if @wrong_guesses.length >= 7
      :lose
    elsif not word_with_guesses.include? '-'
      :win
    else
      :play
    end
  end

  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.post_form(uri ,{}).body
  end
  
end

