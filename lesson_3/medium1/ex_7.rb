# One day Spot was playing with the Munster family's home computer
# and he wrote a small program to mess with their demographic data:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end

# After writing this method, he typed the following...
# and before Grandpa could stop him, he hit the Enter key with his tail:

mess_with_demographics(munsters)
puts "Messing..."
puts "munsters: #{munsters}"

# Did the family's data get ransacked? Why or why not?

# Yes, key value reassignments are able to mutate the original hash
# that is being referenced
# demo_hash refers to the original munsters hash and is never reassigned
# to a different object, so acting on demo_hash directly affects munsters


# method to preserve original munsters
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def dont_mess_with_demographics(demo_hash)
  new_hash = {}
  demo_hash.each do |family_member, demos|
    new_hash[family_member] = {"age"    => demo_hash[family_member]["age"] + 42, 
                               "gender" => "other"}
  end
  new_hash
end

new_munsters = dont_mess_with_demographics(munsters)
puts "No messing..."
puts "new_munsters: #{new_munsters}"
puts "munsters: #{munsters}"
