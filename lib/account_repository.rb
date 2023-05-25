class AccountRepository

  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT id, email, username FROM accounts;

    # Returns an array of Account objects.
  end

  def find(id)
    # id is an integer representing the number of id to search for
    # SELECT email, username FROM accounts WHERE id = $1;'
    # returns an instance of Account object
  end

  def create(account)
    # Executes the SQL query;
    # INSERT INTO accounts (email, username) VALUES ($1, $2);

    # Doesn't nned to return anything 
  end

  def delete(id)
    # Executes the SQl;
    # DELETE FROM accounts WHERE id = $1;

    # Returns nothing (only deletes the record)
  end

  def update(account)
    # Executes the SQL;
    # UPDATE accounts SET email = $1, username = $2 WHERE id = $3;

    # Returns nothing(only updates)
  end


end