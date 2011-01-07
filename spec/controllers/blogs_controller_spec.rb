require 'spec_helper'

describe BlogsController do

  def mock_blog(stubs={})
    (@mock_blog ||= mock_model(Blog).as_null_object).tap do |blog|
      blog.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all blogs as @blogs" do
      Blog.stub(:all) { [mock_blog] }
      get :index
      assigns(:blogs).should eq([mock_blog])
    end
  end

  describe "GET show" do
    it "assigns the requested blog as @blog" do
      Blog.stub(:find).with("37") { mock_blog }
      get :show, :id => "37"
      assigns(:blog).should be(mock_blog)
    end
  end

  describe "GET new" do
    it "assigns a new blog as @blog" do
      Blog.stub(:new) { mock_blog }
      get :new
      assigns(:blog).should be(mock_blog)
    end
  end

  describe "GET edit" do
    it "assigns the requested blog as @blog" do
      Blog.stub(:find).with("37") { mock_blog }
      get :edit, :id => "37"
      assigns(:blog).should be(mock_blog)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created blog as @blog" do
        Blog.stub(:new).with({'these' => 'params'}) { mock_blog(:save => true) }
        post :create, :blog => {'these' => 'params'}
        assigns(:blog).should be(mock_blog)
      end

      it "redirects to the created blog" do
        Blog.stub(:new) { mock_blog(:save => true) }
        post :create, :blog => {}
        response.should redirect_to(blog_url(mock_blog))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved blog as @blog" do
        Blog.stub(:new).with({'these' => 'params'}) { mock_blog(:save => false) }
        post :create, :blog => {'these' => 'params'}
        assigns(:blog).should be(mock_blog)
      end

      it "re-renders the 'new' template" do
        Blog.stub(:new) { mock_blog(:save => false) }
        post :create, :blog => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested blog" do
        Blog.should_receive(:find).with("37") { mock_blog }
        mock_blog.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :blog => {'these' => 'params'}
      end

      it "assigns the requested blog as @blog" do
        Blog.stub(:find) { mock_blog(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:blog).should be(mock_blog)
      end

      it "redirects to the blog" do
        Blog.stub(:find) { mock_blog(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(blog_url(mock_blog))
      end
    end

    describe "with invalid params" do
      it "assigns the blog as @blog" do
        Blog.stub(:find) { mock_blog(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:blog).should be(mock_blog)
      end

      it "re-renders the 'edit' template" do
        Blog.stub(:find) { mock_blog(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested blog" do
      Blog.should_receive(:find).with("37") { mock_blog }
      mock_blog.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the blogs list" do
      Blog.stub(:find) { mock_blog }
      delete :destroy, :id => "1"
      response.should redirect_to(blogs_url)
    end
  end

end
