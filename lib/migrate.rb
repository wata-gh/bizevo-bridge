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

  def self.worktimes
    Bizsup::Worktime.where(:date => Date.parse('2015-04-01')..Date.parse('2015-05-31')).each do |bw|
      w = Worktime.where(:date => bw.date, :psnal_cd => bw.psnal_cd).first_or_initialize
      attr = bw.attributes
      attr.delete 'created_at'
      attr.delete 'updated_at'
      w.attributes = attr
      w.save
    end
  end
end
