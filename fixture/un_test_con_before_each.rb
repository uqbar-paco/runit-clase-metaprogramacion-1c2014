class UnTestConBeforeEach
  def before_each
    @valor = 3
  end

  def test_valida_valor_igual_a_cuatro
    @valor = @valor + 1
    assert_true @valor == 4
  end

  def test_valida_valor_igual_a_cinco
    @valor = @valor + 2
    assert_true @valor == 5
  end
end