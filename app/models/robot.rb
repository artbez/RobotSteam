class Robot < ActiveRecord::Base
	validates :name, presence: true
end
