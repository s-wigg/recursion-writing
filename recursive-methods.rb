# Authoring recursive algorithms. Add comments including time and space complexity for each method.
def factorial(n)
  return 1 if n == 0
  return n * factorial(n - 1)
end

def reverse(s)
  return s if s.length <= 1
  new_s = ""
  new_s << s[-1] + reverse(s[0..-2])
end

def reverse_inplace(s)
  return s if s.length <= 1
  return reverse_inplace_recursive(s, 0, (s.length - 1))
end

def reverse_inplace_recursive(s, index1, index2)
  return s if index2 <= index1
  temp = s[index1]
  s[index1] = s[index2]
  s[index2] = temp
  index1 += 1
  index2 -= 1
  return reverse_inplace_recursive(s, index1, index2)
end

def bunny(n)
  return 0 if n == 0
  return 2 + bunny( n - 1 )
end

def nested(s)
  return true if s.length == 0
  unless s[0] == "(" && s[-1] == ")"
    return false
  end
  nested(s[1..-2])
end

def search(array, value)
  return false if array.length == 0
  if array.shift == value
    return true
  else
    search(array,value)
  end
end

# no new string
def is_palindrome(s)
  return true if s.length <= 1
  return pal(s, 0, (s.length - 1))
end

def pal(s, index1, index2)
  if index2 <= index1
    return true
  end
  if s[index1] != s[index2]
    return false
  else
    index1 += 1
    index2 -= 1
  end
  return pal(s, index1, index2)
end


# uses wrapper method

def digit_match(n, m)
  return match(n, m, 0)
end

def match(n, m, count)
  if n <= 0 || m <= 0
    return count
  end
  if n % 10 == m % 10
    count += 1
  end
  return match((n / 10), (m / 10), count)
end




# Factorial Tests
raise "factorial broke - factorial(4)" unless factorial(4) == 24
raise "factorial broke - factorial(0)" unless factorial(0) == 1
puts "passes all factorial tests"

# Reverse Tests
raise "reverse broke - reverse('hello world')" unless reverse("hello world") == "dlrow olleh"
raise "reverse broke - reverse('a b c')" unless reverse("a b c") == "c b a"
puts "passes all reverse tests"

# Reverse In place Tests
str_1 = 'hello world'
reverse_inplace(str_1)
raise "reverse broke - reverse_inplace('hello world')" unless str_1 == "dlrow olleh"
str_2 = 'a b c'
reverse_inplace(str_2)
raise "reverse broke - reverse_inplace('a b c')" unless str_2 == "c b a"
puts "passes all reverse_inplace tests"

# Bunny Tests
raise "bunny broke - bunny(0)" unless bunny(0) == 0
raise "bunny broke - bunny(10)" unless bunny(10) == 20
puts "passes all bunny tests"

# Nested Tests
raise "nested broke - nested('((()))')" unless nested("((()))") == true
raise "nested broke - nested('())')" unless nested("())") == false
puts "passes all nested tests"

# Search Tests
arr_1 = [34, 45, 21, 4, 67]
raise "search broke - search([34, 45, 21, 4, 67], 4)" unless search(arr_1, 4) == true
arr_2 = [24, 51, 11]
raise "search broke - search([24, 51, 11], 4)" unless search(arr_2, 4) == false
arr_3 = []
raise "search broke - search([], 4)" unless search(arr_3, 4) == false
puts "passes all search tests"

# Palindrome Tests
raise "is_palindrome broke - is_palindrome('racecar')" unless is_palindrome('racecar') == true
raise "is_palindrome broke - is_palindrome('smile')" unless is_palindrome('smile') == false
puts "passes all palindrome tests"

# Digit Match Tests
raise "digit_match broke - digit_match(1072503891, 62530841)" unless digit_match(1072503891, 62530841) == 4
raise "digit_match broke - digit_match(1234, 4321)" unless digit_match(1234, 4321) == 0
raise "digit_match broke - digit_match(3862947593, 3862947593)" unless digit_match(3862947593, 3862947593) == 10
puts "passes all digit_match tests"
puts "All test passed"
