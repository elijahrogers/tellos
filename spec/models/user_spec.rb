require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many :projects }

  it 'is database_authenticatable' do
    expect(User.included_modules).to include(Devise::Models::DatabaseAuthenticatable)
  end

  it 'is database_authenticatable' do
    expect(User.included_modules).to include(Devise::Models::Registerable)
  end

  it 'is database_authenticatable' do
    expect(User.included_modules).to include(Devise::Models::Recoverable)
  end

  it 'is database_authenticatable' do
    expect(User.included_modules).to include(Devise::Models::Rememberable)
  end

  it 'is database_authenticatable' do
    expect(User.included_modules).to include(Devise::Models::Trackable)
  end

  it 'is database_authenticatable' do
    expect(User.included_modules).to include(Devise::Models::Validatable)
  end
end
