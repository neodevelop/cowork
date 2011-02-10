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

class ReservationIntegrationTests extends GroovyTestCase{

  def reservationService

  static transactional = false

  protected void setUp() {
    super.setUp()
  }

  protected void tearDown() {
    super.tearDown()
  }

  //Corregir esta prueba
  void _testCreaReservacion(){
    ReservationCommand command = creaReservationCommand(clienteId: 1,workspaceId: 1)
    Reservation reservation = reservationService.creaReservacion(command)
    assertNotNull reservation
    assertNotNull reservation.cliente
    assertNotNull reservation.workspace
    assertTrue reservation.id > 0
  }

  void testCreaReservacionSinCliente(){
    ReservationCommand command = creaReservationCommand(clienteId: 1000)
    shouldFail(ReservationException){
      Reservation reservation = reservationService.creaReservacion(command)
    }
  }

  void testCreaReservacionSinWorkspace(){
    ReservationCommand command = creaReservationCommand(clienteId: 1, workspaceId: 1000)
    shouldFail(ReservationException){
      Reservation reservation = reservationService.creaReservacion(command)
    }
  }

  private ReservationCommand creaReservationCommand(Map datos){
    def time1 = "10:00 AM"
    def time2 = "12:00 AM"
    def fecha = "01-01-2011"
    ReservationCommand command = new ReservationCommand(
      timeFrom:time1,
      timeTo:time2,
      fechaReservacion:fecha
    )
    command.clienteId = datos.clienteId
    command.workspaceId = datos.workspaceId
    command
  }

}
