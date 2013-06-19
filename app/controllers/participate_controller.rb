class ParticipateController < ApplicationController
  def index
    @all_debates = Debate.all
    @debates = only_one_user(@all_debates)
  end

  private
  def only_one_user(debates)
    debates_with_only_one_user = debates.select { |i| i.has_one_user? }
  end

end
