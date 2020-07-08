# Write a method that takes a string as argument, and returns true
# if all parentheses in the string are properly balanced, false otherwise.
# To be properly balanced, parentheses must occur in matching '(' and ')' pairs.

# Note that balanced pairs must each start with a (, not a ).

def balanced?(string)
  states = Hash.new(0)
  string.each_char do |char|
    case char
    when '('  then states[:parentheses] += 1
    when ')'  then states[:parentheses] -= 1
    when '['  then states[:sq_brackets] += 1
    when ']'  then states[:sq_brackets] -= 1
    when '{'  then states[:curly_brackets] += 1
    when '}'  then states[:curly_brackets] -= 1
    when '\'' then states[:single_quotes] += (states[:single_quotes].zero? ? 1 : -1) if states[:double_quotes].zero?
    when '"'  then states[:double_quotes] += (states[:double_quotes].zero? ? 1 : -1)
    end
    return false if states.values.any?(&:negative?)
  end
  states.values.all?(&:zero?)
end

puts balanced?('What (is) this?') == true
puts balanced?('What is) this?') == false
puts balanced?('What (is this?') == false
puts balanced?('((What) (is this))?') == true
puts balanced?('((What)) (is this))?') == false
puts balanced?('Hey!') == true
puts balanced?(')Hey!(') == false
puts balanced?('What ((is))) up(') == false

puts balanced?('{[((What) (is this))]?}') == true
puts balanced?("He said to me, \"You're my special friend!\"") == true
puts balanced?("He said to me, 'You are indeed my special friend.'") == true
# puts balanced?('({)}') == false
