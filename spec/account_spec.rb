require_relative '../lib/account/'
describe Account do
  it 'returns my balance' do
  expect(subject.balance).to eq 1000
  end

  it 'reduces my balance' do
  	subject.withdraw(400, 34, 1234)
  	expect(subject.balance).to eq 600
  end
  it 'returns amount deposited' do
  	expect(subject.deposit(500)).to eq 500
  end
  it 'returns my new balance' do
  	subject.deposit(500)
  	expect(subject.balance).to eq 1500
  end
  it 'returns current balance' do
    subject.withdraw(2000, 381, 1234)
    expect(subject.balance).to eq 1000
  end
  it 'returns detailed transaction message' do
    new_balance = subject.balance - 200
    expected_output= { transactioncode: 'WRXP45P', balance: new_balance , amount: 200 , time: "Wed Jul  4 13:52:47 2018", status: true }
    expect(subject.withdraw(200, 7, 1234)).to eq expected_output
  end
  it 'returns failure message for excess amount' do
    new_balance = subject.balance
    expected_output= {balance: new_balance , time: '1538' , status: false}
  expect(subject.withdraw(3000,98, 1234)).to eq expected_output
  end
  it 'returns fail message for wrong agent number' do
  expect(subject.withdraw(200, 89, 1234)).to eq 'Failed, wrong agent number'
  end
  it 'returns fail message for wrong PIN' do
    expect(subject.withdraw(200, 98, 3241)).to eq 'Wrong PIN'
  end

  it'sends money from one account to another' do
    linda = Account.new
    akim = Account.new
    linda.send_money(akim, 400, 1234)
    expect(linda.balance).to eq 600
    expect(akim.balance).to eq 1400
  end
    
end
