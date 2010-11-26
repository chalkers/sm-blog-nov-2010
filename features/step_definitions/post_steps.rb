Given /^the following posts:$/ do |posts|
  Post.create!(posts.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) post$/ do |pos|
  visit posts_path
  within("table tr:nth-child(#{pos.to_i+1})") do
    click_link "Delete Post"
  end
end

Then /^I should see the following posts:$/ do |expected_posts_table|
  expected_posts_table.diff!(tableish('table tr', 'td,th'))
end


Given /^I have the following post records$/ do |table|
  #[
  #  {:title =>"Ruby"},
  #  {:title =>"Rails"},
  #  {:title =>"BDD"}
  #]
  table.hashes.each do |attributes|
    #{:title =>"BDD"}
    Factory(:post, attributes)
  end
end



Given /^I add (\d+) published posts$/ do |number_of_posts|
  number_of_posts.to_i.times do
    Factory(:post)
  end
end

Given /^I add (\d+) draft posts$/ do |number_of_posts|
  number_of_posts.to_i.times do
    Factory(:draft)
  end
end
