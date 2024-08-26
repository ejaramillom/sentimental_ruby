require 'sentimental'
require_relative 'sentimental_constants'

class SentimentalAnalysis
	def initialize(input)
		@analysis = Sentimental.new
		@analysis.load_defaults
		@input = input
	end

  def call
	  @input = lowercase(@input)
	  @input = process_punctuation(@input)
	  @input = tokenize(@input)
	  @input = stopword_removal(@input)
	  @input = rebuild(@input)
	  analyze(@input)
  end

	private

	def analyze(input)
		@analysis.sentiment input
	end

	def lowercase(input)
		input.downcase
	end

	def process_punctuation(input)
		input.gsub(/[[:punct:]]/, '')
	end

	def tokenize(input)
		input.split
	end

	def stopword_removal(input)
		input.reject{ |token| SentimentalConstants::STOPWORDS.include?(token) }
	end

	def rebuild(input)
		input.join(' ')
	end
end

# text = "I love this product!, It's fantastic if a."
# other = 'i hate him then while, he is the worst'
#
# SentimentalAnalysis.new(text).call
# SentimentalAnalysis.new(other).call
