class PostsController < ApplicationController
  def index #一覧画面
    @posts = Post.all #allメソッドはpostsテーブルのレコードを全て取得できるメソッド
    render :layout => 'task_layout'
  end
  
  def new #新規登録
    @post = Post.new
  end
 
  def create #dbに登録する
    @post = Post.new(params.require(:post).permit(:title, :start_date, :end_date, :all_day, :note))
      if @post.save
        flash[:notice] = "スケジュールを登録しました" #flash[:キー名] = フラッシュメッセージとして格納するオブジェクト
        redirect_to :posts
      else
        render "new"
      end
  end
 
  def show#確認する
    @post = Post.find(params[:id])
  end
 
  def edit #編集する
    @post = Post.find(params[:id])
  end
 
  def update
    @post = Post.find(params[:id])
    if @post.update(params.require(:post).permit(:title, :start_date, :end_date, :all_day, :note))
      flash[:notice] = "スケジュールを更新しました"
      redirect_to :posts
    else
      render "edit"
    end
  end
 
  def destroy #削除
    @post = Post.find(params[:id])
    @post.destroy #destroyメソッドで@postに格納されているデータが削除されます。
    flash[:notice] = "ユーザーを削除しました"
    redirect_to :posts
  end
end


#create！！！！！！！！！！
#フォームに入力した値をnewメソッドで作成したPostモデルのインスタンスに渡しています。
#paramsメソッドにはrequireメソッドとpermitメソッドを指定することができます。
#requireメソッドではデータのオブジェクト名を指定します。この時に指定したオブジェクト以外であれば例外が発生します
#permitメソッドは指定した「キー」を変更可能と許可することができます
#@postsにはフォームで入力した値が設定されているPostモデルのインスタンスが格納されており、それに対してsaveメソッドを実行することでPostrモデルのその値をDBに新しいレコードとして保存することができます。
#redirect_toメソッドが実行されると「リダイレクト先のURL」に再度アクセスさせることができます。


#show!!!!!!!!!!!!!!!!!!!!!!!!!
#findメソッドはDBやモデルに指定することで、DB内の値を読み込むことができるメソッドとなりCRUD処理のshowの実装にかかせないメソッドです。
#paramsメソッドは送られてきたパラメータを受けとることができるメソッドです。paramsメソッドはparams[:キー]として指定することでそのパラメータを取得することができます。