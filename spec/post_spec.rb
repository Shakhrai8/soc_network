require 'post_repository'


RSpec.describe PostRepository do
  def reset_posts_table
    seed_sql = File.read('spec/seeds_posts.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'social_network_test' })
    connection.exec(seed_sql)
  end


  before(:each) do 
    reset_posts_table
  end

  it "returns a list of the posts" do
    repo = PostRepository.new

    post = repo.all
    expect(post.length).to eq 2 # => 2
    expect(post.first.title).to eq('title_1') 
    expect(post.first.contents).to eq('con_1') 
    expect(post.first.views).to eq('123')
    expect(post.first.account_id).to eq('1')
  end

  it "returns an instance by searching id" do
    repo = PostRepository.new

    post = repo.find(2)
    expect(post.length).to eq 1 # => 2
    expect(post.first.title).to eq('title_2') 
    expect(post.first.contents).to eq('con_2') 
    expect(post.first.views).to eq('234')
    expect(post.first.account_id).to eq('2')
  end

  it "creates a new instance in the database and returns it" do
    repo = PostRepository.new

    post = Post.new
    post.title = 'super_new_title'
    post.contents = 'also_something_cool'
    post.views = '9999'
    post.account_id = '2'
    
    repo.create(post)
    
    post_new = repo.all
    expect(post_new.last.title).to eq('super_new_title') # => 'email56@gmail.com'
    expect(post_new.last.contents).to eq('also_something_cool')
    expect(post_new.last.views).to eq('9999')
    expect(post_new.last.account_id).to eq('2')

  end

  it "deletes an instance by its id" do
    repo = PostRepository.new

    id_to_delete = 1
    
    repo.delete(id_to_delete)
    
    all_posts = repo.all
    expect(all_posts.length).to eq 1 # => 1
    expect(all_posts.first.id).to eq('2') # => '2'
    expect(all_posts.first.title).to eq('title_2')
    expect(all_posts.first.contents).to eq('con_2') 
    expect(all_posts.first.views).to eq('234')
    expect(all_posts.first.account_id).to eq('2')
  end

  it "updates an instance by its id" do
    repo = PostRepository.new

    post = repo.find(1)

    post[0].title = 'not_title'
    post[0].contents = 'blabla'
    post[0].views = '88888'
    post[0].account_id = '1'
    post[0].id = 1


    repo.update(post[0])

    updated_post = repo.find(1)
    expect(updated_post[0].title).to eq 'not_title'
    expect(updated_post[0].contents).to eq 'blabla'
    expect(updated_post[0].views).to eq '88888'
    expect(updated_post[0].account_id).to eq '1'
  end
end