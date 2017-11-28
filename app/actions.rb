
get "/" do
    
    @posts = Post.order(created_at: :desc)
    erb (:index)
    
end