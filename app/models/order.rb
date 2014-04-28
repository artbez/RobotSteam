class Order < ActiveRecord::Base
  belongs_to :robot
  belongs_to :user
end
