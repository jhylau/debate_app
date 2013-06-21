require 'spec_helper'

describe DebateSideDecorator do 
  context 'creating a debate side' do
    let (:debate_side) do
      FactoryGirl.create(:debate_side)
    end

    let(:decorated_debate_side) do
      debate_side.decorate
    end
  
    it 'shows the debater name'

    it 'returns the debater object'

    it 'returns the vote count'
    it 'returns the opposing argument'

    it 'returns the opposing rebuttal'
  end
end
