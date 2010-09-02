class Topic < ActiveRecord::Base
  has_many :votes, :dependent => :delete_all

  def tally
    votes.count
  end
end
