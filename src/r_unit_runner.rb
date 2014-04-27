require '../src/assertions'

class RUnitRunner
  def agregar_clase clase_test
    @clases_test = @clases_test || []
    @clases_test << clase_test
  end

  def ejecutar
    @clases_test.each { |clase_test|
      begin
        self.ejecutar_test_clase clase_test
      rescue
        return false
      end
    }
    return true
  end

  def ejecutar_test_clase clase_test
    tests = clase_test.instance_methods(false)
      .find_all { |method| method.to_s.start_with? 'test_' }
    tests.each { |test| self.ejecutar_test_metodo test, clase_test }
  end

  def ejecutar_test_metodo test, clase_test
    instancia_test = clase_test.new
    instancia_test.singleton_class.send :include, Assertions
    instancia_test.before_each if instancia_test.respond_to? :before_each
    instancia_test.send test
  end
end