require 'spec_helper'
require_relative '../../lib/file_parser'

RSpec.describe FileParser do
  let(:file_path) { 'spec/fixtures/correct_webserver.log' }
  let(:webpages) { [Webpage.new('/help_page/1')] }

  subject { described_class.new(file_path) }

  describe '#parse' do
    context 'file format is correct' do
      it 'updates the page' do
        expect(subject.parse).to match_array([
                                               have_attributes(
                                                 class: Webpage,
                                                 url: '/help_page/1',
                                                 visits: 2
                                               )
                                             ])
      end

      it 'returns an array of Webpage objects' do
        expect(subject.parse).to match_array([
                                               have_attributes(
                                                 class: Webpage,
                                                 url: '/help_page/1'
                                               )
                                             ])
      end
    end

    context 'file format is incorrect' do
      let(:file_path) { 'spec/fixtures/invalid_webserver.log' }

      it 'raises file format error' do
        expect { subject.parse }.to raise_error(FileFormatError, 'Incorrect file format')
      end
    end
  end

  describe '#check_file_presence' do
    context 'correct file' do
      it 'returns nil if everythings okay' do
        expect(subject.send(:check_file_presence)).to be_nil
      end
    end

    context 'file does not exist' do
      let(:file_path) { 'spec/fixtures/correct_webserver.logg' }

      it 'raises file missing error' do
        expect { subject.check_file_presence }.to raise_error(FileMissingError, 'File is not present')
      end
    end

    context 'incorrect extension of file' do
      let(:file_path) { 'spec/fixtures/invalid_webserver.lo' }

      it 'raises file extension error' do
        expect { subject.check_file_presence }.to raise_error(FileExtensionError, 'Incorrect file extension')
      end
    end
  end
end
