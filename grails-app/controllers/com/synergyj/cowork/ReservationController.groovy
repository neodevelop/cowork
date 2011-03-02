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

import com.synergyj.cowork.auth.Person
import grails.plugins.springsecurity.Secured
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils

@Secured(["hasRole('ROLE_OPERATOR')"])
class ReservationController {

    def reservationService
    def springSecurityService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    @Secured(["hasRole('ROLE_OPERATOR') or hasRole('ROLE_USER')"])
    def choose = {
      ReservationCommand reservationCommand = new ReservationCommand()
      [reservationCommand:reservationCommand]
    }

    @Secured(["hasRole('ROLE_OPERATOR') or hasRole('ROLE_USER')"])
    def prepare = { ReservationCommand reservationCommand ->
      def reservation
      if(!SpringSecurityUtils.ifAllGranted('ROLE_OPERATOR')) {
	     reservationCommand.clienteId = springSecurityService.principal.id
      }
      if(reservationCommand.validate()){
        try{
          reservation = reservationService.creaReservacion(reservationCommand)
          render view:"show",model:[reservationInstance:reservation]
        }catch(ReservationException e){
          flash.message = "${e.message}"
          render view: "choose",model:[reservationCommand:reservationCommand]
        }
      }else{
       render view: "choose",model:[reservationCommand:reservationCommand]
      }
    }

    def searchClients = {
      def clienteQuery = params.clientquery
      def criteria = Person.createCriteria()
      def listClient = criteria.list {
        or{
          like "razonSocial","%${clienteQuery}%"
          like "rfc","%${clienteQuery}%"
          like "email","%${clienteQuery}%"
        }
      }
      render(template: "../person/clientSimpleList",model: [listClient:listClient])
    }

    @Secured(["hasRole('ROLE_OPERATOR') or hasRole('ROLE_USER')"])
    def searchWorkspaces = {
      def workspacequery = params.workspacequery
      def criteria = Workspace.createCriteria()
      def listWorkspace = criteria.list {
        or{
          like "nombreDeEspacio","%${workspacequery}%"
          like "direccion","%${workspacequery}%"
        }
      }
      render(template: "../workspace/workspaceSimpleList",model: [listWorkspace:listWorkspace])
    }

    @Secured(["hasRole('ROLE_USER')"])
    def showByClient = {
      def principal = springSecurityService.principal
      def person = Person.get(principal.id)
      def reservations = Reservation.findAllByCliente(person)
      [reservations:reservations]
    }

    @Secured(["hasRole('ROLE_USER')"])
    def showShortInfo = {
      def reservationInfo = reservationService.obtainReservationDetailInMap(Long.valueOf(params.id))
      render template: 'shortInfo',model:reservationInfo
    }

    @Secured(["hasRole('ROLE_USER')"])
    def confirm = {
      def reservation = Reservation.get(Long.valueOf(params.id))
      reservation.confirmado = true
      //Crear el estado de cuenta si es que existiera esa entidad....
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [reservationInstanceList: Reservation.list(params), reservationInstanceTotal: Reservation.count()]
    }

    def create = {
        def reservationInstance = new Reservation()
        reservationInstance.properties = params
        return [reservationInstance: reservationInstance]
    }

    def save = {
        def reservationInstance = new Reservation(params)
        if (reservationInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'reservation.label', default: 'Reservation'), reservationInstance.id])}"
            redirect(action: "show", id: reservationInstance.id)
        }
        else {
            render(view: "create", model: [reservationInstance: reservationInstance])
        }
    }

    def show = {
        def reservationInstance = Reservation.get(params.id)
        if (!reservationInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'reservation.label', default: 'Reservation'), params.id])}"
            redirect(action: "list")
        }
        else {
            [reservationInstance: reservationInstance]
        }
    }

    def edit = {
        def reservationInstance = Reservation.get(params.id)
        if (!reservationInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'reservation.label', default: 'Reservation'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [reservationInstance: reservationInstance]
        }
    }

    def update = {
        def reservationInstance = Reservation.get(params.id)
        if (reservationInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (reservationInstance.version > version) {
                    
                    reservationInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'reservation.label', default: 'Reservation')] as Object[], "Another user has updated this Reservation while you were editing")
                    render(view: "edit", model: [reservationInstance: reservationInstance])
                    return
                }
            }
            reservationInstance.properties = params
            if (!reservationInstance.hasErrors() && reservationInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'reservation.label', default: 'Reservation'), reservationInstance.id])}"
                redirect(action: "show", id: reservationInstance.id)
            }
            else {
                render(view: "edit", model: [reservationInstance: reservationInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'reservation.label', default: 'Reservation'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def reservationInstance = Reservation.get(params.id)
        if (reservationInstance) {
            try {
                reservationInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'reservation.label', default: 'Reservation'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'reservation.label', default: 'Reservation'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'reservation.label', default: 'Reservation'), params.id])}"
            redirect(action: "list")
        }
    }
}
