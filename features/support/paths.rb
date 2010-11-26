module NavigationHelpers
  def path_to(page_name)
    case page_name
    
      when /the homepage/i
        root_path
      when /the sign in page/i
        sign_in_path
      when /the sign up page/i
        sign_up_path
      when /the password reset request page/i
        new_password_path
      when /the new post page/
        new_post_path
      when /post list page/
        posts_path
      when /edit post page/
        edit_post_path(Factory(:post))
      
      # Add more page name => path mappings here
    
      else
        raise "Can't find mapping from \"#{page_name}\" to a path."
    end
  end
end

World(NavigationHelpers)