class SptParticipants < ActiveRecord::Base
	 belongs_to :user
	 belongs_to :spt
end
