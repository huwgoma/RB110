# Dubstep
# Assume that a song consists of some number of words (not containing WUB)
# - To convert a song to dubstep, any number of the word 'WUB' is inserted 
#   before the first word of the song (can be 0), after the last word (can be 0),
#   and between words (at least 1 between words)
# -> The words are all then glued together into one string (no spaces)

# Given a string representing a song in dubstep, return a new string representing
#   the original song.

# Input: A String
# - Dubstep: Contains WUBs
#   - 0+ WUBs before the first word; 0+ WUBs after the last word
#   - 1+ WUB between each word.
# Output: A new String
# - The un-dubstepped version of the song
# - Words should be space-separated (no spaces at the start or end)

# Examples:
# song_decoder("AWUBBWUBC") == "A B C"
# song_decoder("AWUBWUBWUBBWUBWUBWUBC") == "A B C"
# song_decoder("WUBAWUBBWUBCWUB") == "A B C"
# song_decoder("WUBWEWUBAREWUBWUBTHEWUBCHAMPIONSWUBMYWUBFRIENDWUB")  == 'WE ARE THE CHAMPIONS MY FRIEND'

# Data:
# The String given as input, dubstep_str
# - Split the dubstep string on WUB? -> An array of non-WUB words

# Algorithm:
# Given a string as input, dubstep_str:
# Split dubstep_str into an array of words, splitting on WUB
# Remove any empty substrings 
# Join words back together with a space

def song_decoder(dubstep)
  original = dubstep.split('WUB').delete_if(&:empty?)
  original.join(' ')
end

p song_decoder("AWUBBWUBC") == "A B C"
p song_decoder("AWUBWUBWUBBWUBWUBWUBC") == "A B C"
p song_decoder("WUBAWUBBWUBCWUB") == "A B C"
p song_decoder("WUBWEWUBAREWUBWUBTHEWUBCHAMPIONSWUBMYWUBFRIENDWUB")  == 'WE ARE THE CHAMPIONS MY FRIEND'
