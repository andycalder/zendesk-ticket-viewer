require 'rspec/autorun'
require 'date'
require_relative '../models/ticket'

describe 'Ticket' do
  let(:attributes) do
    {
      id: 1,
      status: 'status',
      subject: 'subject',
      requester_id: 1,
      created_at: '2021-05-08T04:43:15Z',
      updated_at: '2021-05-08T04:43:15Z',
      description: 'description'
    }
  end

  it 'should be initialized with an attributes Hash' do
    ticket = Ticket.new(attributes)
    expect(ticket).to be_a(Ticket)
  end

  describe '#id' do
    it 'should return the ticket id' do
      ticket = Ticket.new(attributes)
      expect(ticket.id).to eq(1)
    end
  end

  describe '#status' do
    it 'should return the ticket status' do
      ticket = Ticket.new(attributes)
      expect(ticket.status).to eq('status')
    end
  end

  describe '#subject' do
    it 'should return the ticket subject' do
      ticket = Ticket.new(attributes)
      expect(ticket.subject).to eq('subject')
    end
  end

  describe '#requester_id' do
    it 'should return the ticket requester_id' do
      ticket = Ticket.new(attributes)
      expect(ticket.requester_id).to eq(1)
    end
  end

  describe '#created_at' do
    it 'should return the ticket created_at as a Date' do
      ticket = Ticket.new(attributes)
      expect(ticket.created_at).to be_a(Date)
    end
  end

  describe '#updated_at' do
    it 'should return the ticket updated_at as a Date' do
      ticket = Ticket.new(attributes)
      expect(ticket.updated_at).to be_a(Date)
    end
  end

  describe '#description' do
    it 'should return the ticket description' do
      ticket = Ticket.new(attributes)
      expect(ticket.description).to eq('description')
    end
  end
end
