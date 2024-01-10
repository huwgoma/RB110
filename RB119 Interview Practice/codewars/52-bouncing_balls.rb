# Bouncing Balls
# A child is playing with a ball on the `n`th floor of a building. The height of 
#   this floor above ground level, `h`, is known.
# He drops a ball out of the window. The ball bounces to some percentage of its
#   initial height (eg. 2/3rds -> 0.66x)
# His mom looks out of a window, 1.5m above the ground.
# How many times will the mother see the ball pass the window? (both falling and
#   bouncing)

# 3 Conditions:
# - (h) The height of the boy's floor must be greater than 0
# - (bounce) The bounce factor must be between 0 and 1
# - (window) The height of the window must be less than (h)

# Input: 3 numbers
# - Integer (h), representing the height of the boy's floor
# - Float (bounce), representing the bounciness of the ball
# - Window (window), representing the height of the window
# Output: An integer
# - Represents the number of times the ball will pass the window height (in 
#   both directions)
#   - Return -1 if the parameters are invalid.

# Examples:
# h = 3, bounce = 0.66, window = 1.5
#   bouncing_ball(3, 0.66, 1.5)
# 1) Check that all parameters are valid:
#   - h must be positive -> true
#   - bounce must be between 0 and 1 -> true 
#   - window must be less than h -> true
# * Create a new variable to track the number of window passes = 0
# 2) Calculate the height of the next bounce
#   - h * bounce -> 3 * 0.66 -> 1.98
#   If the result is greater than `window`, increment window passes by 2

#   - 1.98 * 0.66 -> 1.3068
#   If the result is less than `window`, increment window passes by 1, then 
#   stop looping

# Data:
# A variable to track the number of window passes
# - If height * bounce is greater than window, that means the ball passes the window
#   twice (on the way down, and on the way up).
# - If height * bounce is less than window, that means the ball passes the window 
#   once (on the way down).

# Algorithm:
# Given 3 numbers as input: `height`, `bounce`, and `window`:
# Check if the provided inputs are all valid:
#   - `height` is positive, `bounce` is between 0 and 1, AND `window` is less
#      than `height`.
#   Return -1 if any check returns false, otherwise move on 
# Initialize a new counter variable, passes = 0
# Initialize a loop; for each iteration:
#   Increment passes by 1 (down)
#   Calculate the height of the ball after the bounce 
#   - height = height * bounce
#   Exit the loop if height is less than window
#   Increment passes by 1 (up)
# Return passes

def bouncing_ball(height, bounce, window)
  return -1 unless valid_experiment?(height, bounce, window)
  
  passes = 0
  loop do
    passes += 1
    height *= bounce
    return passes if height <= window
    passes += 1 
  end
end

def valid_experiment?(height, bounce, window)
  height.positive? &&
    bounce > 0 && bounce < 1 &&
    window < height
end


p bouncing_ball(2, 0.5, 1.0) #== 1

# p bouncing_ball(3, 0.66, 1.5) == 3
# p bouncing_ball(30, 0.66, 1.5) == 15
# p bouncing_ball(30, 0.75, 1.5) == 21
# p bouncing_ball(30, 0.4, 10) == 3
# p bouncing_ball(40, 1, 10) == -1
# p bouncing_ball(40, 0, 10) == -1
# p bouncing_ball(-5, 0.66, 1.5) == -1

