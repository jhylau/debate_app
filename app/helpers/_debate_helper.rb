module DebateHelper
  def username(debate_side)
    if debate_side.first.user == nil
      return 'TBD'
    else
      return debate_side.first.user.username
    end
  end
end
