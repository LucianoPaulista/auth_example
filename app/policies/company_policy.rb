class CompanyPolicy < ApplicationPolicy

  def index?
    @user.companies.exists? if @user.present?
  end

  def show?
    @user.role?('company.show', record.id) if @user.present?
  end

  def edit?
    update?
  end

  def update?
    @user.role?("company.update", record.id) if @user.present?
  end

  def destroy?
    @user.role?("company.destroy", record.id) if @user.present?
  end

  def new?
    create?
  end

  def create?
    true
  end

end