require 'rails_helper'

RSpec.describe CommentsController, type: :controller do

  context "POST #create" do
    let!(:article) {FactoryBot.create(:article) }
    it 'success' do
      @request.env["HTTP_AUTHORIZATION"] = ActionController::HttpAuthentication::Basic.encode_credentials('dhh', 'secret')  
      post :create, params: {article_id: article.id, comment: {commenter: "Pradip", body: "Pradipa and mdan dmna d"}}
      expect(response.status).to eq(302)
      expect(response).to redirect_to(article_path(article))
    end
  end

  context "DELETE #destroy" do
    let!(:article) {FactoryBot.create(:article) }
    let!(:comment) {FactoryBot.create(:comment,article: article)}
    it 'success' do
      @request.env["HTTP_AUTHORIZATION"] = ActionController::HttpAuthentication::Basic.encode_credentials('dhh', 'secret')  
      delete :destroy, params: {article_id: article.id, id: comment.id}
      expect(response.status).to eq(302)
      expect(response).to redirect_to(article_path(article))
    end
  end
end
