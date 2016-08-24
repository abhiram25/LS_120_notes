<h1>Truthiness</h1>

In Ruby, booleans are represented by `true` and `false` objects.

These boolean objects also have real classes behind them and you can call methods
on true and false.

```
true.class          # => TrueClass
true.nil?           # => false
true.to_s           # => "true"
true.methods        # => list of methods you can call on the true object

false.class         # => FalseClass
false.nil?          # => false
false.to_s          # => "false"
false.methods       # => list of methods you can call on the false object
```

The output below is always `'hi'`

```
if true
  puts 'hi'
else
  puts 'goodbye'
end
```

In real code, you will almost never use the `true` or `false` objects directly in a conditional.

You will most likely evaluate a method call in a conditional.  That expression should evaluate to true or false.

```
  puts "number is less than 10" if 5 < 9
```

The above expression `5 < 9` evaluates to `true`

```
irb:001 > 5 < 9
 => true
irb:002 > (5 < 9).class
 => TrueClass
```

**Short circuiting** 

The `&&` and `||` operators exhibit a behavior called short-circuiting, which means it will stop evaluating expressions once it can
guarantee the return value.

For example

```
false && (5==5)
```

It doesn't matter what the second expression evaluates to, it will short circuit and return `false`.

An example with the `||` operator would be

```
true || (4>5)
```

Even though the second expression evaluates to false, it will short circuit because the return value of the first expression is `true`

<h1>What is Truthiness actually?</h1> 

Ruby considers more than just a regular `true` object to be `truthy`.  Everything in Ruby is considered "truthy" except `false`
and `nil`.

What is the output below?

```
num = 5

if num
  puts "valid number"
else
  puts "error!"
end
```

The output is `"valid number"` because num is considered truthy because an integer is considered truthy.

This doesn't mean that num == true.

```
num = 5
num == true => false
```

**Remember**

Everything in Ruby is considered "truthy" except `false` or `nil`.

