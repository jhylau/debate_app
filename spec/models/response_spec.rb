require 'spec_helper'

describe Response do
  it {should validate_presence_of(:debate_side_id)}
  it {should validate_presence_of(:content)}
  it {should validate_presence_of(:response_type)}
  it {should allow_mass_assignment_of(:content)}
  it {should allow_mass_assignment_of(:debate_side_id)}
end
