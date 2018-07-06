require 'sinatra'
 require_relative 'account.rb'

get '/alice' do
 'Hello World!'
end

get '/name' do
 'matched name'
end

get '/deposit/:amount' do
	"you have deposited #{params[:amount]}"
end

get '/withdraw' do
	@name="Akim"
   erb :withdraw
end

post '/withdraw' do
	acc = Account.new
	amount= params[:amount].to_i
	agent_number = params[:agent_number].to_i
	pin = params[:pin].to_i
	acc.withdraw(amount, agent_number, pin).to_s
	#{}"you have withdrawn #{amount} balance is #{acc.balance}"
end

get '/balance' do
	acc= Account.new
	@name="Alice"
	@balance=acc.balance
	erb :balance
end

get '/deposit' do
	@name="Akim"
   erb :deposit
end



post '/deposit' do
 	acc = Account.new
 	amount = params[:amount].to_i
 	acc.deposit(amount)
 	@balance="your balance is #{acc.balance}"
 	#erb :balance
 end


get '/' do
	@name="Akim"
	erb :home
end

 
