class Position < ApplicationRecord
	has_many :candidates, dependent: :destroy
  	accepts_nested_attributes_for :candidates
 	validates :name, presence: true, uniqueness: {case_sensitive: false}
end
