module Assertions
  def assert_true valor
    raise 'AssertionException' unless valor
  end

  def assert_equals expected, actual
    raise 'AssertionException' unless expected == actual
  end
end
