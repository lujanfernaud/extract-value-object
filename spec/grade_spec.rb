require 'spec_helper'

describe Grade do
  describe '.letter_for' do
    it 'returns letter for the score given' do
      score = 99
      expect(Grade.letter_for score).to eq('A')
    end
  end

  describe '#letter' do
    it 'returns A for a score 90 or greater' do
      letter = 'A'
      score  = 99

      expect(described_class.new(score).letter).to eq(letter)
    end

    it 'returns B for a score between 80 and 90' do
      letter = 'B'
      score  = 85

      expect(described_class.new(score).letter).to eq(letter)
    end

    it 'returns C for a score between 70 and 80' do
      letter = 'C'
      score  = 75

      expect(described_class.new(score).letter).to eq(letter)
    end

    it 'returns D for a score between 60 and 70' do
      letter = 'D'
      score  = 65

      expect(described_class.new(score).letter).to eq(letter)
    end

    it 'returns F for a score less than 60' do
      letter = 'F'
      score  = 50

      expect(described_class.new(score).letter).to eq(letter)
    end
  end

  describe '#score' do
    it 'returns grade score' do
      score  = 50
      letter = 'F'

      expect(described_class.new(score).letter).to eq(letter)
    end
  end

  describe '#==' do
    it 'returns true if all the fields are equal' do
      sandi_grades = described_class.new(99)
      matz_grades  = described_class.new(99)

      expect(sandi_grades == matz_grades).to eq(true)
    end

    it 'returns false if all the fields are not equal' do
      juan_grades  = described_class.new(96)
      maria_grades = described_class.new(97)

      expect(juan_grades == maria_grades).to eq(false)
    end
  end

  describe '#eql?' do
    it 'returns true if all the fields are equal' do
      sandi_grades = described_class.new(99)
      matz_grades  = described_class.new(99)

      expect(sandi_grades.eql?(matz_grades)).to eq(true)
    end

    it 'returns false if all the fields are not equal' do
      juan_grades  = described_class.new(96)
      maria_grades = described_class.new(97)

      expect(juan_grades.eql?(maria_grades)).to eq(false)
    end
  end
end
