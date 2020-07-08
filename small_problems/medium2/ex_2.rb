# A collection of spelling blocks has two letters per block, as shown in this list:

# B:O   X:K   D:Q   C:P   N:A
# G:T   R:E   F:S   J:W   H:U
# V:I   L:Y   Z:M

# This limits the words you can spell with the blocks to just those words that do not
# use both letters from any given block. Each block can only be used once.

# Write a method that returns true if the word passed in as an argument can be spelled
# from this set of blocks, false otherwise.

def block_word?(word)
  blocks = [%w[B O], %w[X K], %w[D Q], %w[C P], %w[N A],
              %w[G T], %w[R E], %w[F S], %w[J W], %w[H U], 
              %w[V I], %w[L Y], %w[Z M]]
  word.each_char do |letter|
    return false unless blocks.reject! { |block| block.include?(letter.upcase) }
  end
  true
end

puts block_word?('BATCH') == true
puts block_word?('BUTCH') == false
puts block_word?('jest') == true
