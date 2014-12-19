class Event < ActiveRecord::Base
    validates :wedding, :name, :description, :location, :datetime, presence: true
	belongs_to :wedding
    has_one :location
	accepts_nested_attributes_for :location
    has_attached_file :image, :styles => { :big => "1200x1200>", :medium => "500x500>", :thumb => "100x100>" }, :convert_options => { :all => '-auto-orient' }, :default_url => "/images/:style/missing.png"
    validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
