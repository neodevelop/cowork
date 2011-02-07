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
      // TODO: Validar que las horas entren en lo indicado por el usuario
      // TODO: Corroborar que el espacio de trabajo no este ocupado previamente en las horas deseadas
      if(reservation.save()){
        return reservation
      }else{
        throw new ReservationException(message:"No se pudo realizar la reservación...",reservation: reservation)
      }
    }
}
