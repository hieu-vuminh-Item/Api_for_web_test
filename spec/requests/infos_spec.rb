require 'rails_helper'

RSpec.describe "Infos", type: :request do
  describe 'post /info' do
    it 'should ' do
      get('/info', params: {user: nil})
      rs = JSON.parse(response.body)
      expect(rs['message']).to eql('you must login first')

      get('/info', params: {user: ''})
      rs = JSON.parse(response.body)
      expect(rs['message']).to eql('you must login first')

      get('/info', params: {user: 'admin'})
      rs = JSON.parse(response.body)
      expect(rs['message']).to eql('info admin role')

      get('/info', params: {user: 'user'})
      rs = JSON.parse(response.body)
      expect(rs['message']).to eql('info user role')
    end
  end
end
