# Write a method that takes a single String argument and returns a
# new string that contains the original value of the argument with the
# first character of every word capitalized and all other letters lowercase.

# You may assume that words are any sequence of non-blank characters.

def word_cap(string)
  string.split.map(&:capitalize).join(' ')
end

puts word_cap('four score and seven') == 'Four Score And Seven'
puts word_cap('the javaScript language') == 'The Javascript Language'
puts word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

# Further Exploration
LOWERCASE_LETTERS = ('a'..'z').to_a
UPPERCASE_LETTERS = ('A'..'Z').to_a

def word_cap2(string)
  words = string.split
  word_counter = 0

  loop do
    break if word_counter == words.size

    current_word = words[word_counter]
    
    alphabet_counter = 0
    loop do
      break if alphabet_counter == 26

      char_counter = 0
      loop do
        break if char_counter == current_word.length

        if char_counter == 0
          if current_word[char_counter] == LOWERCASE_LETTERS[alphabet_counter]
            current_word[char_counter] = UPPERCASE_LETTERS[alphabet_counter]
          end
        else
          if current_word[char_counter] == UPPERCASE_LETTERS[alphabet_counter]
            current_word[char_counter] = LOWERCASE_LETTERS[alphabet_counter]
          end
        end

        char_counter += 1
      end

      alphabet_counter += 1
    end

    word_counter += 1
  end

  words.join(' ')
end

puts word_cap2('four score and seven') == 'Four Score And Seven'
puts word_cap2('the javaScript language') == 'The Javascript Language'
puts word_cap2('this is a "quoted" word') == 'This Is A "quoted" Word'
