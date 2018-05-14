require 'rails_helper'

RSpec.describe 'Routing of Url Model', type: :routing do
  let(:url_id) { create(:url).id }

  it 'should route GET /v1/url to UrlController#index' do
    expect(get('/v1/url')).to route_to(
      controller: 'v1/url',
      action: 'index',
      format: 'json'
    )
  end

  it 'should route GET /v1/url/:id to UrlController#show' do
    expect(get("/v1/url/#{url_id}")).to route_to(
      controller: 'v1/url',
      action: 'show',
      id: url_id.to_s,
      format: 'json'
    )
  end

  it 'should route POST /v1/url to UrlController#create' do
    expect(post('/v1/url')).to route_to(
      controller: 'v1/url',
      action: 'create',
      format: 'json'
    )
  end

  it 'should route DELETE /v1/url/:id to UrlController#destroy' do
    expect(delete("/v1/url/#{url_id}")).to route_to(
      controller: 'v1/url',
      action: 'destroy',
      id: url_id.to_s,
      format: 'json'
    )
  end
end
