# Extract Domain Name
# Write a method that, when given a URL as a string, extracts the Domain Name
#   and returns it as a string.

# Input: A String containing a URL (eg. http://google.com)
# Output: A new string containing just the domain name (eg. 'google')

# Examples:
# domain_name("http://google.com") ==  "google"
# domain_name("http://google.co.jp") ==  "google"
# domain_name("www.xakep.ru") ==  "xakep"
# domain_name("https://youtube.com") == "youtube"
# domain_name("http://github.com/carbonfive/raygun") == "github"
# domain_name("http://www.zombie-bites.com") == "zombie-bites"
# domain_name("https://www.cnet.com") == 'cnet'

# Data:
# The URL string given as input
# - Remove http prefix (://)
# - Remove www. prefix (www.)
# - Remove .com suffix (.)