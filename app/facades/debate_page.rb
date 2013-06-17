class DebatePage
  attr_reader :debate

  def initalize(debate)
    @debate = debate
  end

  def yes_side
    @yes_side ||= @debate.debate_side.where(side:"yes")
  end

  def no_side
   @no_side ||= @debate.debate_side.where(side:"no")
  end

  def user_yes
    @user_yes ||= @debate_side_yes.user
  end
      
  def user_no
    @user_no ||= @debate_side_no.user
  end

  def votes_yes
    @vote_yes ||= @debate_side_yes.votes.new
  end

  def votes_no
    @vote_no ||= @debate_side_no.votes.new
  end
end
