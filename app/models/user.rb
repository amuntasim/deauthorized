class User < ApplicationRecord

  # Simple authentication token for mobile apps
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :confirmable and :omniauthable

  # Include default devise modules.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :subdomain, presence: true, uniqueness: true, exclusion: { in: %w(www)}

  after_create :create_tenant

  private

  def create_tenant
    Apartment::Tenant.create(subdomain)
  end

end
