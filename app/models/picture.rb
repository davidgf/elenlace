class Picture < ActiveRecord::Base
    include PublicActivity::Common
    belongs_to :attendee
    acts_as_votable
    acts_as_commentable
    has_attached_file :image, :styles => { :big => "1200x1200>", :medium => "300x300>", :thumb => "100x100>" }, :convert_options => { :all => '-auto-orient' }, :default_url => "/images/:style/missing.png"
    validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
    validates :attendee, :image, presence: true
    self.per_page = 15
    before_save :encode_emoji

private
    def encode_emoji
        self.name = Rumoji.encode(self.name)
    end
    
end
