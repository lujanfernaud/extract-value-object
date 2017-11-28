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
