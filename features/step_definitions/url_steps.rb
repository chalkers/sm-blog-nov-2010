Then /^I the url should end in (.+)$/ do |url_ending|
  current_path.should == current_path.chomp(url_ending) + url_ending
end
