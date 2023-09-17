mailing_campaign_leads = [
  {name: 'Emma Lopez', email: 'emma.lopez@some_mail.com', days_since_login: 423, mailing_list: true},
  {name: 'mike richards', email: 'michael.richards@some_mail.com', days_since_login: 23, mailing_list: false},
  {name: 'JANE WILLIAMS', email: 'jane_w95@my_mail.com', days_since_login: 16, mailing_list: true},
  {name: 'Ash Patel', email: 'ash_patel@my_mail.com', days_since_login: 22, mailing_list: true}
]

counter = 0
# Initialize a loop (Iterate through mailing_campaign_leads)
loop do
  break if counter == mailing_campaign_leads.size
  # Retrieve the current full name
  full_name = mailing_campaign_leads[counter][:name]
  # Split the name into words (ie. first and last name)
  names = full_name.split

  names_counter = 0
  # Iterate through names array
  loop do
    break if names_counter == names.size
    # Retrieve the current name (first/last)
    name = names[names_counter]
    # Reassign the current Array element to a new String (current name caps'd)
    names[names_counter] = name.capitalize
    names_counter += 1
  end
  # Join the names array back together into a string (first/last name caps'd)
  capitalized_full_name = names.join(' ')
  # Reassign the `name` key for the current person to the new caps'd name String.
  mailing_campaign_leads[counter][:name] = capitalized_full_name

  counter += 1
end
# Basically this loop performs transformation - it loops through the leads array
# (containing hashes of potential leads) and corrects the capitalization of each
# person's name (mutating; alters mailing_campaign_leads directly).

usable_leads = []
counter = 0
loop do
  break if counter == mailing_campaign_leads.size
  last_login = mailing_campaign_leads[counter][:days_since_login]
  subscribed_to_list = mailing_campaign_leads[counter][:mailing_list]

  # If current lead's last login was less than 60 days ago, AND 
  # current lead's subscription status is TRUE, add them to the 
  # usable_leads array.
  if last_login < 60 && subscribed_to_list
    usable_leads << mailing_campaign_leads[counter]
  end

  counter += 1
end
# Basically this loop performs selection - it loops through the leads array
# and populates a NEW array with all leads who have logged in recently (less than
# 60 days ago) AND are subscribed.



# Which one of these solutions correctly implements all functionality of the 
# legacy code? For each solution: Why or why not?

# 1)
# mailing_campaign_leads.map do |lead|
#   lead[:name].capitalize!
# end

# This code (transformation) only capitalizes the first name of each person.
# #capitalize! only capitalizes the first character of the calling String.
# eg. 'mike richards' will be converted to 'Mike richards'
# Also this is not a good use of the #map method. If you want to mutate the 
# calling collection, use #map! instead. 

# mailing_campaign_leads.select! do |lead|
#   lead[:days_since_login] < 60 && lead[:mailing_list]
# end

# This code (selection) does correctly select for last login < 60 days AND
# subscription status == true. However, it does not return a new array of those
# usable leads, and it deletes the other entries from the mailing_campaign_leads
# hash.

# 2)
# mailing_campaign_leads.each do |lead|
#   names = lead[:name].split
#   names.map! { |name| name.capitalize }
#   lead[:name] = names.join(' ')
# end

# This code (transformation) correctly implements the caps transformation. 
# No complaints here.

# usable_leads = mailing_campaign_leads.keep_if do |lead|
#   lead[:days_since_login] <= 60 && lead[:mailing_list]
# end

# This code (selection) does not correctly select for last login being LESS THAN
# 60 days ago. ie. If someone's last login was exactly 60 days ago, they will be 
# selected when they should not be.
# Also, the Array#keep_if method performs selection on the calling Array destructively
# - the mailing_campaign_leads Array will be mutated (all currently non-usable
# leads will be deleted).


# # 3*)
# mailing_campaign_leads.each do |lead|
#   names = lead[:name].split
#   lead[:name] = names.map { |name| name.capitalize }.join(' ')
# end
# This code (transformation) correctly implements the caps transformation. 
# No complaints.

# usable_leads = mailing_campaign_leads.reject do |lead|
#   last_login = lead[:days_since_login]
#   subscribed_to_list = lead[:mailing_list]
#   last_login > 59 && !subscribed_to_list
# end
# This code (selection) does not correctly select the usable leads.
# A usable lead is one whose last_login was less than 60 days ago, 
# AND they are subscribed to the mailing list.
# In other words - Reject a lead (not usable) if their last login was 
# more than 59 days ago, OR if they are not subscribed to the mailing list.
# This code will not reject Emma or Mike (even though they should be rejected) 
#   #reject keeps all elements for which the block returns truthy.
# Emma's last login was over 60 days ago, but she is subscribed
#   => Should be rejected, but she is not ( true && false => false => kept)
# Mike's last login was under 60 days ago, but he is unsubscribed.
#   => Should be rejected, but (false && ____ => false => kept)

# # 4) 
mailing_campaign_leads.each do |lead|
  names = lead[:name].split
  names.map! { |name| name.capitalize }
  lead[:name] = names.join(' ')
end
# Correctly implements caps transformation.

usable_leads = mailing_campaign_leads.select do |lead|
  lead[:days_since_login] < 60 && lead[:mailing_list]
end
# Correctly implements usable leads transformation, does not mutate the 
# leads array, and populates a new array.