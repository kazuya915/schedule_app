class PostsController < ApplicationController
    def index
        @posts = Post.all
    end
    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        # 投稿データが作成された場合
        if @post.save
            flash[:success] = "投稿を作成しました"
            redirect_to posts_path
        else
            flash.now[:failure] = "投稿を作成できませんでした"
            render :new,status: :unprocessable_entity
            
        end
    end


    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        flash[:notice] = "予定を削除しました"
        redirect_to :posts
    end
   
  
    def show
        @post = Post.find(params[:id])
    end
  
    def edit
        @post = Post.find(params[:id])
    end
  
    def update
        @post = Post.find(params[:id])
     if @post.update(post_params)
       flash[:notice] = "スケジュールを更新しました"
       redirect_to :posts
     else
        flash.now[:failure] = "スケジュールの更新に失敗しました"
        render "edit",status: :unprocessable_entity
     end
    end

    def post_params
        params.require(:post).permit(
            :title,
            :start_at,
            :end_at,
            :allday,
            :memo
        )
    end
  
    
end
