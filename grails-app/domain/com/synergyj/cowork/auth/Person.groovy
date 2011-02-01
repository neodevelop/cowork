package com.synergyj.cowork.auth

class Person {

	String username
	String password
	boolean enabled
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

    // Atributos para los clientes
    String nombreReal
    String apellidoPaterno
    String apellidoMaterno
    String razonSocial
    String direccionFiscal
    String rfc
    String email

	static constraints = {
		username blank: false, unique: true
		password blank: false
        nombreReal blank:false
        apellidoPaterno blank:false
        apellidoMaterno blank:false
        razonSocial blank:false
        direccionFiscal blank:true,size:0..500
        rfc blank:false,size:10..13, matches:"(^([A-Z]{4}))(([0-9]{6}))((([A-Z]|[0-9]){3})|())"
        email email:true
	}

	static mapping = {
		password column: '`password`'
	}

	Set<Authority> getAuthorities() {
		PersonAuthority.findAllByPerson(this).collect { it.authority } as Set
	}
}
