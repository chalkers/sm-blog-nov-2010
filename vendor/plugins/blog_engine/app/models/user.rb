class User < ActiveRecord::Base
  include Clearance::User
  include Gravatarable
end
