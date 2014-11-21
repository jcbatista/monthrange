require 'date'

# display sequential month ranges from an array of durations given a start date
#
# durations = [2,1,2,1,2,24,3]
# MonthRange.new("January 2000")
#          .process(durations)
#          .display()
#
# 1. January 2000 - February 2000 (2 months)
# 2. March 2000 (1 month)
# 3. April 2000 - May 2000 (2 months)
# 4. June 2000 (1 month)
# 5. July 2000 - August 2000 (2 months)
# 6. September 2000 - August 2002 (2 years)
# 7. September 2002 - November 2002 (3 months)


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

