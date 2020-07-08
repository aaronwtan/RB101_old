# Write a method that takes a sentence string as input, and returns the same
# string with any sequence of the words 'zero', 'one', 'two', 'three', 'four',
# 'five', 'six', 'seven', 'eight', 'nine' converted to a string of digits.

DIGIT_WORDS = %w(zero one two three four five six seven eight nine).freeze

def word_to_digit(sentence)
  DIGIT_WORDS.each { |word| sentence.gsub!(/\b#{word}\b/, DIGIT_WORDS.index(word).to_s) }
  sentence
end

puts word_to_digit('Please call me at five five five one two three four. ' \
                   'Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'

# Further Exploration
def word_to_digit2(sentence)
  DIGIT_WORDS.each { |word| sentence.gsub!(/\b?#{word} ?\b/i, DIGIT_WORDS.index(word).to_s) }
  sentence.gsub!(/(\d{3})?(\d{3})(\d{4})/, '(\1) \2-\3')
  sentence.gsub!(/(\d)([a-zA-Z])/, '\1 \2')
  sentence
end

puts word_to_digit2('Please call me at FIVE FIVE FIVE One two three Four five six seven. ' \
                    'Thanks. 5 2 0') == 'Please call me at (555) 123-4567. Thanks. 5 2 0'
puts word_to_digit2('one Two THree FOUr FIVE SIX sEVEN eiGHT ninE zero hi zero hi one two 1 2')
puts word_to_digit2('Please call me at four one six five five five one two three four between ' \
                    'eight AM and six PM. Thanks.') == 'Please call me at (416) 555-1234 between 8 AM and 6 PM. Thanks.'
