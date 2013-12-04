module IntegrationSpecHelper
  def login_with_oauth(service = :instagram)
    visit "/auth/#{service}"
  end
end