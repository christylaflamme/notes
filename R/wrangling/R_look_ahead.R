# Example of using a "look-ahead" to tidy up data if proper delimeter is not available
# 11/19/24

library(stringr)

# example string
str = "AARS1HGNC:20"
print(str) # [1] "AARS1HGNC:20"

# use a "look-ahead" to separate out, while keeping the delimiter
str_split <- str_split(str, "(?=HGNC:)")
print(str_split) # [1] "AARS1"   "HGNC:20"

