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

class WorkspaceService {

  static transactional = true

  def obtainWorkspaceDetailInMap(Long workspaceId) {
    def map = [:]
    Workspace w = Workspace.get(workspaceId)
    map = [clients:obtainClientsInThisWorkspace(w)] << calculateRevenue(w) << [workspace:w]
    map
  }

  def obtainHoursByClientAndWorkspace(Long workspaceId,Long clienteId){
    def workspace = Workspace.get(workspaceId)
    def client = Person.get(clienteId)
    def reservations = Reservation.findAllByClienteAndWorkspace(client,workspace)
    return hoursAndCostInReservations(reservations)
  }

  private def obtainClientsInThisWorkspace(Workspace workspace){
    def reservations = Reservation.findAllByWorkspace(workspace)
    def clientesRepetidos = reservations*.cliente
    def clientesSinRepetir = []
    clientesRepetidos.each{ c ->
        def x = clientesSinRepetir.find { it.id == c.id }
        if(!x){
            clientesSinRepetir << c
        }
    }
    clientesSinRepetir
  }

  private def calculateRevenue(Workspace workspace){
    def reservations = Reservation.findAllByWorkspace(workspace)
    return hoursAndCostInReservations(reservations)
  }

  private def hoursAndCostInReservations(reservations){
    def horasTotalesDeUso = 0
    def costoTotalDeUso = 0
    reservations.each{ r ->
      long x = r.fechaHoraTerminoDeUso.time - r.fechaHoraReservacion.time
      def horasDeUso = x/1000/60/60
      horasTotalesDeUso += horasDeUso
      def costoDeReservacion = horasDeUso * Math.rint(r.workspace.costoPorHora*100)/100
      costoTotalDeUso += costoDeReservacion
    }
    [horasDeUso:horasTotalesDeUso,costoTotal:costoTotalDeUso]
  }

}
