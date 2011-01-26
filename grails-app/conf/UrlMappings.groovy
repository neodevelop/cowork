class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		name home: '/' {
	      controller = 'content'
	      action = 'home'
	    }
		name content: "/$id" {
	      controller = 'content'
	      action = 'content'
	    }
		"500"(view:'/error')
	}
}
