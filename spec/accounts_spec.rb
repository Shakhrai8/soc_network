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

  it "returns a list of the accounts" do
    repo = AccountRepository.new

    acc = repo.all
    expect(acc.length).to eq 2 # => 2
    expect(acc.first.email).to eq('email1@gmail.com') # => 'email1@gmail.com'
    expect(acc.first.username).to eq('user_name_1') # => 'user_name_1'
  end

  it "returns an instance by searching id" do
    repo = AccountRepository.new

    acc = repo.find(2)
    expect(acc.length).to eq 1 # => 2
    expect(acc.first.email).to eq('email23@gmail.com') # => 'email1@gmail.com'
    expect(acc.first.username).to eq('user_name_23') # => 'user_name_1'
  end

  it "creates a new instance in the database and returns it" do
    repo = AccountRepository.new

    acc = Account.new
    acc.email = 'email56@gmail.com'
    acc.username = 'user_name_56'
    
    repo.create(acc)
    
    accs = repo.all
    expect(accs.last.email).to eq('email56@gmail.com') # => 'email56@gmail.com'
    expect(accs.last.username).to eq('user_name_56')
  end

  it "deletes an instance by its id" do
    repo = AccountRepository.new

    id_to_delete = 1
    
    repo.delete(id_to_delete)
    
    all_accs = repo.all
    expect(all_accs.length).to eq 1 # => 1
    expect(all_accs.first.id).to eq '2' # => '2'
    expect(all_accs.first.username).to eq 'user_name_23'
  end

  it "updates an instance by its id" do
    repo = AccountRepository.new

    acc = repo.find(1)

    acc[0].username = 'New_username'
    acc[0].email = 'new_email'
    acc[0].id = 1


    repo.update(acc[0])

    updated_acc = repo.find(1)
    expect(updated_acc[0].username).to eq 'New_username'
    expect(updated_acc[0].email).to eq 'new_email'
  end
end