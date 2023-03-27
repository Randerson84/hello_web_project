require 'spec_helper'
require 'rack/test'
require_relative '../../app'

describe Application do
    include Rack::Test::Methods

    let(:app) { Application.new}

    #GET /hello

    context 'GET /hello' do
        it 'returns 200 OK' do
            response = get('/hello')

            expect(response.status).to be(200)
        end
    end
     #GET /names

     context 'GET /names' do
        it 'should return "Julia, Mary, Karim"' do
            response = get('/names?names=Julia,Mary,Karim')

            expect(response.status).to eq(200)
            expect(response.body).to eq('Julia,Mary,Karim')
        end
        it 'should return "Ray, Jack, Shilpa"' do
            response = get('/names?names=Ray,Jack,Shilpa')

            expect(response.status).to eq(200)
            expect(response.body).to eq('Ray,Jack,Shilpa')
        end
        it 'should return "Alice,Joe,Julia,Kieran,Zoe"' do
            response = post('/sort-names?names=Joe,Alice,Zoe,Julia,Kieran')

            expect(response.status).to eq(200)
            expect(response.body).to eq('Alice,Joe,Julia,Kieran,Zoe')   
        end
    end
end