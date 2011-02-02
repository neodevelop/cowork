package com.synergyj.cowork

/**
 * Created by IntelliJ IDEA.
 * User: neodevelop
 * Date: 02/02/11
 * Time: 15:48
 * To change this template use File | Settings | File Templates.
 */
class WorkspaceIntegrationTests extends GroovyTestCase {
  static transactional = false

  protected void setUp() {
    super.setUp()
  }

  protected void tearDown() {
    super.tearDown()
  }

  void testCreaWorkspace(){
    Workspace workspace = generateWorkspace()
    assertNotNull workspace
    assertNull workspace.id
    assertTrue workspace.validate()
    workspace.save(flush:true)
    assertNotNull workspace.id
  }

  private Workspace generateWorkspace(){
    Workspace workspace = new Workspace(
            nombreDeEspacio:GeneradorDatos.generaNombreDeSala(),
            direccion: GeneradorDatos.generaDireccion(),
            ubicacionInterna:GeneradorDatos.generaDireccion(),
            tamanio:new Random().nextInt(1000),
            capacidad:new Random().nextInt(100),
            costoPorHora:new Random().nextFloat() * 3500 ,
            ubicacion:"-34.397, 150.644"
    )
  }
}
