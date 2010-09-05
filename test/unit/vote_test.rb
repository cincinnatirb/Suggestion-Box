require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  should belong_to(:topic)
end
