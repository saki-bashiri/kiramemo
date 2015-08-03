class Stamp < ActiveRecord::Base
  mount_uploader :image, StampImageUploader

  def upload_from_params!(params)
    assign_attributes(params)
    upload!
  end

  def upload!
    save!
  end
end
