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

class Workspace {

  String nombreDeEspacio
  String direccion
  String ubicacionInterna
  Integer tamanio // En metros cuadrados
  Integer capacidad // En personas por sala
  Float costoPorHora
  String ubicacion // En coordenadas de maps

  static constraints = {
    nombreDeEspacio blank: false
    direccion blank:false,size:0..500
    ubicacionInterna blank:true
    tamanio blank:false
    capacidad blank:false
    costoPorHora blank:false
    ubicacion blank:true
  }
}
