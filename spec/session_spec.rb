require 'rspec/autorun'

require_relative '../models/session'

describe 'Session' do
  let(:good_url) do
    'https://andycalder.zendesk.com/api/v2/tickets.json?page[size]=25'
  end

  let(:bad_url) do
    'https://andycalderasdf.zendesk.com/api/v2/tickets.json?page[size]=25'
  end

  describe '#load_json' do
    it 'should return 401 for bad credentials' do
      Session.load_json(good_url, 'bad', 'bad') do |status|
        expect(status).to eq('401')
      end
    end

    it 'should return 404 for bad url' do
      Session.load_json(bad_url, 'bad', 'bad') do |status|
        expect(status).to eq('404')
      end
    end
  end
end
