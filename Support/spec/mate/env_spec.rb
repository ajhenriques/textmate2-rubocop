require 'spec_helper'
require 'mate/env'

# To aid in testing modules
class Dummy
  include Mate::Env
end

describe 'mate env' do

  it 'should define a project_path' do
    expect(Dummy.new.project_path).to match /Support/
  end

  it 'should define a vendor_path' do
    expect(Dummy.new.vendor_path).to match /Support/
  end

  it 'should define a multiple_files' do
    expect(Dummy.new.multiple_files).to_not be_empty
  end

  it 'should define single_file' do
    expect(Dummy.new.single_file).to match /Support/
  end

  describe 'names' do

    ['John', 'John Smith', 'John Doe'].each do |val|

      before(:each) do
        ENV['TM_FULLNAME'] = val
      end

      it 'should have user first name' do
        expect(Dummy.new.users_first_name).to match /jo/i
      end
    end

    it 'should have an array of names' do
      expect(Dummy.new.users_names.length).to be(2)
    end

    it "should not return anyting if the TM_FULLNAME is not set" do
      ENV['TM_FULLNAME'] = ''
      expect(Dummy.new.users_first_name).to eq ''
    end

  end
end
