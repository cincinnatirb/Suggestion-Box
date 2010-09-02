class Topic < ActiveRecord::Base
  has_many :votes, :dependent => :delete_all
end
