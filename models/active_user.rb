class ActiveUser < ActiveLdap::Base
  ldap_mapping :dn_attribute => "cn", :prefix => ''

  def self.find_user name
    return nil if name.blank?
    self.find(:first, filter: {:sAMAccountName => name})
  end
end
