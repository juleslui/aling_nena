class MoneyCalculator

  def initialize(ones, fives, tens, twenties, fifties, hundreds, five_hundreds, thousands)
    # each parameter represents the quantity per denomination of money
    # these parameters can be assigned to instance variables and used for computation
    @ones = ones.to_i*1
    @fives = fives.to_i*5
    @tens = tens.to_i*10
    @twenties = twenties.to_i*20
    @fifties = fifties.to_i*50
    @hundreds = hundreds.to_i*100
    @five_hundreds = five_hundreds.to_i*500
    @thousands = thousands.to_i*1000

    @total = @ones.to_i + @fives.to_i + @tens.to_i + @twenties.to_i + @fifties.to_i + @hundreds.to_i + @five_hundreds.to_i + @thousands.to_i

    @denom = Hash.new
    @denom["thou"] = 0  
    @denom["fivhun"] = 0
    @denom["hun"] = 0
    @denom["fif"] = 0
    @denom["twen"] = 0
    @denom["ten"] = 0
    @denom["fiv"] = 0
    @denom["on"] = 0

    # add a method called 'change' that takes in a parameter of how much an item costs
    # and returns a hash of how much change is to be given
    # the hash will use the denominations as keys and the amount per denomination as values
    # i.e. {:fives => 1, fifties => 1, :hundreds => 3}
  end

  def return_total
    return @total
  end

  def change(cost)

  		@change = @total - cost.to_i
      
      change = @change
      athousand = change/1000
      fivehundred = (change%1000)/500
      onehundred = ((change%1000)%500)/100
      fifty = (((change%1000)%500)%100)/50
      twenty = ((((change%1000)%500)%100)%50)/20
      onezero = (((((change%1000)%500)%100)%50)%20)/10
      five = ((((((change%1000)%500)%100)%50)%20)%10)/5
      one = ((((((change%1000)%500)%100)%50)%20)%10)%5
      return {:on => one, :fiv => five, :ten => onezero, :twen => twenty, :fif => fifty, :hun => onehundred, :fivhun => fivehundred, :thou => athousand}
  		#insert code that gets the length of @change to be able to get the individual divisions
  		#such as ex. 1672 = 1000 + 600 + 70 + 2
    end
end