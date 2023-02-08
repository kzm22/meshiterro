class PostImagesController < ApplicationController
  def new
    @post_image = PostImage.new
  end
  
  def create
    #投稿フォームで入力されたデータ（shop_name,image,caption)が@post_imageに格納される
    @post_image = PostImage.new(post_image_params)
    #投稿データのuser_idを今ログインしているユーザーIDにすることで投稿データに持たせることができる。
    @post_image.user_id = current_user.id
    #格納されたデータを保存する
    if @post_image.save
    #post_images画面に戻る
      redirect_to post_images_path
    else
      render :new
    end
  end

  def index
    @post_images = PostImage.page(params[:page])
  end

  def show
    @post_image = PostImage.find(params[:id])
    @post_comment = PostComment.new
  end
  
  def destroy
    post_image = PostImage.find(params[:id])
    post_image.destroy
    redirect_to "/post_images"
  end
  
  private
  
  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end
  
end
