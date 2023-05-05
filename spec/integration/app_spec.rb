require 'spec_helper'
require 'rack/test'
require_relative '../../app'

describe Application do
    include Rack::Test::Methods

    let(:app) { Application.new }

    context 'GET /' do
        it 'returns "hell" through html index file' do
            response = get('/', greeting: 'hello')

            expect(response.body).to include('hello')
        end
    end

    context 'GET /hello' do
        it 'should return "Hello Verity"' do
            response = get('/hello?name=Verity')

            expect(response.status).to eq(200)
            expect(response.body).to eq('Hello Verity')
        end

        it 'should return "Hello Josh"' do
            response = get('/hello?name=Josh')

            expect(response.status).to eq(200)
            expect(response.body).to eq('Hello Josh')
        end
    end

    context 'GET /names' do
        it 'should return "Julia, Mary, Karim"' do
            response = get('/names?names=Julia, Mary, Karim')

            expect(response.status).to eq(200)
            expect(response.body).to eq('Julia, Mary, Karim')
        end
    end

    context 'POST /sort-names' do
        it 'should return names in alphabetical order' do
            response = post('/sort-names?names=Joe,Alice,Zoe,Julia,Kieran')

            expect(response.body).to eq('Alice,Joe,Julia,Kieran,Zoe')
        end
    end

end