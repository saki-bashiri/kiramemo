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
