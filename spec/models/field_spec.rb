require 'rails_helper'

RSpec.describe Field, type: :model do
  it ".values_pattern" do
    expect(Field.values_pattern).to eq([{'order'=>0, 'title'=>'My first field', 'type'=>'text'}])
  end
end
