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

import org.codehaus.groovy.grails.plugins.springsecurity.GormUserDetailsService
import org.codehaus.groovy.grails.plugins.springsecurity.GrailsUser
import org.codehaus.groovy.grails.plugins.springsecurity.GrailsUserDetailsService
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils
import org.springframework.security.core.GrantedAuthority
import org.springframework.security.core.authority.GrantedAuthorityImpl
import org.springframework.security.core.userdetails.UserDetails
import org.springframework.security.core.userdetails.UsernameNotFoundException

class CoworkUserDetailsService extends GormUserDetailsService implements GrailsUserDetailsService {

  /**
   * Every user has the Role ROLE_USER
   */
  static final GrantedAuthorityImpl DEFAULT_ROLE = new GrantedAuthorityImpl('ROLE_USER');

  UserDetails loadUserByUsername(String username, boolean loadRoles) throws UsernameNotFoundException {
    Person.withTransaction { status ->
      def user = loadUser(username)
      Collection<GrantedAuthority> authorities = loadAuthorities(user, username, loadRoles).findAll {it != null}
      authorities << DEFAULT_ROLE
      return createUserDetails(user, authorities)
    }
  }

  UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
    loadUserByUsername username, true
  }

  protected loadUser(String username) {
    Person user = Person.findByEmail(username)
    if (!user) {
      log.warn "User not found: $username"
      throw new UsernameNotFoundException('User not found', username)
    }
    user
  }

  protected UserDetails createUserDetails(user, Collection<GrantedAuthority> authorities) {

    def conf = SpringSecurityUtils.securityConfig

    String usernamePropertyName = conf.userLookup.usernamePropertyName
    String passwordPropertyName = conf.userLookup.passwordPropertyName
    String enabledPropertyName = conf.userLookup.enabledPropertyName
    String accountExpiredPropertyName = conf.userLookup.accountExpiredPropertyName
    String accountLockedPropertyName = conf.userLookup.accountLockedPropertyName
    String passwordExpiredPropertyName = conf.userLookup.passwordExpiredPropertyName

    String username = user."$usernamePropertyName"
    String password = user."$passwordPropertyName"
    boolean enabled = enabledPropertyName ? user."$enabledPropertyName" : true
    boolean accountExpired = accountExpiredPropertyName ? user."$accountExpiredPropertyName" : false
    boolean accountLocked = accountLockedPropertyName ? user."$accountLockedPropertyName" : false
    boolean passwordExpired = passwordExpiredPropertyName ? user."$passwordExpiredPropertyName" : false

    new GrailsUser(username, password, enabled, !accountExpired, !passwordExpired,
        !accountLocked, authorities, user.id)
  }

}

