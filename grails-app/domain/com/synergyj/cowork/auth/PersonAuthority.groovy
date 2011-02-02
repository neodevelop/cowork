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
package com.synergyj.cowork.auth

import org.apache.commons.lang.builder.HashCodeBuilder

class PersonAuthority implements Serializable {

	Person person
	Authority authority

	boolean equals(other) {
		if (!(other instanceof PersonAuthority)) {
			return false
		}

		other.person?.id == person?.id &&
			other.authority?.id == authority?.id
	}

	int hashCode() {
		def builder = new HashCodeBuilder()
		if (person) builder.append(person.id)
		if (authority) builder.append(authority.id)
		builder.toHashCode()
	}

	static PersonAuthority get(long personId, long authorityId) {
		find 'from PersonAuthority where person.id=:personId and authority.id=:authorityId',
			[personId: personId, authorityId: authorityId]
	}

	static PersonAuthority create(Person person, Authority authority, boolean flush = false) {
		new PersonAuthority(person: person, authority: authority).save(flush: flush, insert: true)
	}

	static boolean remove(Person person, Authority authority, boolean flush = false) {
		PersonAuthority instance = PersonAuthority.findByPersonAndAuthority(person, authority)
		instance ? instance.delete(flush: flush) : false
	}

	static void removeAll(Person person) {
		executeUpdate 'DELETE FROM PersonAuthority WHERE person=:person', [person: person]
	}

	static void removeAll(Authority authority) {
		executeUpdate 'DELETE FROM PersonAuthority WHERE authority=:authority', [authority: authority]
	}

	static mapping = {
		id composite: ['authority', 'person']
		version false
	}
}
