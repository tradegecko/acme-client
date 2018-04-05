require 'spec_helper'

describe Acme::Client::Resources::Order do
  let(:private_key) { generate_private_key }
  let(:unregistered_client) do
    client = Acme::Client.new(private_key: private_key, directory: $directory_url)
    client.new_account(contact: 'mailto:info@example.com', terms_of_service_agreed: true)
    client
  end

  let(:client) do
    client = Acme::Client.new(private_key: private_key, directory: $directory_url)
    client.new_account(contact: 'mailto:info@example.com', terms_of_service_agreed: true)
    client
  end

  let(:order) do
    client.new_order(identifiers: [{type: 'dns', value: 'example.com'}])
  end

  context 'account' do
    it 'send the agreement for the terms', vcr: { cassette_name: 'registration_agree_terms' } do
      expect(account.status).to eq('valid')
    end
  end

  context 'update' do
    it 'update contact information', vcr: { cassette_name: 'account_update' } do
      expect(account.contact).to eq(['mailto:info@example.com'])
      account.update(contact: 'mailto:updated@example.com')
      expect(account.contact).to eq(['mailto:updated@example.com'])
    end
  end

  context 'deactivate' do
    it 'deactivate account', vcr: { cassette_name: 'account_deactivate' } do
      expect(account.status).to eq('valid')
      account.deactivate
      expect(account.status).to eq('deactivated')
    end
  end
end