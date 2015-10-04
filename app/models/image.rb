class Image < ActiveRecord::Base
  belongs_to :user
  has_many :events

  has_attached_file :image,
                    :storage => :s3,
                    :s3_credentials => Proc.new{|a| a.instance.s3_credentials }

  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  def s3_credentials
    {:bucket => ENV["s3_bucket"], :access_key_id => ENV["aws_id"], :secret_access_key => ENV["aws_key"]}
  end
end
