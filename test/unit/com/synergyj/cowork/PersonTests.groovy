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

import grails.test.GrailsUnitTestCase
import com.synergyj.cowork.auth.Person

class PersonTests extends GrailsUnitTestCase{
  void setUp(){
    super.setUp()
    mockForConstraintsTests(Person)
  }
  void tearDown(){
    super.tearDown()
  }

  void testRfcConstraint(){

    def person = new Person(username: 'neodevelop',
            password: 'password',
            enabled: true,
            accountExpired: true,
            accountLocked: true,
            passwordExpired: true,
            nombreReal: 'José Juan',
            apellidoPaterno: 'Reyes',
            apellidoMaterno: 'Zuñiga',
            razonSocial: 'SynergyJ.com',
            direccionFiscal: 'Calle conocida sin numero colonia Escondida',
            email: 'neodevelop@gmail.com'
    )

    assertFalse person.validate()
    assertEquals "nullable",person.errors.rfc

    person.rfc = ""
    assertFalse person.validate()
    assertEquals "blank",person.errors.rfc

    person.rfc = "123456789"
    assertFalse person.validate()
    assertEquals "size",person.errors.rfc

    person.rfc = "1234567890"
    assertFalse person.validate()
    assertEquals "matches",person.errors.rfc

    person.rfc = "REZJ840425"
    assertTrue person.validate()

    person.rfc = "REZJ840425JX7"
    assertTrue person.validate()
  }
}
