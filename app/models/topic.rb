class Topic < ActiveRecord::Base
  has_many :votes, :dependent => :delete_all

  validates_presence_of :title

  def tally
    votes.count
  end
end
