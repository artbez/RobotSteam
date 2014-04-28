class Robot < ActiveRecord::Base
	has_many :orders
	belongs_to :user
	validates :name, presence: true
end
