require 'account_repository'

RSpec.describe AccountRepository do
  
  def reset_accounts_table
    seed_sql = File.read('spec/seeds_accounts.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'social_network_test' })
    connection.exec(seed_sql)
  end
    
    
  before(:each) do 
    reset_accounts_table
  end
    


  it "returns the list of accounts" do
     
    # 1
    # Get all accounts

    repo = AccountRepository.new

    acc = repo.all
    expect(acc.length).to eq 2 # => 2
    expect(acc.first.email).to eq 'email1@gmail.com' # => 'email1@gmail.com'
    expect(acc.first.username).to eq 'email1' # => 'email1'
  end

  it "returns the list of accounts" do
    # 2
    # find with id 2

    repo = AccountRepository.new

    acc = repo.find(2)
    acc.length # => 1
    acc.first.email # => 'email23@gmail.com'
    acc.first.username # => 'email23'
  end

  it "returns the list of accounts" do
    # 1
    # create new account

    repo = AccountRepository.new

    acc = Account.new
    acc.first.email # => 'email56@gmail.com'
    acc.first.username # => 'email56'

    repo.create(acc)

    accs = repo.all
    last_acc = accs.last
    last_acc.email # => 'email56@gmail.com'
    last_acc.username # => 'email56'

  end 

  it "returns the list of accounts" do

    # 2
    # delete

    repo = AccountRepository.new

    id_to_delete = 1

    repo.delete(id_to_delete)

    all_accs = repo.all
    all_accs.length # => 1
    all_accs.first.id # => '2'
  end 

  it "returns the list of accounts" do
    # update
    repo = AccountRepository.new

    acc = repo.find(1)

    acc.username = 'New_username'
    acc.email = 'new_email'


    repo.update(acc)

    updated_acc = repo.find(1)
    updated_acc.username = 'New_username'
    updated_acc.email = 'new_email'
  end

end