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
import com.synergyj.cowork.event.EventInfo
import grails.converters.JSON
import java.text.SimpleDateFormat

@Secured(['permitAll'])
class CalendarController {

    def calendarService

    def showReservations = {

    }

  
    def populateReservations = {
      def results = calendarService.obtainReservations()
      def jsonResults = wrapperEventInfo(results)
      render jsonResults as JSON
    }

  def populateReservationsByWorkspace = {
    def results = calendarService.obtainReservationsByWorkspace(Long.valueOf(params.workspaceId))
    def jsonResults = wrapperEventInfo(results)
    render jsonResults as JSON
  }

  private def wrapperEventInfo(reservations){
    def eventsInfos = []
      reservations.each {Reservation event ->
        def evento = new EventInfo(
          id:event.id,
          title:"${event.cliente.razonSocial} - ${event.workspace.nombreDeEspacio}",
                //2009-11-05T13:15:30Z
          start:event.fechaHoraReservacion,
          end:event.fechaHoraTerminoDeUso,
          url:g.createLink(controller:"workspace", action:"show", id:event.id)
        )
        eventsInfos << evento
    }
    eventsInfos
  }
}
