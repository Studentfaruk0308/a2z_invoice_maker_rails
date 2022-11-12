class Invoice < ApplicationRecord
  belongs_to :client

  def client_details
    self.client.company_name
  end
  
end
