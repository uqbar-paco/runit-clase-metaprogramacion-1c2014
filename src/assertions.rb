module Assertions
  def assert_true valor
    raise 'AssertionException' unless valor
  end
end
