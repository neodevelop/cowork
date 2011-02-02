import com.synergyj.cowork.auth.Person
import com.synergyj.cowork.GeneradorDatos
import com.synergyj.cowork.Workspace

class BootStrap {

    def init = { servletContext ->
      if(Person.count() == 0){
        println "Creando personas de prueba"
        45.times {
          def person = generatePerson()
          person.save(flush:true)
        }
      }
      if(Workspace.count()==0){
        println "Creando espacios de prueba"
        25.times {
          def workspace = generateWorkspace()
          workspace.save(flush:true)
        }
      }
    }
    def destroy = {
    }

  private Person generatePerson(){
    def nombre = GeneradorDatos.generaNombre()
    def correo = GeneradorDatos.generaCorreo(nombre)
    Person person = new Person(
      username: correo,
      password: 'password',
      enabled: true,
      accountExpired: true,
      accountLocked: true,
      passwordExpired: true,
      nombreReal: nombre,
      apellidoPaterno: GeneradorDatos.generaApellidoPAterno(),
      apellidoMaterno: GeneradorDatos.generaApellidoMaterno(),
      razonSocial: GeneradorDatos.generaRazonSocial(),
      direccionFiscal: GeneradorDatos.generaDireccion(),
      email: correo,
      rfc:GeneradorDatos.generaRFC()
    )
    return person
  }

  private Workspace generateWorkspace(){
    Workspace workspace = new Workspace(
            nombreDeEspacio:GeneradorDatos.generaNombreDeSala(),
            direccion: GeneradorDatos.generaDireccion(),
            ubicacionInterna:GeneradorDatos.generaDireccion(),
            tamanio:new Random().nextInt(1000),
            capacidad:new Random().nextInt(100),
            costoPorHora:new Random().nextFloat() * 3500,
            ubicacion:"-34.397, 150.644"
    )
  }
}
