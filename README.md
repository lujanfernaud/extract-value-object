# Upcase Refactoring Trail

## Extract Value Object

Refactoring exercise extracting a [Value Object](https://martinfowler.com/bliki/ValueObject.html) for the [Upcase Refactoring Trail](https://thoughtbot.com/upcase/refactoring).

### Extract Value Object

> [...]their notion of equality isn’t based on identity, instead two value objects are equal if all their fields are equal. -- Martin Fowler

> [...]value objects which have the same internal fields must equal to each other. The value of all fields sufficiently determines the equality of a value object. -- Steven Yang

#### Before

```ruby
# report_card.rb

class ReportCard
  attr_accessor :grades

  def initialize(attributes = {})
    @scores = attributes[:scores]
    @grades ||= grade_scores
  end

  private

  def grade_scores
    @scores.map do |score|
      grade_score(score)
    end
  end

  def grade_score(score)
    if score < 60
      'F'
    elsif score < 70
      'D'
    elsif score < 80
      'C'
    elsif score < 90
      'B'
    else
      'A'
    end
  end
end
```

#### After

```ruby
# report_card.rb

class ReportCard
  attr_reader :grades

  def initialize(attributes = {})
    @scores   = attributes[:scores]
    @grades ||= grade_scores
  end

  private

  def grade_scores
    @scores.map { |score| Grade.letter_for score }
  end
end
```

```ruby
# grade.rb

class Grade
  attr_reader :letter

  def self.letter_for(score)
    new(score).letter
  end

  def initialize(score)
    @score  = score
    @letter = letter_for_score
  end

  private

  def letter_for_score
    case @score
    when  1..59 then 'F'
    when 60..70 then 'D'
    when 70..80 then 'C'
    when 80..90 then 'B'
    else             'A'
    end
  end
end

```

### Additional Resources

- [Value Objects Explained with Ruby](https://www.sitepoint.com/value-objects-explained-with-ruby/)
