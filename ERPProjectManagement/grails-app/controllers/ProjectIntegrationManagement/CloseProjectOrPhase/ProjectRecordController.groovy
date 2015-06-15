package ProjectIntegrationManagement.CloseProjectOrPhase

import grails.plugins.springsecurity.Secured
import org.springframework.dao.DataIntegrityViolationException

class ProjectRecordController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    @Secured(['ROLE_ADMIN', 'ROLE_PM'])
    def index() {
        if(session.proyek){
            redirect(action: "list", params: params)
        }else{
            redirect uri:'/chooseProject?tautan=ProjectRecord'
        }
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [projectRecordInstanceList: ProjectRecord.list(params), projectRecordInstanceTotal: ProjectRecord.count()]
    }

    def create() {
        [projectRecordInstance: new ProjectRecord(params)]
    }

    def save() {
        def projectRecordInstance = new ProjectRecord(params)
        if (!projectRecordInstance.save(flush: true)) {
            render(view: "create", model: [projectRecordInstance: projectRecordInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'projectRecord.label', default: 'ProjectRecord'), projectRecordInstance.id])
        redirect(action: "show", id: projectRecordInstance.id)
    }

    def show(Long id) {
        def projectRecordInstance = ProjectRecord.get(id)
        if (!projectRecordInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectRecord.label', default: 'ProjectRecord'), id])
            redirect(action: "list")
            return
        }

        [projectRecordInstance: projectRecordInstance]
    }

    def edit(Long id) {
        def projectRecordInstance = ProjectRecord.get(id)
        if (!projectRecordInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectRecord.label', default: 'ProjectRecord'), id])
            redirect(action: "list")
            return
        }

        [projectRecordInstance: projectRecordInstance]
    }

    def update(Long id, Long version) {
        def projectRecordInstance = ProjectRecord.get(id)
        if (!projectRecordInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectRecord.label', default: 'ProjectRecord'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (projectRecordInstance.version > version) {
                projectRecordInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'projectRecord.label', default: 'ProjectRecord')] as Object[],
                          "Another user has updated this ProjectRecord while you were editing")
                render(view: "edit", model: [projectRecordInstance: projectRecordInstance])
                return
            }
        }

        projectRecordInstance.properties = params

        if (!projectRecordInstance.save(flush: true)) {
            render(view: "edit", model: [projectRecordInstance: projectRecordInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'projectRecord.label', default: 'ProjectRecord'), projectRecordInstance.id])
        redirect(action: "show", id: projectRecordInstance.id)
    }

    def delete(Long id) {
        def projectRecordInstance = ProjectRecord.get(id)
        if (!projectRecordInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectRecord.label', default: 'ProjectRecord'), id])
            redirect(action: "list")
            return
        }

        try {
            projectRecordInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'projectRecord.label', default: 'ProjectRecord'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'projectRecord.label', default: 'ProjectRecord'), id])
            redirect(action: "show", id: id)
        }
    }
}
