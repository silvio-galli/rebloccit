module RandomData

	# Create word
	def random_word
		letters = ('a'..'z').to_a
		letters.shuffle!
		letters[0,rand(3..8)].join
	end

	# Create sentence
	def random_sentence
		strings = []
		rand(4..10).times do
			strings << random_word
		end
		sentence = strings.join(" ")
		sentence.capitalize << "."
	end

	# Create paragraph
	def random_paragraph
		sentences = []
		rand(4..6).times do
			sentences << random_sentence
		end
		sentences.join(" ")
	end

	def random_number
		numbers = (0..9).to_a
		numbers.shuffle!
		numbers[0,rand(1..3)].join
	end
end