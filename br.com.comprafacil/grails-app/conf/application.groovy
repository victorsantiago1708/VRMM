

// Added by the Spring Security Core plugin:
grails.plugin.springsecurity.userLookup.userDomainClassName = 'br.com.Usuario'
grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'br.com.UsuarioRole'
grails.plugin.springsecurity.authority.className = 'br.com.Role'
grails.plugin.springsecurity.controllerAnnotations.staticRules = [
	[pattern: '/registraUsuario/cadastrar', access: ['permitAll']],
	[pattern: '/registraUsuario/index', access: ['ROLE_ADMIN']],
	[pattern: '/login/auth',     access: ['permitAll']],
	[pattern: '/produto/**',     access: ['ROLE_ADMIN']],
	[pattern: '/cotacao/**',     access: ['ROLE_ADMIN']],
	[pattern: '/usuario/**',     access: ['ROLE_ADMIN']],
	[pattern: '/error',          access: ['permitAll']],
	[pattern: '/index',          access: ['ROLE_ADMIN']],
	[pattern: '/index.gsp',      access: ['permitAll']],
	[pattern: '/shutdown',       access: ['permitAll']],
	[pattern: '/assets/**',      access: ['permitAll']],
	[pattern: '/**/js/**',       access: ['permitAll']],
	[pattern: '/**/css/**',      access: ['permitAll']],
	[pattern: '/**/images/**',   access: ['permitAll']],
	[pattern: '/**/favicon.ico', access: ['permitAll']],
	[pattern: '/fabricante/**',  access: ['permitAll']],
]

grails.plugin.springsecurity.filterChain.chainMap = [
	[pattern: '/assets/**',      filters: 'none'],
	[pattern: '/**/js/**',       filters: 'none'],
	[pattern: '/**/css/**',      filters: 'none'],
	[pattern: '/**/images/**',   filters: 'none'],
	[pattern: '/**/favicon.ico', filters: 'none'],
	[pattern: '/**',             filters: 'JOINED_FILTERS']
]

