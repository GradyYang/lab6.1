Given /^there is post titled with "(.*?)" and content with "(.*?)"$/ do |newtitle, newcontent|
	Post.create!({:title=>newtitle, :content => newcontent, :post_time =>Time.now})
end
When /^I am on the home page$/ do 
	visit("/posts")
end
And /^I select a "(.*?)"$/ do |title|
	@post = Post.where(:title=>title)[0]
end
And /^I click "Delete Post"$/ do 
	click_link("Destroy", :href=>"/posts/#{@post.id}")
end
Then /^the post should be deleted$/ do 
	visit("/posts")
	page.should_not have_content (@post.title)
end