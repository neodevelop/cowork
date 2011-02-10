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

import java.text.SimpleDateFormat

class ReservationCommand {

  Long workspaceId
  Long clienteId

  String fechaReservacion

  String timeFrom = "7:00 AM"
  String timeTo = "8:00 AM"

  private SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy hh:mm a")

  static constraints = {
    workspaceId nullable:false
    //clienteId nullable:false
    fechaReservacion nullable:false
    timeFrom blsnk:false
    timeTo blank:false
  }

  Date buildFechaHoraInicio(){
    dateFormat.parse(this.fechaReservacion + " " + this.timeFrom)
  }

  Date buildFechaHoraFin(){
    dateFormat.parse(this.fechaReservacion + " " + this.timeTo)
  }
}
