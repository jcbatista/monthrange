require 'date'

# display sequential month ranges from an array of durations given a start data
#
# durations = [1,2,1,2,12]
# MonthRange.new("January 2000")
#          .process(durations)
#          .display()
#
# 1. February 2001 (1 month)
# 2. March 2001 - April 2001 (2 months)
# 3. March 2001 (1 month)
# 4. March 2001 - April 2001 (2 months)
# 5. March 2001 - February 2002 (12 months)

class MonthRange

public
   attr_reader :ranges 

   def initialize(month_year)
      @current = month_year   
   end

   def process(durations)
      @ranges = [];
      first = true
      durations.each do |duration|
         get_next(duration, !first)
         first = false;
      end
      return self
   end

   def display()
      return if !@ranges

      count = 1
      @ranges.each do |range|
         time_frame = "months";
         duration = range[:duration]
         if duration%12 == 0
            duration = duration / 12
            time_frame = duration == 1 ? "year": "years";
         end         
         if(range[:duration] > 1)
            puts "#{count}. #{range[:start]} - #{range[:end]} (#{duration} #{time_frame})"
         else
            puts "#{count}. #{range[:start]} (#{duration} month)"
         end
         count = count + 1
      end
   end

private

   def get_next(duration, next_month_increment)
      month, year = @current.split
      date = Date.parse("#{year}-#{month}-1")
       
      if next_month_increment
        date = date >> 1
      end 

      period = duration - 1
      target_date  = date >> period
      @current = target_date.strftime("%B %Y")      
      @ranges.push({
                      :duration => duration, 
                      :start => date.strftime("%B %Y"),
                      :end => target_date.strftime("%B %Y") 
                   })      
   end
end

