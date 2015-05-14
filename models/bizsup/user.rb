module Bizsup
  class User < ActiveRecord::Base
    establish_connection configurations[:bizsup]
  end
end
