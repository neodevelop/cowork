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

class GeneradorDatos {

  private static nombres = ["Juan", "Pedro", "Maria",
          "Alejandro", "Francisco", "Luis", "Juan Miguel", "Adolfo",
          "Maribel", "Ana"]

  private static apellidosPaternos = ["Aguirre",
          "Pantoja", "Ramirez", "Zavala", "Benitez", "Carmona", "Hinojosa",
          "Jimenez", "Fernandez", "Romero"]

  private static apellidosMaternos = ["Betancourt",
          "Paniagua", "Rosales", "Zamora", "Basilio", "Corona", "Jasso",
          "Martinez", "Gutierrez", "Uribe"]

  private static nombresDeDominio = ["access.redhawk.org", "b.barracudacentral.org", "bl.csma.biz",
          "bl.emailbasura.org", "bl.spamcannibal.org", "bl.spamcop.net", "bl.technovision.dk",
          "blackholes.five-ten-sg.com", "blackholes.wirehub.net", "blacklist.sci.kun.nl",
          "block.dnsbl.sorbs.net", "blocked.hilli.dk", "cart00ney.surriel.com", "cbl.abuseat.org",
          "dev.null.dk", "dialup.blacklist.jippg.org", "dialups.mail-abuse.org", "dialups.visi.com",
          "dnsbl.ahbl.org", "dnsbl.antispam.or.id", "dnsbl.cyberlogic.net", "dnsbl.kempt.net",
          "dnsbl.njabl.org", "dnsbl.sorbs.net", "dnsbl-1.uceprotect.net", "dnsbl-2.uceprotect.net",
          "dnsbl-3.uceprotect.net", "duinv.aupads.org", "dul.dnsbl.sorbs.net", "dul.ru",
          "escalations.dnsbl.sorbs.net", "fl.chickenboner.biz", "hil.habeas.com", "http.dnsbl.sorbs.net",
          "intruders.docs.uu.se", "korea.services.net", "mail-abuse.blacklist.jippg.org", "misc.dnsbl.sorbs.net",
          "msgid.bl.gweep.ca", "new.dnsbl.sorbs.net", "no-more-funn.moensted.dk", "old.dnsbl.sorbs.net",
          "pbl.spamhaus.org", "proxy.bl.gweep.ca", "psbl.surriel.com", "pss.spambusters.org.ar",
          "rbl.schulte.org", "rbl.snark.net", "recent.dnsbl.sorbs.net", "relays.bl.gweep.ca",
          "relays.bl.kundenserver.de", "relays.mail-abuse.org", "relays.nether.net",
          "rsbl.aupads.org", "sbl.spamhaus.org", "smtp.dnsbl.sorbs.net", "socks.dnsbl.sorbs.net",
          "spam.dnsbl.sorbs.net", "spam.olsentech.net", "spamguard.leadmon.net",
          "spamsources.fabel.dk", "tor.ahbl.org", "web.dnsbl.sorbs.net", "whois.rfc-ignorant.org",
          "will-spam-for-food.eu.org", "xbl.spamhaus.org", "zen.spamhaus.org", "zombie.dnsbl.sorbs.net", "bl.tiopan.com"]

  private static razonesSociales = ["MONDICE", "POLYDOR", "WOCEPT", "TIDEDOX", "RETRES", "AUTODICAL",
          "NEDTOLA", "POLYLOOD", "ESTHATH", "MUDTRA", "MEDICT", "SAURIO", "TANKANT", "TENEBOR", "CECILON"]

  private static direccion  = """Lorem ipsum dolor sit amet, consectetur adipiscing elit.
  Ut in dolor condimentum ligula tempor facilisis. Donec blandit facilisis sapien nec semper.
  Sed nibh mauris, semper nec ultricies ac, dapibus ut elit. Morbi lorem metus, vehicula id feugiat quis,
  vulputate ut urna. Integer ante lectus, ultrices vitae pulvinar nec, sagittis et nisl. Donec sagittis,
  massa vel mollis laoreet, erat mauris accumsan lacus, a convallis risus massa id velit. Integer vel dui
  leo. Integer at tempor sapien. Nullam tristique feugiat orci eu convallis. Phasellus lobortis convallis
  risus, sit amet sagittis nisi feugiat ac. Aenean vulputate auctor risus, vel vulputate dui porttitor vel.
  Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Phasellus bibendum
  bibendum vestibulum. Sed nisl dui, fermentum ac commodo non, luctus quis urna. Cum sociis natoque penatibus
  et magnis dis parturient montes, nascetur ridiculus mus. Pellentesque et elit orci. Duis quam dolor, congue
  id mollis id, tristique vel massa. Nunc sem sapien, fringilla id accumsan adipiscing, posuere et tellus. """

  private static nombreDeSalas = ["Acamapichtli: Puñado de carrizos","Acatl: Carrizo, caña, junco. Rojo.","Acatzin: Pequeño carrizo",
          "Acaualxochitl: Flor arrojada por el agua","Acoatl: Serpiente de agua","Ahuizotl: Mamífero acuático","Alotl: Fuacamaya",
          "Ameyal: Manantial","Ameyaltzin: Pequeño manantial","Anáhuac: Ribera u orilla del agua","Aquetzalli: Agua preciosa","Atl: Agua",
          "Atlacatl: Marinero","Atlanxochitl: La más bella flor del mar","Atototzin: Agua convertida en ave","Atzin: Agua venerable",
          "Auachtli: Rocío","Axayacatl: Rostro de agua","Ayauhtli: Niebla","Azcatl: Hormiga","Aztlan: Blancura","Ceyaotl: Uno guerrero",
          "Cihuatl: Mujer","Cihuacoatl: Mujer serpiente","Cihuapipiltzin: Mujer honrada","Cihuateopixqui: Mujer sacerdotisa",
          "Cihuaxochitl: Mujer flor","Cinteotl: madre del maíz","Cipactli: Caimán","Citlalcóatl: Serpiente de estrellas",
          "Citlalinicue: Falda de estrellas","Citlalli/Citlalin: Estrella. Luna","Citlalmina: Flecha de las estrellas (meteoros)",
          "Citlaltonac: Estrella resplandeciente","Citlaltzin: Estrellita","Citlaxóchitl: Estrella que se convirtio en flor",
          "Cóatl: Serpiente","Coatlaxopeuh (Guadalupe): Aguila que aplastó a la serpiente","Coatlicue: Falda de serpientes",
          "Coatzin: Pequeña serpiente","Coyolli: Cascabel","Coyoltzin: Pequeño cascabel","Coyolxauhqui: Señora de los cascabeles (Luna)",
          "Cozcaapa: Agua de piedras preciosas","Cuauhcihuatl: Mujer águila","Cuauhtémoc: Bajada del águila, águila descendente",
          "Cuauhtleco: Águila que asciende","Cuauhtli: Águila","Cuauhtzin: Águila venerable","Cuetlaxochitl: Flor de río","Cuicacani: Cantor",
          "Cuicatl: Canción","Chalchiuitl: Flor de fuego","Chimalma: Escudo yacente","Chalchiuitl: Flor de fuego",
          "Chalchiuhtlicue: Falda de jade","Chalchiuxóchitl: Turquesa convertida en flor","Chicomecoatl: Siete serpientes",
          "Chichilkuali: Águila roja","Chimalcóatl: Escudo de serpientes","Chimalli: Escudo","Chimalma: Escudo yacente","Ehécatl: Viento",
          "Hiuhtonal: Luz preciosa","Huitzillin: Colibrí","Huitzilihuitl: Pluma de colibrí",
          "Huitzilopochtli: Colibrí izquierdo, colibrí del sur","Ilhuicamina: Flechador del cielo","Ilhuicóatl: Serpiente celeste",
          "Ilhuitemoc: El que desciende del cielo","Ilhuitl: Cielo","Imacatlezohtzin: La que ofrece mucho cariño","Ixcatzin: Como algodón",
          "Ixtlixóchitl: Cara de flor","Ixualxochiotl: Planta de muchas flores","Izel: Única","Itzmin: Trueno","Itzpapálotl: Mariposa negra",
          "Itzcoatl: Serpiente negra","Itzcuauhtli: Águila blanca","Iztacoyotl: Coyote blanco","Iztapapalotl: Mariposa blanca",
          "Iztaxóchitl: Flor blanca","Iztlacihuatl: Mujer blanca","Iztli: Obsidiana, negrita","Macuilxochitl: Cinco flores","Malinalli: Hierba",
          "Malinaltzin: Hierbecita","Malinalxóchitl: Flor de malinalli","Matlalcóatl: Serpiente-venado","Maxóchitl: Ramo de flores",
          "Mayahuel: La de la planta del maguey","Mazacoatl: Serpiente-venado","Mazatzin: Venadito","Metztli/Mextli: Luna",
          "Mexitli/Mexi: Liebre de aloe","Miquiztli: Reposo, quietud, muerte","Mixcoatl: Serpiente de nube","Mixtli: Nube","Mixtle: Nube oscura",
          "Miztli: Puma","Motecuhzoma (Moctezuma): Tu señor enojado","Moyolehuani: Enamorado","Nahui: Cuatro, cuarto",
          "Necucyaotl: Guerrero por ambos lados","Nelli: Verdad","Nezahualcóyotl: Coyote que ayuna","Nezahualpilli: Niño que ayuna. El jefe hambriento",
          "Nicté: Flor","Noxochicoztli: Collar de flores","Ocatlana: Piedra que gira","Ocelocóatl: Ocelote-serpiente",
          "Ocelotl: Jaguar, ocelote","Ohtonqui: Caminante","Omecatl: Dos juncos","Olontetl: Piedra que gira","Ollin: Movimiento",
          "Opochtli: El de la mano izquierda","Painalli/Painal: Mensajero, el de los pies muy rápidos","Papalotl: Mariposa",
          "Papantzi: Señora mariposa","Pelaxilla: Copo de algodón","Quecholli: Flamenco, flamingo","Quecholliquetzal: El flamenco más bello",
          "Quetzal: Pluma hermosa","Quetzalcóatl: Serpiente emplumada","Quetzalli: Preciosa","Quetzalxilotl: Primoroso jilote",
          "Quetzalzin: Pequeña bella","Quiahuitl: Lluvia","Quiahuitzin: Lluviecita","Tecolotl: Búho","Tecpalotl: Guacamaya de pedernal",
          "Tecpatl: Pedernal","Teotl: Energía, dios","Teoxihuitl: Turquesa divina, preciosa","Tepeyolotl: Corazón de los montes",
          "Tepiltzin: Hijo privilegiado","Tepochtli: Joven guerrero","Tezcatl: Espejo","Tezcatlipoca: Espejo que humea",
          "Tezolpiliyolotl: Corazón muy dulce","Tizitl: Médico","Tlacaelel: El que levanta el ánimo, persona diligente",
          "Tlahcuilo: Pintor, escritor","Tlanextic: Luz poniente","Tlanextli: Brillo, radiante, esplendor","Tlayolohtli: Corazón de tierra",
          "Tlazohtlaloni: Hombre, forma masculina","Tlazohtzin: Quien es amado","Tlecóatl: Serpiente de fuego","Tlecuauhtli: Águila de fuego",
          "Tlexochitl: Flor de fuego","Tleyotl: Corazón de fuego","Tzilmiztli: Puma negro","Tzitzitlini: Campanitas. Flor","Tochtli: Conejo",
          "Tonahuac: Único de la luz, posesiva","Tonalli: Energía, día, calor","Tonalna: Madre de la luz","Tonantzi: Nuestra madrecita",
          "Tonatiuh: Sol, el luminoso, el que calienta","Topiltzin: Nuestro niñito, nuestro príncipe","Ueman: Venerable tiempo",
          "Uetzcayotl: Esencia de la luz","Xalaquia: La que está vestida de arena","Xicohtencatl: Jicote enfurecido",
          "Xihuitl: Cometa","Xilonen: Mazorca de maíz","Xiuhcóatl: Serpiente de fuego, serpiente turquesa","Xiuhuitl: Turquesa",
          "Xiuhxochitl: Flor turquesa","Xocoyotzin: El más pequeño","Xochicóatl: Serpiente florida","Xochicotzin: Pequeño collar de flores",
          "Xochilpilli/Xochipilli: Hijo de las flores, príncipe u origen de las flores","Xochiltlanezi: Flor de la alborada",
          "Xochiquetzal: La más preciosa flor. Plumaje de flor","Xochiquiahuitl: Lluvia florida","Xóchitl/Xóchil: Flor",
          "Xochiyetl: Flor de tabaco","Xochiyotl: Corazón de la gentil flor","Xólotl: Venus. Gemelo","Yaocihuatl: Mujer guerrera",
          "Yaotl: Enemigo, guerrero","Yaretzi: Siempre serás amada","Yohual/Yohualli: Noche","Yohualticitl: Señora de la noche",
          "Yohualtzin: Nochecita","Yolcaut: Serpiente cascabel","Yolihuani: Fuente de vida","Yólotl/Yolyo: Corazón","Yolotzin: Corazonzito",
          "Yoloxochitl: Corazón de flor","Yoltzin: Pequeño corazón","Yolyamanitzin: Persona considerada","Zeltzin: Delicada. Primera hija",
          "Zipactonal: Luz armónica","Zyanya: Siempre, eterna"]

  private static letters = "ABCDEFGHIJKRLMNOPQRSTUVWXYZ"

  static generaNombre(){
    nombres.get(new Random().nextInt(nombres.size()))
  }

  static generaApellidoPAterno(){
    apellidosPaternos.get(new Random().nextInt(apellidosPaternos.size()))
  }

  static generaApellidoMaterno(){
    apellidosMaternos.get(new Random().nextInt(apellidosMaternos.size()))
  }

  static generaRazonSocial(){
    razonesSociales.get(new Random().nextInt(razonesSociales.size()))
  }

  static generaNombreDeSala(){
    nombreDeSalas.get(new Random().nextInt(nombreDeSalas.size()))
  }

  static generaCorreo(nombre="anonymous"){
    if(nombre != "anonymous")
      nombre = nombre.replace(' ','.')
    nombre + "@" +nombresDeDominio.get(new Random().nextInt(nombresDeDominio.size()))
  }

  static generaDireccion(){
    def separador = direccion.split(' ')
    def palabras = []
    separador.each{ palabras << it }
    def miDireccion = []
    10.times{
      miDireccion << palabras.get(new Random().nextInt(palabras.size())).trim()
    }
    miDireccion.join(' ')
  }

  static generaRFC(lucky=false){
    def rfc = ""
    4.times{
      rfc += letters.charAt(new Random().nextInt(letters.size()))
    }
    6.times{
      rfc += new Random().nextInt(9)
    }
    rfc
  }

}