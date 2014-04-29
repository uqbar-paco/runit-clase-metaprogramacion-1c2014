require 'rspec'
require '../src/r_unit_runner'
require '../fixture/un_test'
require '../fixture/un_test_vacio'
require '../fixture/un_test_con_before_each'
require '../fixture/un_test_con_after_each'

describe 'RUnit' do
  def run_and_expect(test_class, result)
    runit = RUnitRunner.new
    resultado = runit.ejecutar_test_clase test_class
    resultado.should == result
  end

  def run_all_and_expect(result, *test_class)
    runit = RUnitRunner.new
    test_class.each {|a_test_class| runit.agregar_clase a_test_class }
    resultado = runit.ejecutar
    resultado.should == result
  end

  it 'si le proveo un test vacio deberia correr bien' do
    run_and_expect UnTestVacio, true
  end

  it 'si le proveo un test que falla deberia fallar' do
    run_and_expect UnTest, false
  end

  it 'si le proveo un test que tiene un before_each lo ejecuta antes de cada test' do
    run_and_expect UnTestConBeforeEach, true
  end

  it 'si le proveo un test que tiene un after_each lo ejecuta despues de cada test' do
    run_and_expect UnTestConAfterEach, true
  end

  it 'si le paso varias clases corre los tests de todas ellas' do
    run_all_and_expect(false, UnTest, UnTestVacio, UnTestConBeforeEach)
  end
end