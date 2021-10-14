require 'rails_helper'

describe CompanyPolicy do
  subject {described_class.new(user, company)}

  let(:company) {Company.create(description: "teste")}

  let(:role_show) {Role.create(name: "company.show", entity_id: company.id)}
  let(:role_update) {Role.create(name: "company.update", entity_id: company.id)}
  let(:role_destroy) {Role.create(name: "company.destroy", entity_id: company.id)}


  context "not signed in" do
    let(:user) {nil}
    it "does not allow #index" do
      expect { Pundit.authorize(user, company, :index?) }.to raise_error(Pundit::NotAuthorizedError)
    end
    it "does not allow #show" do
      expect { Pundit.authorize(user, company, :show?) }.to raise_error(Pundit::NotAuthorizedError)
    end
    it "does not allow #update" do
      expect { Pundit.authorize(user, company, :update?) }.to raise_error(Pundit::NotAuthorizedError)
    end
    it "does not allow #destroy" do
      expect { Pundit.authorize(user, company, :destroy?) }.to raise_error(Pundit::NotAuthorizedError)
    end
    it {is_expected.to permit_action(:new)}
    it {is_expected.to permit_action(:create)}

  end

  context "signed in" do
    let(:company) {Company.create(description: "teste")}
    let(:user) {User.create(email: "luciano@tigestor.com.br", roles: [role_show, role_update, role_destroy])}
    before(:each) {
      user.companies << company
    }

    it {is_expected.to permit_action(:index)}
    it {is_expected.to permit_action(:show)}
    it {is_expected.to permit_action(:new)}
    it {is_expected.to permit_action(:create)}
    it {is_expected.to permit_action(:update)}
    it {is_expected.to permit_action(:destroy)}
    end

end