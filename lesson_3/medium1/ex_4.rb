# Alyssa was asked to write an implementation of a rolling buffer.
# Elements are added to the rolling buffer and if the buffer becomes full,
# then new elements that are added will displace the oldest elements in the buffer.

# She wrote two implementations saying, "Take your pick. Do you like << or +
# for modifying the buffer?". Is there a difference between the two,
# other than what operator she chose to use to add an element to the buffer?

def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

# Yes, using the << operator will directly mutate the original object referenced
# by the buffer parameter, even if it is outside of the method.
# Thus the method not only returns the value of buffer,
# but also has a mutating side effect
# Using the + operator does not change input_array nor any outside variables
# referencing the same object
# Thus the sole effect of the method is to return the value of buffer
