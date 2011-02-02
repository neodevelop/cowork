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

class ReservationController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
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
