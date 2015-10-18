class Stamp < ActiveRecord::Base
  mount_uploader :image, StampImageUploader

  def upload_from_params!(params)
    assign_attributes(params)
    upload!
  end

  def upload!
    save!
  end

  class << self
    def paginate(pg: 1, per_page: 20)
      page(pg).per(per_page)
    end
  end
end
