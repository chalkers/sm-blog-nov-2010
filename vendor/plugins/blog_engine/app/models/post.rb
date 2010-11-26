class Post < ActiveRecord::Base
  has_many :comments
  #select * from comments where post_id = id

  validates :title, :presence => true
  validates :body, :presence => true

  scope :published, where(:published => true)

  def to_param
    "#{self.id}-#{seo_title}"
  end

  def seo_title
    self.title.gsub("'","").gsub(/[_\s\"]+/,"-").downcase.chomp("-")
  end

end
