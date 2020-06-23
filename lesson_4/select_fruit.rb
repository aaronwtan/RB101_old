# Method to select the key-value pairs where the value is 'Fruit'.

def select_fruit(produce)
  produce_keys = produce.keys
  fruits = {}
  counter = 0

  loop do
    break if counter >= produce.size

    current_key = produce_keys[counter]
    current_value = produce[current_key]
    fruits[current_key] = current_value if current_value == 'Fruit'
    counter += 1
  end

  fruits
end

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

p select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}
