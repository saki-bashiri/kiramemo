class Stamp < ActiveRecord::Base
  mount_uploader :image, StampImageUploader
  IMAGE_UPLOAD_KEYS = [:image, :url, :name, :description]

  validates :url, length: {maximum: 255}, format: {with: /(\A\Z|\.(jpg|png|gif)\Z)/, message: ".jpg, .png, .gif のいずれかでお願いします"}
  validate :check_attrs

  def upload_from_params!(params)
    assign_attributes(params.slice(*IMAGE_UPLOAD_KEYS))
    return unless valid?
    upload!
  end

  def upload!
    save!
  end

  def stamp_url
    url.presence || image_url
  end

  def check_attrs
    validates_image_exists
  end
  private :check_attrs

  def validates_image_exists
    errors[:base] << "画像の指定をしてください" if url.blank? && image.blank?
  end

  class << self
    def paginate(pg: 1, per_page: 20)
      page(pg).per(per_page).order(arel_table[:id].desc)
    end

    def search_with_pages(word, pg: 1, per_page: 20)
      if word.present?
        query_word = "%#{word.to_s.gsub(/[\\%_]/){|m| "\\#{m}"}}%"
        scope = where(arel_table[:name].matches(query_word).or(arel_table[:description].matches(query_word)))
      end
      (scope || self).paginate(pg: pg, per_page: per_page)
    end
  end
end
