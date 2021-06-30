require 'rails_helper'

RSpec.describe "Edits", type: :request do
  describe "edit controller" do
    it "should" do
      get('/edit', params: {user: nil})
      rs = JSON.parse(response.body)
      expect(rs['message']).to eql('must chose an account')

      get('/edit', params: {user: ""})
      rs = JSON.parse(response.body)
      expect(rs['message']).to eql('must chose an account')

      get('/edit', params: {user: "user"})
      rs = JSON.parse(response.body)
      expect(rs['message']).to eql('edit info')
    end
  end
end
