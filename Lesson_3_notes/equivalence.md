<h1>Equivalence</h1>

```
str1 = "something"
str2 = "something"

str1.class              # => String
str2.class              # => String
```

What exactly are we comparing?

We are comparing their values, not their objects.

What if we want to compare their objects?  Enter `equal?` method

```
str1 = "hi"
str2 = "hi"
str1_copy = str1

# comparing the string objects' values
str1 == str2 => true
str1 == str1_copy => true
str2 == str1_copy => true

# comparing the actual objects
str1.equal? str2 => false
str1.equal? str1_copy => true
str2.equal? str1_copy => false
```

`str1` and `str1_copy` point to the same object, which is why `str1.equal? str1_copy` returns `true`

`str1.equal? str2`  returns `false` because they both point to different objects.

The `==` method compares two variables values.

The `equal?` method determines whether two variables point to the same object.



