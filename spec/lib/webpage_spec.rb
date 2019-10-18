require 'spec_helper'
require_relative '../../lib/webpage'

RSpec.describe Webpage do
  let(:url) { '/home' }
  let(:ip) { '127.0.0.0' }
  let(:ips) { ['127.0.0.1', '127.0.0.1', '128.1.1.1'] }
  let(:print_visits_data) { '/home 3 visits' }
  let(:print_unique_views_data) { '/home 2 unique views' }

  subject { described_class.new(url) }

  it 'updates webpage with ip and visit' do
    expect { subject.update_page(ip) }.to change { subject.visits }.by(1)
    expect(subject.ips).to eq(['127.0.0.0'])
  end

  it 'calculates unique views' do
    subject.ips = ips
    expect(subject.unique_views).to eq(2)
  end

  it 'returns total visits' do
    subject.visits = 3
    expect(subject.print_visits).to eq(print_visits_data)
  end

  it 'returns unique views' do
    subject.ips = ips
    expect(subject.print_unique_views).to eq(print_unique_views_data)
  end
end
