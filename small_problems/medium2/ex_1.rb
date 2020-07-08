# Write a program that reads the content of a text file and then prints the
# longest sentence in the file based on number of words. Sentences may end
# with periods (.), exclamation points (!), or question marks (?).
# Any sequence of characters that are not spaces or sentence-ending
# characters should be treated as a word. You should also print the number
# of words in the longest sentence.

gettysburg_text = File.read('gettysburg.txt')
pg84_text = File.read('pg84.txt')

def longest_sentence(text, file)
  sentences = text.split(/(?<=[\.!?])\s*/)
  longest_sentence = sentences.max_by { |sentence| sentence.split.size }
  puts "#{'-' * 80}\n>> Longest sentence of #{file}:\n"
  puts longest_sentence.strip
  puts "\n>> which contains #{longest_sentence.split.size} words."
end

longest_sentence(gettysburg_text, 'Gettysburg Address')
longest_sentence(pg84_text, 'Frankenstein pg 84')

# Further Exploration
def longest_paragraph(text, file)
  paragraphs = text.split(/(?<=[\.!?])\s{2,}/)
  longest_paragraph = paragraphs.max_by { |paragraph| paragraph.split.size }
  puts "#{'-' * 80}\n>> Longest paragraph of #{file}:\n"
  puts longest_paragraph.strip
  puts "\n>> which contains #{longest_paragraph.split.size} words."
end

longest_paragraph(gettysburg_text, 'Gettysburg Address')
longest_paragraph(pg84_text, 'Frankenstein pg 84')

def longest_word(text, file)
  words = text.split(/[^a-z]/i)
  longest_word = words.max_by(&:length)
  puts "#{'-' * 80}\n>> Longest word of #{file}:\n"
  puts longest_word
  puts "\n>> which is #{longest_word.length} letters long."
end

longest_word(gettysburg_text, 'Gettysburg Address')
longest_word(pg84_text, 'Frankenstein pg 84')
