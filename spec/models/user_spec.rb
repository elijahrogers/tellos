require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many :projects }

  it 'is database authenticatable' do
    expect(User.included_modules).to include(Devise::Models::DatabaseAuthenticatable)
  end

  it 'is registerable' do
    expect(User.included_modules).to include(Devise::Models::Registerable)
  end

  it 'is recoverable' do
    expect(User.included_modules).to include(Devise::Models::Recoverable)
  end

  it 'is rememberable' do
    expect(User.included_modules).to include(Devise::Models::Rememberable)
  end

  it 'is trackable' do
    expect(User.included_modules).to include(Devise::Models::Trackable)
  end

  it 'is validatable' do
    expect(User.included_modules).to include(Devise::Models::Validatable)
  end
end
