require 'rails_helper'

RSpec.describe 'URL API', type: :request do
  let!(:urls) { create_list(:url_with_content, 2) }
  let(:url_id) { urls.first.id }

  # Tests for GET requests
  describe 'Get /v1/url' do
    before { get '/v1/url' }

    it 'returns urls' do
      expect(json).not_to be_empty
      expect(json.size).to eq(2)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /v1/url/:id' do
    before { get "/v1/url/#{url_id}" }

    context 'when the record(url) exists' do
      it 'returns that specific url' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(url_id)
      end
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record(url) does not exists' do
      let(:url_id) { 50 }

      it 'return status code 404' do
        expect(response).to have_http_status 404
      end
      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Url with 'id'=50/)
      end
    end
  end

  # Test for POST requests
  describe 'POST /v1/url' do
    # The following link is the HTML file placed at spec/data/sample.html, which is used for testing post requests
    sample_html_link = 'https://raw.githubusercontent.com/Ronaq13/scraping/master/spec/data/sample.html'
    let(:valid_attributes) { { url: { link: sample_html_link } } }

    context 'when the requested link, is valid for parsing' do
      before { post '/v1/url', params: valid_attributes }
      it 'should creates a url with the parsed content' do
        expect(json['link']).to eq sample_html_link
        expect(json['h1'].size).to eq 1
        expect(json['h2'].size).to eq 2
        expect(json['h3'].size).to eq 1
        expect(json['h1'][0]).to eq 'This is the heading of this page'
        expect(json['h2'][0]).to eq 'This is a heading of a content'
        expect(json['h2'][1]).to eq 'The footer of the page'
        expect(json['h3'][0]).to eq 'The actual content'
      end
      it 'returns status code 201' do
        expect(response).to have_http_status 201
      end
    end

    context 'when the requested link is invalid' do
      before { post '/v1/url', params: { url: {link: 'http://raounak sharma.in'} } }

      it 'should returns status code 422' do
        expect(response).to have_http_status(422)
      end
    end
  end

  # Test suite for DELETE /v1/url/:id
  describe 'DELETE /todos/:id' do
    before { delete "/v1/url/#{url_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
