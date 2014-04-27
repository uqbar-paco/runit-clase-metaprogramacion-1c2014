require 'rspec'
require '../src/r_unit_runner'
require '../fixture/un_test'
require '../fixture/un_test_vacio'
require '../fixture/un_test_con_before_each'

describe 'RUnit' do

  it 'si le proveo un test vacio deberia correr bien' do
    runit = RUnitRunner.new
    runit.agregar_clase UnTestVacio
    resultado = runit.ejecutar
    resultado.should == true
  end

  it 'si le proveo un test que falla deberia fallar' do
    runit = RUnitRunner.new
    runit.agregar_clase UnTest
    resultado = runit.ejecutar
    resultado.should == false
  end

  it 'si le proveo un test que tiene un before_each lo ejecuta antes de cada test' do
    runit = RUnitRunner.new
    runit.agregar_clase UnTestConBeforeEach
    resultado = runit.ejecutar
    resultado.should == true
  end
end