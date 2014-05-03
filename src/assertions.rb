module Assertions
  def assert_true(valor_obtenido)
    raise 'AssertionException' unless valor_obtenido
  end

  def assert_equals(valor_esperado, valor_obtenido)
    raise 'AssertionException' unless valor_esperado == valor_obtenido
  end
end