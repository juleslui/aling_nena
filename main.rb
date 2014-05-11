require 'sinatra'
require './boot.rb'
require './money_calculator.rb'

# ROUTES FOR ADMIN SECTION

get '/' do
  random = Item.all
  @products = random.sample(10)
  erb :home
end

get '/SueUs' do
  erb :SueUs
end

get '/products' do
  @products = Item.all
  erb :products
end

get '/payment/:id' do
  @product = Item.find(params[:id])
  erb :payment
end

post '/bought/:id' do
  @product = Item.find(params[:id])
  @quantitytobuy = params[:quantity]
  @mc = MoneyCalculator.new(params[:ones], params[:fives], params[:tens], params[:twenties], params[:fifties], params[:hundreds], params[:five_hundreds], params[:thousands])
  @money = @mc.return_total
  @sold = @quantitytobuy.to_i + @product.sold
  @total = params[:quantity].to_i * @product.price.to_i
  if @quantitytobuy.to_i > @product.quantity.to_i
    @errormess = "Insufficient inventory."

  else
    
    if @total.to_i > @money.to_i
      @errormess = "Your money is insufficient!"

    else
      @change = @mc.change(@total.to_i)
      @newquant = @product.quantity.to_i - @quantitytobuy.to_i
      @product.update_attributes!(
      quantity: @newquant,
      sold: @sold
      )
      erb :bought
    end
  end
end

get '/AboutUs' do
  erb :AboutUs
end

get '/admin' do
  @products = Item.all
  erb :admin_index
end

get '/new_product' do
  @product = Item.new
  erb :product_form
end

post '/create_product' do
	@item = Item.new
	@item.name = params[:name]
	@item.price = params[:price]
	@item.quantity = params[:quantity]
	@item.sold = 0
	@item.save
 	redirect to '/admin'
end

get '/edit_product/:id' do
  @product = Item.find(params[:id])
  erb :product_form
end

post '/update_product/:id' do
  @product = Item.find(params[:id])
  @product.update_attributes!(
    name: params[:name],
    price: params[:price],
    quantity: params[:quantity],
  )
  redirect to '/admin'
end

get '/delete_product/:id' do
  @product = Item.find(params[:id])
  @product.destroy!
  redirect to '/admin'
end
# ROUTES FOR ADMIN SECTION
