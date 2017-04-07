class Calculation
	attr_reader :percent, :credit, :term, :payment, :payment_all, :credit_left, :money_for_a_month
	attr_reader :money_for_a_month_c, :payment_all_c
	def initialize
		@payment = {}
		@payment_all = {}
		@credit_left = {}
		@money_for_a_month = {}
	end
	 def calculate(persent, credit, term, payOFF)
		 if payOFF == "Usual"		 
		 @money_for_a_month_c = (credit/term)
		 i=1
	 		1.upto(term) do
	 			money_for_a_month[i] = @money_for_a_month_c 
	 			payment[i] = (credit * persent/ 100 / 12)
		 		payment_all[i] = (payment[i] + @money_for_a_month_c)
	 			credit = credit - @money_for_a_month_c
	 			credit_left[i] = credit
 	 			term-=1
		 		i+=1
		 	end
		 elsif payOFF == "Equal"		 		
		 		p = persent/12/100
	 	@payment_all_c = (credit * (p*(1+p)**term)/((1+p)**term-1))
		i=1
	 		1.upto(term) do
	 			payment[i] = (credit * persent / 100 / 12)
	 			payment_all[i] = @payment_all_c 
		 		money_for_a_month[i] = (@payment_all_c- payment[i])
	 			credit = credit - money_for_a_month[i]
	 			credit_left[i] = credit
 	 			term-=1
		 		i+=1
		 	end	
		 end
	end

end

