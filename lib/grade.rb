class Grade
  attr_reader :score, :letter

  def self.letter_for(score)
    new(score).letter
  end

  def initialize(score)
    @score  = score
    @letter = letter_for_score
  end

  def ==(other)
    self.class == other.class &&
      score  == other.score &&
      letter == other.letter
  end

  alias eql? ==

  private

  def letter_for_score
    case score
    when  1..59 then 'F'
    when 60..70 then 'D'
    when 70..80 then 'C'
    when 80..90 then 'B'
    else             'A'
    end
  end
end
