class Song < ActiveRecord::Base
    validates :title, :artist, :wedding, :attendee, presence: true
    validate :video_is_youtube_url
    belongs_to :wedding
    belongs_to :attendee
    auto_html_for :video_url do
        youtube(:width => "100%", :height => "100%", :autoplay => false)
    end
    acts_as_votable

private
    YOUTUBE_REGEX = /^(?:http(s)?:\/\/)?(?:www\.)?youtube\.com\/watch\?v=([a-zA-Z0-9_-]*)/

    def video_is_youtube_url
        if video_url
            errors.add(:video_url, "no es un link de Youtube") unless YOUTUBE_REGEX.match(video_url)
        end
    end
end
