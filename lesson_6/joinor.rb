def joinor(elements, delimiter = ', ', word = 'or')
  case elements.size
  when 0 then ''
  when 1 then elements.first
  when 2 then elements.join(" #{word} ")
  else
    elements[-1] = "#{word} #{elements.last}"
    elements.join(delimiter)
  end
end

p joinor([1, 2])                   # => "1 or 2"
p joinor([1, 2, 3])                # => "1, 2, or 3"
p joinor([1, 2, 3], '; ')          # => "1; 2; or 3"
p joinor([1, 2, 3], ', ', 'and')   # => "1, 2, and 3"
