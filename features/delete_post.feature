Feature: Delete post
	As a blog owner
	I can delete post
Scenario: Delete post 
	Given there is post titled with "Dummy post" and content with "Dummy content"
	When I am on the home page
	And I select a "Dummy post" 
	And I click "Delete Post"
	Then the post should be deleted