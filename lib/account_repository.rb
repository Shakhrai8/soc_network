require_relative './account'

class AccountRepository

  def all
    accounts = []
    sql = 'SELECT id, email, username FROM accounts;'
    result_set = DatabaseConnection.exec_params(sql, [])

    result_set.each do |inst|
      account = Account.new

      account.id = inst['id']
      account.email = inst['email']
      account.username = inst['username']

      accounts << account
    end

    return accounts 
  end

  def find(id)
    accounts = []
    sql = 'SELECT email, username FROM accounts WHERE id = $1;'
    result_set = DatabaseConnection.exec_params(sql, [id])

    result_set.each do |inst|
      account = Account.new

      account.id = inst['id']
      account.email = inst['email']
      account.username = inst['username']

      accounts << account
    end

    return accounts 
  end

  def create(account)
    
    sql = 'INSERT INTO accounts (email, username) VALUES ($1, $2);'
    params = [account.email, account.username]

    DatabaseConnection.exec_params(sql, params)

    return nil

  end

  def delete(id)
    sql = 'DELETE FROM accounts WHERE id = $1;'

    DatabaseConnection.exec_params(sql, [id])

    return nil
  end

  def update(account)
    # Executes the SQL;
    sql = 'UPDATE accounts SET email = $1, username = $2 WHERE id = $3;'
    params = [account.email, account.username, account.id]

    DatabaseConnection.exec_params(sql, params)

    return nil
  end

end