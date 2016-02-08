require 'rails_helper'

RSpec.describe Answer, type: :model do
  let(:question) {Question.create!(title: "New Question title", body: "New Question body ...")}
  let(:answer) {Answer.create!(body: "New ANswer body", question: question)}

  describe "attributes" do
  	it "responds to body" do
  		expect(answer).to respond_to(:body)
  	end
  end
end
