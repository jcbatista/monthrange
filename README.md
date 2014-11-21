Simple script to display sequential month ranges from an array of durations given a start date

Usage:

```
  durations = [2,1,2,1,2,24,3]
  MonthRange.new("January 2000")
            .process(durations)
            .display()
```

Output

```
1. January 2000 - February 2000 (2 months)
2. March 2000 (1 month)
3. April 2000 - May 2000 (2 months)
4. June 2000 (1 month)
5. July 2000 - August 2000 (2 months)
6. September 2000 - August 2002 (2 years)
7. September 2002 - November 2002 (3 months)
```