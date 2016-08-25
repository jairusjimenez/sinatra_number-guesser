require "sinatra"
require "sinatra/reloader"

num = rand(100)
msg = ""
color = "red"

def check_guess(guess, num)
	if guess > num
		if (guess - num) <= 5
			msg = "Way too high!"
		else
			msg = "Too high!"
		end
		color = "red"
	elsif guess < num
		if (num - guess) <= 5
			msg = "Way too low!"
		else
			msg = "Too low!"
		end
		color = "red"
	else
		msg = "You got it right!"
		color = "green"
	end
	return msg, color
end

get '/' do
	msg, color = check_guess(params["guess"].to_i, num)
	erb:index, :locals => {:number => num, :msg => msg, :color => color}
end