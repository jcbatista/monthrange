require_relative "MonthRange.rb"

durations = [2,1,2,1,2,24,3]
MonthRange.new("January 2000")
          .process(durations)
          .display()