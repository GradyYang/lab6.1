When /^I edit this post$/ do 
	click_link("Edit", :href=>"/posts/#{@post.id}/edit")
end
When /^I update title to "(.*?)" and content to "(.*?)"$/ do |edit_title, edit_content|
	@title = edit_title
	fill_in "Title", :with => edit_title
	fill_in "Content", :with => edit_content
	click_button("Update Post")
end
Then /^I can see it has been updated$/ do
	page.should have_content(@title)
end