  module CreateDebateSideHelper
    def create_debate_sides_with_users(debate)
      user1 = FactoryGirl.create(:user)
      user2 = FactoryGirl.create(:user)
      debate_side_yes = FactoryGirl.create(:debate_side_with_user, debate: debate, side: 'yes', user: user1)
      debate_side_no = FactoryGirl.create(:debate_side_with_user, debate: debate, side: 'no', user: user2)
    end

    def create_debate_sides_with_one_user(debate)
      user1 = FactoryGirl.create(:user)
      debate_side_yes = FactoryGirl.create(:debate_side, debate: debate, side: 'yes', user: user1)
      debate_side_no = FactoryGirl.create(:debate_side, debate: debate, side: 'no')
    end
  end
