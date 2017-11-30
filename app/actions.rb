
get "/" do
    @posts = Post.order(created_at: :desc)
    erb(:index)
end

get "/signup" do       # if a user navigates to the path "/signup"
    @user = User.new    # setup and empty @user object
    erb(:signup)        # render "app/view/signup.erb"
end 

post "/signup" do

    # Grab user input values
    email       = params[:email]
    avatar_url  = params[:avatar_url]
    username    = params[:username]
    password    = params[:password]
    
    @user = User.new({email: email, avatar_url: avatar_url, username: username, password: password})
    
    if @user.save
        "User #{username} saved"
    else
        erb(:signup)
    end
end

   