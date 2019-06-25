require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  context "GET #new" do
    it 'success' do
      @request.env["HTTP_AUTHORIZATION"] = ActionController::HttpAuthentication::Basic.encode_credentials('dhh', 'secret')  
      get :new
      expect(response.status).to eq(200)
    end
  end

  context "POST #create" do
    it 'success' do
      @request.env["HTTP_AUTHORIZATION"] = ActionController::HttpAuthentication::Basic.encode_credentials('dhh', 'secret')  
      post :create, params: {article: {title: "Pradip Blog"}}
      expect(response.status).to eq(302)
      expect(response).to redirect_to(article_path(Article.last))
    end

    it 'fails and render new' do
      @request.env["HTTP_AUTHORIZATION"] = ActionController::HttpAuthentication::Basic.encode_credentials('dhh', 'secret')  
      post :create, params: {article: {title: ""}}
      expect(response.status).to eq(200)
      expect(response).to render_template(:new)
    end
  end

  context 'GET #show' do
    before(:each) do
      @a = Article.create(title: "Pradip Blog")
    end

    it 'success' do 
      get :show, params: {id: @a.id}
      expect(response.status).to eq(200)
      expect(response).to render_template(:show)
    end
  end

  context 'GET #index' do
    it 'success' do 
      get :index
      expect(response.status).to eq(200)
      expect(response).to render_template(:index)
    end
  end
  
  context "GET #new" do
    before(:each) do
      @a = Article.create(title: "Pradip Blog")
    end

    it 'success' do
      @request.env["HTTP_AUTHORIZATION"] = ActionController::HttpAuthentication::Basic.encode_credentials('dhh', 'secret')  
      get :edit, params: {id: @a.id}
      expect(response.status).to eq(200)
    end
  end

  context "POST #update" do
    before(:each) do
      @a = Article.create(title: "Pradip Blog")
    end

    it 'success' do
      @request.env["HTTP_AUTHORIZATION"] = ActionController::HttpAuthentication::Basic.encode_credentials('dhh', 'secret')  
      post :update, params: {article: {title: "Pradip Blog"}, id: @a.id}
      expect(response.status).to eq(302)
      expect(response).to redirect_to(article_path(@a))
    end

    it 'fails and render edit' do
       @request.env["HTTP_AUTHORIZATION"] = ActionController::HttpAuthentication::Basic.encode_credentials('dhh', 'secret')  
      post :update, params: {article: {title: ""}, id: @a.id}
      expect(response.status).to eq(200)
      expect(response).to render_template(:edit)
    end
  end

context "DELETE #destroy" do
    before(:each) do
      @a = Article.create(title: "Pradip Blog")
    end

    it 'success' do
      @request.env["HTTP_AUTHORIZATION"] = ActionController::HttpAuthentication::Basic.encode_credentials('dhh', 'secret')  
      delete :destroy, params: {id: @a.id}
      expect(response.status).to eq(302)
      expect(response).to redirect_to(articles_path)
    end
  end
end
