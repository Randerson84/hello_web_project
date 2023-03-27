require 'spec_helper'
require 'rack/test'
require_relative '../../app'

describe Application do
    include Rack::Test::Methods

    let(:app) { Application.new}

    #GET /names

    context 'GET /hello' do
        it 'returns 200 OK' do
            response = get('/hello')

            expect(response.status).to be(200)
        end
    end
end