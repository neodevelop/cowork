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

import grails.plugins.springsecurity.Secured
import com.synergyj.cowork.auth.Person
import com.synergyj.cowork.auth.Authority
import com.synergyj.cowork.auth.PersonAuthority

@Secured(['permitAll'])
class RegisterController {
  def springSecurityService

  def form = {
    render view: 'signupForm', model: ['personInstance': new Person()]
  }
  def createAccount = {
    def personInstance = new Person(params)
    // Asignamos las propiedades faltantes
    personInstance.accountExpired = false
    personInstance.accountLocked = false
    personInstance.enabled = true
    personInstance.password = springSecurityService.encodePassword(params.password, params.email)
    if (personInstance.save(flush: true)) {
      flash.message = "${message(code: 'default.created.message', args: [message(code: 'person.label', default: 'Cliente'), personInstance.razonSocial])}"

      if (params.operator) {
        def operador = Authority.findByAuthority('ROLE_OPERATOR')
        PersonAuthority.create(personInstance, operador, true)
      }
      redirect(action: "home", controller: 'content')
    }
    else {
      render(view: "signupForm", model: [personInstance: personInstance])
    }
  }
}
