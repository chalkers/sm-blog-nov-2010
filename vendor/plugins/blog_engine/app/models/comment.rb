class Comment < ActiveRecord::Base
  validates :name, :presence => true
  validates :email, :presence => true
  validates :comment, :presence => true

  validates :email, :format => {:with => /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i}
  validates :website, :format => {:with => /^http:\/\/.+/i}
  validate :check_for_more_comments
  belongs_to :post

  def check_for_more_comments
    if post.comments.count > 1
      self.errors.add_to_base "Can't save more than 2 comments"
    end
  end
end
