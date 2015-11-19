
Given /^I am on the blog homepage$/ do 
	visit("/posts")
end
And /^there are already (\d) posts$/ do |count|
	count.to_i.times do |n|
		Post.create!({:title=>"Title #{n}", :content => "Content #{n}", :post_time =>Time.now})
	end
end
Given /^there is a post with "(.*?)" and content "(.*?)"$/ do |newtitle, newcontent|
	@post = Post.create!({:title=>newtitle, :content => newcontent, :post_time =>Time.now})
end