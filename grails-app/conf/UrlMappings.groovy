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
        "/createClient"{
          controller = 'person'
          action = 'create'
        }
        "/saveClient"{
          controller = 'person'
          action = 'save'
        }
        "/showClient/$id"{
          controller = 'person'
          action = 'show'
        }
        "/updateClient/$id"{
          controller = 'person'
          action = 'update'
        }
        "/listClients"{
          controller = "person"
          action = "list"
        }
		"500"(view:'/error')
	}
}
