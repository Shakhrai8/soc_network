class PostRepository

  def all
    posts = []
    sql = 'SELECT id, title, contents, views, accout_id FROM posts;'
    result_set = DatabaseConnection.exec_params(sql, [])
  
    result_set.each do |inst|
      post = Post.new
  
      account.id = inst['id']
      account.title = inst['title']
      account.contents = inst['contents']
  
      accounts << account
    end
  
    return accounts 
  end


  def find(id)
    # id is an integer representing the number of id to search for
    # SELECT title, contents, views, accout_id FROM posts WHERE id = $1;'
    # returns an instance of Post object
  end

  def create(post)
    # Executes the SQL query;
    # INSERT INTO posts (title, contents, views, accout_id) VALUES ($1, $2, $3, $4);

    # Doesn't nned to return anything 
  end

  def delete(id)
    # Executes the SQl;
    # DELETE FROM posts WHERE id = $1;

    # Returns nothing (only deletes the record)
  end

  def update(post)
    # Executes the SQL;
    # UPDATE posts SET title = $1, contents= $2, views = $3, account_id =$4 WHERE id = $5;

    # Returns nothing(only updates)
  end


end
