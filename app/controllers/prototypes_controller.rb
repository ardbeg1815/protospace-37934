class PrototypesController < ApplicationController
  before_action :prototype_find, except: [:index, :new, :create]
  before_action :authenticate_user!, except:[:index, :show]
  before_action :redirect_root, only: [:edit, :update, :destroy]

  def index #indexアクションを設定
    @prototypes = Prototype.all
    #PrototypeクラスにPrototypeモデル全ての情報を@prototypesに代入
  end

  def new #newアクションを設定
    @prototype = Prototype.new
    #Prototypeクラスの空のインスタンスを作成し,@prototypesへ代入
  end

  def create #createアクションを設定
    @prototype = Prototype.new(prototype_params)
    #prototypep_paramsで取得したデータを,@prototypesへ代入
    if @prototype.save
    #保存ができた場合以下の処理を実行
      redirect_to root_path
      #index.html.erbへ遷移
   else#保存ができなかった場合以下の処理を実行
      render :new
      #new.html.erbへ遷移
    end
  end

  def show #showアクションを設定
    @comment = Comment.new
    #Commentクラスの空のインスタンスを作成し,@commentへ代入
    @comments = @prototype.comments
    #@protptypeと関係を持つcommentsを取得し@commentsへ代入
  end

  def edit #editアクションを設定
    @prototype = Prototype.find(params[:id])
  end

  def update #updateアクションを設定
    if @prototype.update(prototype_params)
      #prototype_paramsで取得したデータで更新できた場合以下の処理を実行
      redirect_to prototype_path(@prototype)
      #show.html.erbへ遷移
    else
      render :edit
      #edit.html.erbへ遷移
    end
  end

  def destroy #destroyアクションを設定
    if @prototype.destroy
      #@prototypeのデータを削除できた場合以下の処理を実行
      redirect_to root_path
      #index.html.erbに遷移
    else
      redirect_to root_path
      #index.html.erbに遷移
    end
  end

  private
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
    #prototypeモデルの[title,catch_copy,concept,image]とuser_idのログイン中のユーザーidを取得する
  end

  def redirect_root
    redirect_to root_path unless current_user == @prototype.user
  end

  def prototype_find
    @prototype = Prototype.find(params[:id])
    #取得したidをもつprototypeのレコードを取得し@prototypeに代入
  end

end