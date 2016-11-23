require_relative '../spec_helper'

describe DbClone::Pg do

  let(:engine) do
    described_class.new(conf, 'new_db_name', nil)
  end

  let(:conf) do
    {}
  end

  let(:conf) do
    {'adapter' => adapter}
  end

  let(:adapter) do
    'postgresql'
  end

  it 'should be applicable' do
    expect(engine).to be_applicable
  end

  context 'when mysql adapter' do
    let(:adapter) do
      'mysql'
    end

    it 'should not be applicable' do
      expect(engine).not_to be_applicable
    end
  end


end