class CommentsController < ApplicationController
  def create
    @prototype = Prototype.find(params[:prototype_id])
    @comment = @prototype.comments.build(comment_params)

    if @comment.save
      redirect_to prototype_path # 今回の実装には関係ありませんが、このようにPrefixでパスを指定することが望ましいです。
    else
      @comments = @prototype.comments.includes(:user)
      render "prototypes/show", status: :unprocessable_entity
    end
      # views/tweets/show.html.erbのファイルを参照しています。      
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
end
