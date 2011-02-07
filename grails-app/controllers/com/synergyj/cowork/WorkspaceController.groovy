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

import grails.plugins.springsecurity.Secured

@Secured(["hasRole('ROLE_OPERATOR')"])
class WorkspaceController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [workspaceInstanceList: Workspace.list(params), workspaceInstanceTotal: Workspace.count()]
    }

    def create = {
        def workspaceInstance = new Workspace()
        workspaceInstance.properties = params
        return [workspaceInstance: workspaceInstance]
    }

    def save = {
        def workspaceInstance = new Workspace(params)
        if (workspaceInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'workspace.label', default: 'Workspace'), workspaceInstance.id])}"
            redirect(action: "show", id: workspaceInstance.id)
        }
        else {
            render(view: "create", model: [workspaceInstance: workspaceInstance])
        }
    }

    def show = {
        def workspaceInstance = Workspace.get(params.id)
        if (!workspaceInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'workspace.label', default: 'Workspace'), params.id])}"
            redirect(action: "list")
        }
        else {
            [workspaceInstance: workspaceInstance]
        }
    }

    def edit = {
        def workspaceInstance = Workspace.get(params.id)
        if (!workspaceInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'workspace.label', default: 'Workspace'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [workspaceInstance: workspaceInstance]
        }
    }

    def update = {
        def workspaceInstance = Workspace.get(params.id)
        if (workspaceInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (workspaceInstance.version > version) {
                    
                    workspaceInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'workspace.label', default: 'Workspace')] as Object[], "Another user has updated this Workspace while you were editing")
                    render(view: "edit", model: [workspaceInstance: workspaceInstance])
                    return
                }
            }
            workspaceInstance.properties = params
            if (!workspaceInstance.hasErrors() && workspaceInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'workspace.label', default: 'Workspace'), workspaceInstance.id])}"
                redirect(action: "show", id: workspaceInstance.id)
            }
            else {
                render(view: "edit", model: [workspaceInstance: workspaceInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'workspace.label', default: 'Workspace'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def workspaceInstance = Workspace.get(params.id)
        if (workspaceInstance) {
            try {
                workspaceInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'workspace.label', default: 'Workspace'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'workspace.label', default: 'Workspace'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'workspace.label', default: 'Workspace'), params.id])}"
            redirect(action: "list")
        }
    }
}
