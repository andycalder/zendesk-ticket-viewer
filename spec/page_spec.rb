require 'rspec/autorun'
require 'json'

require_relative '../models/page'
require_relative '../models/ticket'

describe 'Page' do
  let(:page_hash) do
    file = File.read('spec/support/tickets.json')
    JSON.parse(file, { symbolize_names: true })
  end

  it 'should be initialized with a page Hash' do
    page = Page.new(page_hash)
    expect(page).to be_a(Page)
  end

  describe '#all' do
    it 'should return a hash of tickets' do
      page = Page.new(page_hash)
      expect(page.all.length).to eq(3)
    end
  end

  describe '#find' do
    it 'should return a ticket' do
      page = Page.new(page_hash)
      expect(page.find(101)).to be_a(Ticket)
    end
  end

  describe '#next_page?' do
    it 'should return false if there is no next page' do
      page = Page.new(page_hash)
      expect(page.next_page?).to eq(false)
    end
  end

  describe '#prev_page?' do
    it 'should return true if there is a prev page' do
      page = Page.new(page_hash)
      expect(page.prev_page?).to eq(true)
    end
  end
end
