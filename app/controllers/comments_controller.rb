class CommentsController < ApplicationController
    def create
        @post = Post.find(params[:comment][:post_id])
        @comment = Comment.new(comment_params)
        @comment.user = current_user
        respond_to do |format|
        if @comment.save
            format.html { redirect_to post_path(@post.id), notice:'Comment was successfully created.' }
        else
            format.html { redirect_to post_path(@post.id), notice:'Comment was not created.' }
        end
    end
        

    private
        def comment_params
            params.require(:comment).permit(:content, :post_id)
        end
    end
end