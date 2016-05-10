module ControllerMacros
  def login_admin
    let(:admin) { Admin.create(email: "admin@social.com", password: "12345678") }

    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      sign_in FactoryGirl.create(:admin)
    end
  end
end
