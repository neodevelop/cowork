import com.synergyj.cowork.auth.Person
import com.synergyj.cowork.GeneradorDatos
import com.synergyj.cowork.Workspace
import com.synergyj.cowork.auth.Authority
import com.synergyj.cowork.auth.PersonAuthority
import grails.converters.JSON
import com.synergyj.cowork.Reservation

class BootStrap {
  def springSecurityService
    def init = { servletContext ->
      JSON.registerObjectMarshaller(Date) {
         return it?.format("yyyy-MM-dd'T'HH:mm:ss'Z'")
      }
      if(Authority.count() == 0) {
        println "Creando roles"
        def operator = new Authority(authority:'ROLE_OPERATOR')
        operator.save(flush:true)
        def user = new Authority(authority:'ROLE_USER')
        user.save(flush:true)
      }
      /*def operatorRole = Authority.findByAuthority('ROLE_OPERATOR')
      if(Person.count() == 0){
        println "Creando personas de prueba"
        5.times {
          def person = generatePerson()
          person.save(flush:true)
          PersonAuthority.create(person, operatorRole, true)
        }
      }
      if(Workspace.count()==0){
        println "Creando espacios de prueba"
        25.times {
          def workspace = generateWorkspace()
          workspace.save(flush:true)
        }
      }
      if(Reservation.count() == 0){
        100.times {
          def reservation = generateReservation()
          reservation.save(flush:true)
        }
      }*/
    }
    def destroy = {
    }

  private Person generatePerson(){
    def nombre = GeneradorDatos.generaNombre()
    def correo = GeneradorDatos.generaCorreo(nombre)
    println "user: ${correo}"
    Person person = new Person(
      password: springSecurityService.encodePassword('password', correo),
      enabled: true,
      accountExpired: false,
      accountLocked: false,
      passwordExpired: false,
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

  private Reservation generateReservation(){
    def wa = Workspace.count()
    def ca = Person.count()
    Reservation r = new Reservation(
        workspace:Workspace.get(new Random().nextInt(wa)),
        cliente:Person.get(new Random().nextInt(ca)),
    )
    def calendar = new GregorianCalendar()
    calendar.set(Calendar.DATE,new Random().nextInt(28))
    calendar.set(Calendar.HOUR,new Random().nextInt(24))
    calendar.set(Calendar.MINUTE,0)
    calendar.set(Calendar.SECOND,0)
    r.fechaHoraReservacion = calendar.time
    def toAdd = new Random().nextInt(8)
    calendar.add(Calendar.HOUR,(toAdd ?: 1))
    r.fechaHoraTerminoDeUso = calendar.time
    r
  }
}
