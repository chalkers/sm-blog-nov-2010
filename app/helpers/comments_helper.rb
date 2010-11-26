module CommentsHelper

  def number_of_comments(comments)
    if comments.size == 0
      "No comments"
    else
      pluralize(comments.size, "comment")
    end
  end

end
