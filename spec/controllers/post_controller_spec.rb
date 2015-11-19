require 'rails_helper'
RSpec.describe PostsController, type: :controller do 
	before(:all) do 
		Post.new(title: 'My title', content: 'My content')
	end
	let(:valid_attributes) { {} }
	let(:invalid_attributes) { {} }
	let(:valid_session) {{}}
	context '#index' do 
		it "Assign instance variable" do
			@post = Post.all
			get :index
			expect(assigns(:posts)).to eq(@post)
		end
		it "Render index page"do
			get :index
			expect(response).to render_template("index")
		end
	end
	context "#new" do 
		it "New a post" do 
			get :new
			expect(assigns(:post)).to be_a_new(Post) #test if assigns(:post) is an instance of Post
		end 
		it "Render new page" do 
			get :new
			expect(response).to render_template("new")
		end
	end
	context "#create" do 
		it "Create new post" do 
			expect{
				post :create, {:post => valid_attributes}, valid_session
			}.to change(Post, :count).by(1)
		end
		it "Assign a newly created post as @post" do 
			post :create, {:post => valid_attributes}, valid_session
			expect(assigns(:post)).to be_a(Post)
			expect(assigns(:post)).to be_persisted
		end
		it "Redirect to the homepage" do 
			post :create, {:post => valid_attributes},valid_session
			expect(response).to redirect_to(Post.last)
		end
	end
	context "#destroy" do 
		it "destroys the requested Post" do
		    post = Post.create! valid_attributes
		    expect {
		        delete :destroy, {:id => post.id }, valid_session
		      }.to change(Post, :count).by(-1)
	    end

	    it "redirects to the homepage" do
		    post = Post.create! valid_attributes
		    delete :destroy, {:id => post.id}, valid_session
		    expect(response).to redirect_to(posts_path)
	    end
 	 end
end