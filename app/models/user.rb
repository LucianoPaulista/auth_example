class User < ApplicationRecord
  include Rails.application.routes.url_helpers

  devise :database_authenticatable,
         :jwt_authenticatable,
         :registerable,
         jwt_revocation_strategy: JwtDenylist

  has_one_attached :avatar

  has_many :assignments
  has_many :user_companies
  has_many :roles, class_name: 'Role', through: :assignments
  has_many :companies, class_name: 'Company', through: :user_companies

  def role?(role, entity_id = nil)

    if entity_id.present?
      roles.where(entity_id: entity_id, name: role).any?
    else
      logger.warn "Role check used without an entity id presented"
      #{role} called for #{id} user"
      roles.any? {|r| r.name.to_sym == role}
    end
  end

  def image_url
    #Get the URL of the associated image
    avatar.attached? ? url_for(avatar) : nil
  end

end
