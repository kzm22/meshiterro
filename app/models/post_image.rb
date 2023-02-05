class PostImage < ApplicationRecord
  
  has_one_attached :image
  belongs_to :user
  
  def get_image 
    if image.attached?
      image
    else
      'no_image.jpg'
    end
  end
  
  def get_image
    #画像が設定されていない場合は、app/~に格納されているno_image.jpgという画像をデフォルト画像としてActivestrageに格納し、格納した画像を表示する
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image  
  end
  
end
