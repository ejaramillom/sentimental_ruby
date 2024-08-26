require 'csv'
require_relative 'sentimental_ruby'

module SentimentalCSV
	@batch_size, @positive, @negative, @neutral =  10, 0, 0, 0

	def self.file_analyzer(results_path, file_path)
		prepare_results_file(results_path)

		CSV.open(file_path, headers: true) do |file|
			batch_size_analysis(file)
		end

		puts "Positive reviews: #{@positive}, Negative reviews: #{@negative}, Neutral reviews: #{@neutral}"
	end

	private

	def self.batch_size_analysis(file)
		file.each_slice(@batch_size) do |rows|
			rows_sentiment(rows)
		end
	end

	def self.rows_sentiment(rows)
		rows.each do |row|
			write_csv_output(row)
		end
	end

	def self.write_csv_output(row)
		row_sentiment = SentimentalAnalysis.new(row[1]).call
		count_sentiment(row_sentiment.to_s)

		CSV.open("sentiment_results.csv", "a") do |csv|
			csv << [row[0], row[1], row_sentiment]
		end
	end

	def self.prepare_results_file(file_name)
		File.delete(file_name) if File.exist?(file_name)

		CSV.open(file_name, "w") do |csv|
			csv << %w[id review sentiment]
		end
	end

	def self.count_sentiment(sentiment)
		@positive += 1 if sentiment == "positive"
		@negative += 1 if sentiment == "negative"
		@neutral += 1 if sentiment == "neutral"
	end
end

# SentimentalCSV.file_analyzer('sentiment_results.csv', 'sentiment_analysis.csv')
