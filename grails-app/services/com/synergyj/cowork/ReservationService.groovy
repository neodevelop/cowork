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

class ReservationService {

    static transactional = true

    def obtainReservationDetailInMap(Long reservationId){
      def reservation = Reservation.get(reservationId)
      return (hoursAndCostInReservation(reservation) << [reservation:reservation])
    }

    def creaReservacion(ReservationCommand reservationCommand) {
      Reservation reservation = new Reservation(reservationCommand.properties)
      reservation.fechaHoraReservacion = reservationCommand.getFechaHoraInicio()
      reservation.fechaHoraTerminoDeUso = reservationCommand.getFechaHoraFin()
      def cliente = Person.get(reservationCommand.clienteId)
      if(cliente){
        reservation.cliente = cliente
      }else{
        throw new ReservationException(message: "No se encuentra el cliente...")
      }
      def workspace = Workspace.get(reservationCommand.workspaceId)
      if(workspace){
        reservation.workspace = workspace
      }else{
        throw new ReservationException(message: "No se encuentra el espacio de trabajo...")
      }
      // TODO: Corroborar que el espacio de trabajo no este ocupado previamente en las horas deseadas
      def existenReservaciones = buscaReservacionesPrevias(reservation)

      if(existenReservaciones){
        throw new ReservationException(message:"Este lugar ya esta reservado...")
      }

      // TODO: Validar que las horas entren en lo indicado por el usuario
      // TODO: Validar que se reserve por lo menos dos horas antes

      if(reservation.save()){
        return reservation
      }else{
        throw new ReservationException(message:"No se pudo realizar la reservación...",reservation: reservation)
      }

    }

    private def buscaReservacionesPrevias(Reservation reservation){
      GregorianCalendar c = new GregorianCalendar()
      c.setTime(reservation.fechaHoraReservacion)
      c.set(Calendar.HOUR,0)
      c.set(Calendar.MINUTE,0)
      c.set(Calendar.SECOND,0)
      c.set(Calendar.MILLISECOND,0)

      def criteriaReservation = Reservation.createCriteria()
      def reservaciones = criteriaReservation.list {
        eq('workspace',reservation.workspace)
        between('fechaHoraReservacion', c.time - 1 , c.time + 1)
      }

      def existenReservacionesPrevias = false

      reservaciones.each{
        //println "Validando disponibilidad..."
        if(reservation.fechaHoraReservacion.compareTo(it.fechaHoraReservacion) > 0){
          //println "Se puede reservar aun esta antes de la hora de ocupación.."
          if(reservation.fechaHoraReservacion.compareTo(it.fechaHoraTerminoDeUso) > 0){
            //println "Se puede apartar el lugar en la hora de inicio"
            if(!(reservation.fechaHoraTerminoDeUso.compareTo(it.fechaHoraTerminoDeUso) > 0)){
              //println "Se puede apartar la sala completamente"
              existenReservacionesPrevias = true
            }
          }else{
            existenReservacionesPrevias = true
          }
        }else{
          existenReservacionesPrevias = true
        }
        /*
        println "Comparamos la hora de inicio: $it.fechaHoraReservacion con $reservation.fechaHoraReservacion =>"
        println "${it.fechaHoraReservacion.compareTo(reservation.fechaHoraReservacion)}"

        println "Comparamos el rango: $it.fechaHoraReservacion con $reservation.fechaHoraTerminoDeUso =>"
        println "${it.fechaHoraReservacion.compareTo(reservation.fechaHoraTerminoDeUso)}"

        println "Comparamos la hora de termino: $it.fechaHoraTerminoDeUso con $reservation.fechaHoraTerminoDeUso =>"
        println "${it.fechaHoraTerminoDeUso.compareTo(reservation.fechaHoraTerminoDeUso)}"
        */
      }

      existenReservacionesPrevias
    }

    private def hoursAndCostInReservation(reservation){
      def horasTotalesDeUso = 0
      def costoTotalDeUso = 0

      long x = reservation.fechaHoraTerminoDeUso.time - reservation.fechaHoraReservacion.time
      def horasDeUso = x/1000/60/60
      horasTotalesDeUso += horasDeUso
      def costoDeReservacion = horasDeUso * Math.rint(reservation.workspace.costoPorHora*100)/100
      costoTotalDeUso += costoDeReservacion

      [horasDeUso:horasTotalesDeUso,costoTotal:costoTotalDeUso]
    }
}
