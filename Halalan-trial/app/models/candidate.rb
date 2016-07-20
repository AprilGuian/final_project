class Candidate < ApplicationRecord
  belongs_to :position
  has_many :votes, dependent: :destroy
  accepts_nested_attributes_for :votes

  validates :last_name, presence: true
  validates :first_name, presence: true

  def full_name
    "#{ self.first_name } #{ self.last_name }"
  end

  #def male_votes
  #  votes.select { |vote| vote.user.gender == 'male' }
  #end

  #def female_votes
  #  votes.select { |vote| vote.user.gender == 'female' }
  #end
end
