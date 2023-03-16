require_relative '../trimmer'
require_relative '../capitalize'
require_relative '../person'

describe Decorator do
  before :each do
    @person = Person.new(32, 'maximilianus', parent_permission: false)
    @capitalize = CapitalizeDecorator.new(@person)
    @trimmer = TrimmerDecorator.new(@capitalize)
  end

  it 'shoud display the correct name of person' do
    expect(@person.correct_name).to eq 'maximilianus'
  end

  it 'shoud display the correct name of person after capitalizing' do
    expect(@capitalize.correct_name).to eq 'Maximilianus'
  end
end
