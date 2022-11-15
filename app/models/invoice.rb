class Invoice < ApplicationRecord
  belongs_to :client
  belongs_to :profile

  def client_details
    self.client
  end
  
  def profile_details
    self.profile
  end

end
