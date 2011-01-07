require 'spec_helper'

describe "blogs/edit.html.erb" do
  before(:each) do
    @blog = assign(:blog, stub_model(Blog,
      :new_record? => false,
      :title => "MyString",
      :body => "MyText"
    ))
  end

  it "renders the edit blog form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => blog_path(@blog), :method => "post" do
      assert_select "input#blog_title", :name => "blog[title]"
      assert_select "textarea#blog_body", :name => "blog[body]"
    end
  end
end
