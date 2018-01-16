require 'rails_helper'

describe User do
  context 'validations' do
    it { should validate_presence_of(:subdomain) }
    it { should validate_exclusion_of(:subdomain).in_array(%w(www)) }

    it 'should validate unique subdomain' do
      create(:user, subdomain: 'subdomain1')
      expect { create(:user, subdomain: 'subdomain1') }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  context 'create' do
    it 'should create tenant' do
      expect(Apartment::Tenant).to receive(:create).with('subdomain1')
      create(:user, subdomain: 'subdomain1')
    end
  end
end
