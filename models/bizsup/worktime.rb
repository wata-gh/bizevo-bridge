module Bizsup
  class Worktime < ActiveRecord::Base
    establish_connection configurations[:bizsup]
  end
end
