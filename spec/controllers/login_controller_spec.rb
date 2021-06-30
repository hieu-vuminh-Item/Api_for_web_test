require 'rails_helper'

RSpec.describe 'request', type: :request do
  describe 'post /login' do
    it 'should success' do
      post('/login', params: {user: nil, pass: nil })
      rs = JSON.parse(response.body)
      expect(rs['message']).to eql('Account not exist')

      post('/login', params: {user: '', pass: '' })
      rs = JSON.parse(response.body)
      expect(rs['message']).to eql('Account not exist')

      post('/login', params: {user: 'user', pass: nil})
      rs = JSON.parse(response.body)
      expect(rs['message']).to eql('Wrong password')

      post('/login', params: {user: 'user', pass: '1'})
      rs = JSON.parse(response.body)
      expect(rs['message']).to eql('Logged in')
    end
  end
end
