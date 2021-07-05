# Should format and identify different parts of todays date.
# 
# "The year is: 2020, the calendar day is: 1, and the month is: 7."

require "date"

Date.new(2020,7,1)

t = Date.today

p "The year is: " + t.year.to_s + ", the calendar day is: " + t.day.to_s + ", and the month is: " + t.month.to_s + "."