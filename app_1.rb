require 'sinatra'
require './calcul.rb'
 get '/' do
 erb :first
 end 

 post '/result/' do 
 	@persent = params[:percent]
 	@credit = params[:credit]
 	@term = params[:term]
 	payOFF = params[:payOff]
 	
 	@my_calcu=Calculation.new
 	@my_calcu.calculate(@persent.to_f, @credit.to_f, @term.to_i, payOFF)

 		@sum1 = @my_calcu.money_for_a_month.each_value.reduce(:+) 
 		@sum2 = @my_calcu.payment.each_value.reduce(:+)
 		@sum3 = @my_calcu.payment_all.each_value.reduce(:+)

 	 	erb :second 	
 end