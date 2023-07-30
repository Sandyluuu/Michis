class Reaction < ApplicationRecord
  belongs_to :post, optional: true
  belongs_to :user
  # belongs_to :comment, optional: true

  def new_user_reaction
    @user = current_user
    @type = params[:reaction_type]
    @post = Post.find(params[:post_id]) if params[:post_id]
    # @comment = Comment.find(params[:comment_id]) if params[:comment_id]
    @kind = params[:kind]
    respond_to do |format|
      # (@type == "comment") ? reaction_comment = Reaction.find_by(user_id: @user,
# comment_id: @comment.id) :
 reaction_post = Reaction.find_by(user_id: @user.id,
post_id: @post.id)
    if reaction_post #|| reaction_comment
      format.html { redirect_to post_path(@post), notice: 'You already reacted to this post' }
    else
# (@type == "post") ? 
@reaction = Reaction.new(user_id: @user.id, post_id:
@post.id, reaction_type: @type, kind: @kind) 
# : @reaction = Reaction.new(user_id:
# @user.id, comment_id: @comment.id, reaction_type: @type, kind: @kind)
    if @reaction.save!
format.html { redirect_to post_path(@post), notice: 'Reaction was successfully created.' }
    else
format.html { redirect_to post_path(@post), notice: 'Something went wrong' }
      end
    end
  end
end
end

