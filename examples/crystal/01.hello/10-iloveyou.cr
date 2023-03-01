#!/usr/bin/env crystal

# Output "I love Ruby"
say = "I love you!"
puts say

# Output "I *LOVE* RUBY"
# say["love"] = "LOVE"
# puts say
#
# In 10-iloveyou.cr:8:4
#
# 8 | say["love"] = "LOVE"
#         ^
# Error: undefined method '[]=' for String

# Output "I LOVE RUBY"
puts "<#{say.upcase}> " * 3
