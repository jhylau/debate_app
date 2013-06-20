module DebateHelper
  def in_browser(name)
    Capybara.session_name = name
    yield
  end
end
