require 'test_helper'

class TopicTest < ActiveSupport::TestCase
  should have_many(:votes).dependent(:delete_all)
end
