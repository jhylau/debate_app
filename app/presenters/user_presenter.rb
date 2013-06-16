class UserPresenter
  attr_accessor :username

  def initialize(opts = {})
    @username = opts.fetch(:username)
    redefine(@username)
  end

  def redefine(name)
    if name == nil
      @username = 'TBD'
    end
  end

end
