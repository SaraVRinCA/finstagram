helpers do
    def current_user
        User.find_by(id: session[:user_id])
    end
end


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

get "/login" do
    erb(:login)
end

post "/login" do  # when a GET resquest comes into /login
    username = params[:username]
    password = params[:password]
    
    # 1.find user by username
    user =  User.find_by(username: username)

    # 2. if user exist
    
    if user && user.password ==  password
        session[:user_id] = user.id
        # "Success! User with id #{session[:user_id]} is logged in!"
        redirect to ("/")
    else
        @error_message = "Login failed"
        erb(:login)
    end
end

get "/logout" do
    session[:user_id] = nil
    # "Logout successful!"
    redirect to ("/")
end

get "/" do
    @posts = Post.order(created_at: :desc)
    @current_user = User.find_by(id: session[:user_id])
    erb(:index)
end

get "/posts/new" do
    @post = Post.new
    erb(:"posts/new")
end

post "/posts" do
    photo_url = params[:photo_url]
    
    # instantiate new post
    @post = Post.new({photo_url: photo_url, user_id: current_user.id})
    
    #if post is valid
    if @post.save
        redirect(to("/"))
    else
        #if it doesn´t validate
       erb(:"posts/new")
    end
end

get "/posts/:id" do
    @post = Post.find(params[:id]) #fint the post with the id in URL
    erb(:"posts/show") # render app/view/posts/show.erb
end