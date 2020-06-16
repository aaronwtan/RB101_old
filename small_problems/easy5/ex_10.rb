# Write a method that will take a short line of text,
# and print it within a box.
MAX_WIDTH = 76

def print_in_box(text)
  if text.length > MAX_WIDTH
    text = text[0..MAX_WIDTH - 1]
    text[MAX_WIDTH - 3..MAX_WIDTH - 1] = '...'
  end
  top = "+#{'-' * (text.length + 2)}+"
  bottom = top
  inner =  "|#{' ' * (text.length + 2)}|"

  puts top
  puts inner
  puts "| #{text} |"
  puts inner
  puts bottom
end

print_in_box('To boldly go where no one has gone before.')
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+

print_in_box('')
# +--+
# |  |
# |  |
# |  |
# +--+

# Further Exploration
MAX_WIDTH = 76

def wrap_text(text)
  wrapped_text = []
  i = 0
  while i < text.length
    wrapped_text << text.slice(i, MAX_WIDTH)
    i += MAX_WIDTH
  end
  wrapped_text
end

def create_borders(text)
  if text.length > MAX_WIDTH
    top = "+#{'-' * (MAX_WIDTH + 2)}+"
    inner = "|#{' ' * (MAX_WIDTH + 2)}|"
  else
    top = "+#{'-' * (text.length + 2)}+"
    inner = "|#{' ' * (text.length + 2)}|"
  end
  bottom = top
  [top, inner, bottom]
end

def print_text(text)
  if text.length > MAX_WIDTH
    wrapped_text = wrap_text(text)
    # negative width value to left justify format
    wrapped_text.each { |line| puts format("| %-76s |", line) }
  else
    puts "| #{text} |"
  end
end

def print_long_text_in_box(long_text)
  top, inner, bottom = create_borders(long_text)

  puts top
  puts inner
  print_text(long_text)
  puts inner
  puts bottom
end

print_in_box('To boldly go where no one has gone before. ' * 100)
print_long_text_in_box('To boldly go where no one has gone before. ' * 100)
print_long_text_in_box('To boldly go where no one has gone before. ')
