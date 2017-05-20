package br.com

import grails.plugin.springsecurity.SpringSecurityUtils
import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString

@EqualsAndHashCode(includes='username')
@ToString(includes='username', includeNames=true, includePackage=false)
class Usuario implements Serializable {

	private static final long serialVersionUID = 1

	transient springSecurityService

	String fullname
	String username
	String password
	Arquivo avatar
	boolean enabled = true
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

	Set<Role> getAuthorities() {
		UsuarioRole.findAllByUsuario(this)*.role
	}

	static Boolean hasAcesso(Role role){
		Boolean result = false
		List rolesDoUsuario = SpringSecurityUtils.getPrincipalAuthorities()
		rolesDoUsuario?.each{
			String roleUser = it.toString()
			if(roleUser == role.authority){
				result = true
			}
		}
		return result
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		//if (isDirty('password')) {
		encodePassword()
		//}
	}

	protected void encodePassword() {
		println("password $password")
		password = springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(password) : password
		println("password $password")
	}

	static transients = ['springSecurityService']

	static constraints = {
		password blank: false, password: true
		username blank: false, unique: true
		avatar nullable: true
		fullname nullable: true
	}

	static mapping = {
		password column: '`password`'
	}
}
