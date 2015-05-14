module Migrate
  def self.users
    Bizsup::User.all.each do |bu|
      u = User.where(:psnal_cd => bu.psnal_cd).first_or_initialize
      au = ActiveUser.find :filter => {:description => u.psnal_cd}
      next unless au
      u.mst_blg_cd = bu.mst_blg_cd
      u.name = au.sAMAccountName
      u.full_name = au.cn
      u.save
    end
  end
end