require 'spec_helper'
require_relative '../../lib/webpage_printer'

RSpec.describe WebpagePrinter do  
  let(:webpage1) { double }
  let(:webpage2) { double }

  before do
    allow(webpage1).to receive(:visits).and_return(2)
    allow(webpage1).to receive(:unique_views).and_return(1)
    allow(webpage1).to receive(:print_visits).and_return('/help_page/1 2 visits')
    allow(webpage1).to receive(:print_unique_views).and_return('/help_page/1 1 unique views')

    allow(webpage2).to receive(:visits).and_return(1)
    allow(webpage2).to receive(:unique_views).and_return(2)
    allow(webpage2).to receive(:print_visits).and_return('/about 1 visits')
    allow(webpage2).to receive(:print_unique_views).and_return('/about 2 unique views')
  end

  describe '#print_count' do
    it 'prints webpages by most visits' do
      expect(STDOUT).to receive(:puts).with('Page visits:')
      expect(STDOUT).to receive(:puts).with('/help_page/1 2 visits')
      expect(STDOUT).to receive(:puts).with('/about 1 visits')
      described_class.print_visits([webpage1, webpage2])
    end
  end

  describe '#print_unique' do 
    it 'prints webpages by most unique views' do
      expect(STDOUT).to receive(:puts).with('Unique page views:')
      expect(STDOUT).to receive(:puts).with('/about 2 unique views')
      expect(STDOUT).to receive(:puts).with('/help_page/1 1 unique views')
      described_class.print_unique([webpage1, webpage2])
    end
  end
end