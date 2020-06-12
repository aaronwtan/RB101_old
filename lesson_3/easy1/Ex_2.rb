Describe the difference between ! and ? in Ruby. And explain what would happen in the following scenarios:

1. what is != and where should you use it? # a comparison operator meaning 'not equal to'; it should be used in a conditional statement
2. put ! before something, like !user_name # ! will flip to the opposite truthiness or falsiness of whatever follows and evaluate to a boolean
3. put ! after something, like words.uniq! # for certain methods, this is a naming convention used to emphasize the method 
                                           # is destructive and will mutate its caller. This does not mean all methods with a ! are destructive, though.
4. put ? before something # the only context for this would be a ternary operator, where the first statement after the ? is evaluated if the conditional
                          # before the ? is truthy, otherwise the second statement after the ? is evalutated
5. put ? after something # in the context of a method, this usually denotes that the output will be a boolean based on the implementation of the method
                         # for example, #odd? will return true if its caller is odd and false otherwise
6. put !! before something, like !!user_name # this essentially means 'not not' and will result in the object's boolean equivalent, its truthiness or falsiness
