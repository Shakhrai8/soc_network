require_relative './post'

class PostRepository

  def all
    posts = []
    sql = 'SELECT id, title, contents, views, account_id FROM posts;'
    result_set = DatabaseConnection.exec_params(sql, [])
  
    result_set.each do |inst|
      post = Post.new
  
      post.id = inst['id']
      post.title = inst['title']
      post.contents = inst['contents']
      post.views = inst['views']
      post.account_id = inst['account_id']
  
      posts << post
    end
  
    return posts 
  end

  def find(id)
    posts = []
    sql = 'SELECT title, contents, views, account_id FROM posts WHERE id = $1;'
    result_set = DatabaseConnection.exec_params(sql, [id])

    result_set.each do |inst|
      post = Post.new

      post.title = inst['title']
      post.contents = inst['contents']
      post.views = inst['views']
      post.account_id = inst['account_id']

      posts << post
    end

    return posts 
  end

  def create(post)
    
    sql = 'INSERT INTO posts (title, contents, views, account_id) VALUES ($1, $2, $3, $4);'
    params = [post.title, post.contents, post.views, post.account_id]

    DatabaseConnection.exec_params(sql, params)

    return nil

  end

  def delete(id)
    sql = 'DELETE FROM posts WHERE id = $1;'

    DatabaseConnection.exec_params(sql, [id])

    return nil
  end
# UPDATE posts SET title = $1, contents= $2, views = $3, account_id =$4 WHERE id = $5;
  def update(post)
    sql = 'UPDATE posts SET title = $1, contents= $2, views = $3, account_id =$4 WHERE id = $5;'
    params = [post.title, post.contents, post.views, post.account_id, post.id]
  
    DatabaseConnection.exec_params(sql, params)
  
    return nil
  end
end
