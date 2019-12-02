class Video < ApplicationRecord
  YOUTUBE_LINK_FORMAT =  /(?:youtube.com|youtu.be).*(?:\/|v=)([a-zA-Z0-9_-]+)/

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

  private

  def get_video_info
    begin
      client = YouTubeIt::Client.new(dev_key: 'AIzaSyB3VvFEA7CJiWg26JKDlv_1qEUeCCr4Dx4')
      video = client.video_by(link)
      self.title = video.title
      self.description = video.description
    rescue
      self.title = ''
      self.description = ''
    end
  end

end