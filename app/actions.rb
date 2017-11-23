
def humanized_time_ago(minute_num)
    if minute_num > 60
        "#{minute_num/60} hours ago"
    elsif minute_num == 60
        "1 hour ago"
    elsif minute_num < 60
        "#{minute_num} minutes ago"
    end 
end


get "/" do
    
    @post_shark = {
        user_name: "sharky_j",
        avatar_url: "http://naserca.com/images/sharky_j.jpg",
        photo_url: "http://naserca.com/images/shark.jpg",
        humanized_time_ago: humanized_time_ago(15),
        like_count: 1,
        #comment_count: 1,
        comments: [{
            user_name: "sharky_j", 
            text: "Out for the weekend, and bla bla bla bla"
        }]
    }
    

    @post_whale = {
        user_name: "kirk_whalum",
        avatar_url: "http://naserca.com/images/kirk_whalum.jpg",
        photo_url: "http://naserca.com/images/whale.jpg",
        humanized_time_ago: humanized_time_ago(70),
        like_count: 1,
        #comment_count: 1,
        comments: [{
            user_name: "kirk_whalum", 
            text: "Nice Swim",
            comment_time: humanized_time_ago(80)
            },
            {
            user_name: "Luisa", 
            text: "What a great shot!",
            comment_time: humanized_time_ago(30)
            }
        ]
    }
    
    @post_marlin = {
        user_name: "marlin_peppa",
        avatar_url: "http://naserca.com/images/marlin_peppa.jpg",
        photo_url: "http://naserca.com/images/marlin.jpg",
        humanized_time_ago: humanized_time_ago(195),
        like_count: 1,
        #comment_count: 1,
        comments: [{
            user_name: "marlin_peppa",
            text: "You are looking blue",
            comment_time: humanized_time_ago(180)
            },
            {
            user_name: "Sara",
            text: "Will love to be swimming there too",
            comment_time: humanized_time_ago(145)
            }
        ]
    }
    
    #:pacific => [
    #   [0] "sharks",
    #   [1] "oilers"
    #  ],
    #  :central => [
    #    [0] "blues",
    #    [1] "stars"
    #  ]
    #},
    
 
   @post = [@post_shark, @post_whale, @post_marlin]
      

    erb :index
end