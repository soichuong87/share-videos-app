class Video < ApplicationRecord

  YOUTUBE_LINK_FORMAT = /\A.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*/i

  validates :link, presence: true, format: YOUTUBE_LINK_FORMAT
  
  before_create -> do

    uid = link.match(YOUTUBE_LINK_FORMAT)
    self.uid = uid[2] if uid && uid[2]

    if self.uid.to_s.length != 11
      self.errors.add(:link, 'is invalid.')
      false
    else
      get_video_info
    end
  end

  belongs_to :user

  delegate :email, to: :user

  private

  def get_video_info
    begin
      video = Yt::Video.new(id: self.uid)
      self.title = video.title
      self.description = video.description
    rescue
      self.title = 'N#A'
      self.description = 'N#A'
    end
  end
end