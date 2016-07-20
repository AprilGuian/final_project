class User < ApplicationRecord
	
  enum role: {voter: 0, admin: 1}
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :voter
  end

  has_many :votes, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	
	#def did_vote?(candidate)
  #  similar_votes = votes.select { |vote| vote.candidate == candidate }
  #  similar_votes.size > 0
  #end

	def full_name
  		"#{self.first_name} #{self.last_name}"
  	end
end
