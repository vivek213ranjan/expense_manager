class Expense < ApplicationRecord

	def self.get_aggregated_summary
    query = 'select category, week_start, week_end , sum(amount) 
        from 
          (
            select category,  
            DATE_FORMAT(date_sub(date, interval (datediff(date, t2.min_date) % 7) day), "%d-%m-%Y") as week_start, 
            DATE_FORMAT(date_sub(date, interval (datediff(date, t2.min_date) % 7) - 6 day), "%d-%m-%Y") as week_end, 
            amount 
            from expenses as t 
            cross join (     
              select min(date) as min_date from expenses 
            ) as t2 
          ) as t3 group by 1,2, 3;'
    ActiveRecord::Base.connection.execute(query).as_json
	end
end
