require '../src/assertions'

class RUnitRunner
  def agregar_clase(clase_test)
    @clases_test = @clases_test || []
    @clases_test << clase_test
  end

  def ejecutar
    # Retorna true si todos los tests pasan
    @clases_test.all? { |clase_test|
        self.ejecutar_test_clase clase_test
    }
  end

  def ejecutar_test_clase(clase_test)
    begin
      tests = clase_test.instance_methods(false)
        .find_all { |method| method.to_s.start_with? 'test_' }
      tests.each { |test| self.ejecutar_test_metodo test, clase_test }
    rescue
      return false
    end
    # Retorna true si no hubo excepciones
    true
  end

  def safe_send(instance, method_name)
    instance.send(method_name) if instance.respond_to? method_name
  end

  def ejecutar_test_metodo(metodo_test, clase_test)
    instancia_test = clase_test.new
    instancia_test.singleton_class.send :include, Assertions
    safe_send(instancia_test, :before_each)
    instancia_test.send metodo_test
    safe_send(instancia_test, :after_each)
  end
end