require 'rails_helper'

RSpec.describe QuestionsController, :type => :controller do
  before(:each) do
    @question1 = FactoryGirl.build :question #Question.create(title: 'question1', content: "this is the body of question1")
    @question1.save
    @question2 = FactoryGirl.build :question #Question.create(title: 'question2', content: "this is the body of question2")
    @question2.save
  end
  context "index" do
    it "should return success" do
      get :index
      expect(response).to be_success
    end
    it "should assign all questions to @questions" do
      get :index
      expect(assigns(:questions)).to eq Question.all
    end
  end

  context "show" do
      it "should return success" do
      get :show, id: @question1.id
      expect(response).to be_success
    end
    # shows a specific question with all its answers
  end
end
