require 'spec_helper'


describe "Mate runner" do

  before(:each) do
    tm_selected_files(__FILE__)
    @runner = Mate::Runner.new
  end

  # it "should be able to run" do
  #   pending 'this is super noisy'
  #   # lambda { @runner.current_file }.should_not raise_error
  # end

  it "should have project_path" do
    expect(@runner.send(:project_path)).to match /Support/
  end

  it "should responed to multiple_files" do
    expect(@runner.send(:multiple_files)).not_to be_empty
  end

end