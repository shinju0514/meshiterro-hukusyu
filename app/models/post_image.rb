class PostImage < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def get_image
    # unless（そうでなければ）image.attached?(この記述はimageファイルが存在するか？というメソッド）
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path),filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
      image
  end

  # 引数で渡された(user)ユーザーがfavoritesテーブルに存在するかどうか調べるメソッドです。
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end
