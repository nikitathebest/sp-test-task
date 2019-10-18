require 'spec_helper'
require_relative '../../lib/webpage'

RSpec.describe Webpage do
  let(:url) { '/home' }
  let(:ip) { '127.0.0.0' }
  let(:ips) { ['127.0.0.1', '127.0.0.1', '128.1.1.1'] }
  
  subject { described_class.new(url) }
  
  it 'updates webpage with ip and visit' do 
    expect { subject.update_page(ip) }.to change { subject.visits }.by(1)
    expect(subject.ips).to eq(['127.0.0.0'])
  end
end