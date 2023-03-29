class PostsController < ApplicationController
    def index
        @posts = Post.all
    end
    def new
        @posts = Post.new
    end

    def create
        Post.create(title: params[:title])
        redirect_to "/tasks"
    end
    def create
        @post = Post.new(post_params)
        # 投稿データが作成された場合
        if @post.save
            flash[:success] = "投稿を作成しました"
            redirect_to posts_path
        else
            作成できなかった場合
            flash.now[:failure] = "投稿を作成できませんでした"
            render :new
        end
    end


    def destroy
        @task = Task.find(params[:id])
        @task.destroy
        redirect_to "/tasks"
    end
    def create
    end
  
    def show
    end
  
    def edit
    end
  
    def update
        @post = Post.find(params[:id])

        if @post = post.update()
            # 投稿データが更新された場合
        else
        end
    

    end

    def post_params
        params.require(:post).permit(
            :title,
            :start_at,
            :end_at,
            :allday
        )
    end
  
    
end
