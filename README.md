# sendgrid_event_api

Installation:

gem 'sendgrid_event_api', git: "https://github.com/Mothirajha/sendgrid_event_api.git"

Bounce:

SendgridEventApi::Bounce.new(api_user, api_key).list(args)

Arguments(as hash format)

date        - Must be set to 1.	Retrieve the timestamp of the bounce records. It will return a date in a MySQL timestamp format - YYYY-MM-DD HH:MM:SS.

days	      - If specified, must be an integer greater than 0.	Number of days in the past for which to retrieve bounces (includes today).

start_date	- Date must be in YYYY-MM-DD format and be earlier than the end_date parameter.	The start of the date range for which to retrieve bounces.

end_date	  - Date must be in YYYY-MM-DD format and be later than the start_date parameter.	The end of the date range for which to retrieve bounces.

limit	    	- Some integer.	Optional field to limit the number of results returned.

offset	    - Some integer.	Optional beginning point in the list to retrieve from.

type	    	- Hard or soft.	Choose the type of bounce to search for.

email	      - Email address eg testing@example.com.	Optional email addresses to search for.

Example: 

SendgridEventApi::Bounce.new(api_user, api_key).list({date: 1, type: "hard"})

