require 'rails_helper'

RSpec.describe "Questions", :type => :request do
  describe "GET /questions" do
    before(:each) do
      @question1 = Question.create(title: 'question1', content: "this is the body of question1")
      @question2 = Question.create(title: 'question2', content: "this is the body of question2")
      @question3 = Question.create(title: 'question3', content: "this is the body of question3")
    end
    it "should respond from the root path" do
      visit root_path
      expect(page).to have_content @question1.title
      expect(page).to have_content @question2.title
      expect(page).to have_content @question3.title
    end
    it "it displays the questions title on the page" do
      visit questions_path
      expect(page).to have_content @question1.title
      expect(page).to have_content @question2.title
      expect(page).to have_content @question3.title
    end
  end

  describe "GET /questions/:id" do
    before(:each) do
      @question1 = Question.create(title: 'question1', content: "this is the body of question1")
      @answer1 = @question1.answers.create(title: 'answer1', content: "this is the body of answer")
      @answer2 = @question1.answers.create(title: 'answer2', content: "this is the body of answer")
    end
    it "should display the question content and its answers" do
      visit question_path(@question1)
      expect(page).to have_content @question1.content
      expect(page).to have_content @answer1.content
      expect(page).to have_content @answer2.content
    end
  end
end
