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
  end
end