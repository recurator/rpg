require 'rails_helper'

RSpec.describe "CharacterTypes", type: :request do
  describe "GET /character_types" do
    it "works! (now write some real specs)" do
      get character_types_path
      expect(response).to have_http_status(200)
    end
  end
end
