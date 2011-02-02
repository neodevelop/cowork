/**
 * Copyright 2002-2010 SynergyJ Servicios Profesionales.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.synergyj.cowork

import grails.test.*
import com.synergyj.cowork.auth.Person

class PersonIntegrationTests extends GroovyTestCase {

  static transactional = false

  protected void setUp() {
    super.setUp()
  }

  protected void tearDown() {
    super.tearDown()
  }

  void testCreatePerson() {
    Person person = generatePerson()
    assertNotNull person
    assertNull person.id
    assertTrue person.validate()
    person.save(flush:true)
    assertNotNull person.id
  }

  void testObtainPersons(){
    def persons = Person.list()
    assertNotNull persons
  }

  private Person generatePerson(){
    def nombre = GeneradorDatos.generaNombre()
    def correo = GeneradorDatos.generaCorreo(nombre)
    Person p = new Person(
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
    return p
  }
}
