package com.synergyj.cowork

class CalendarService {

    static transactional = false

    def obtainReservations() {
      def reservations = Reservation.list()
      reservations
    }
}