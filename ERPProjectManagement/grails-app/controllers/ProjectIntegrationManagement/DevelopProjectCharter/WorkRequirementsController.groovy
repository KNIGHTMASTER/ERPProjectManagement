package ProjectIntegrationManagement.DevelopProjectCharter

import grails.plugins.springsecurity.Secured
import org.springframework.dao.DataIntegrityViolationException

class WorkRequirementsController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    @Secured(['ROLE_ADMIN', 'ROLE_PM'])
    def index() {
        if(session.proyek){
            redirect(action: "list", params: params)
        }else{
            redirect uri:'/chooseProject?tautan=WorkRequirements'
        }
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)

        def sesiproyek = session.proyek
        def results
        if(sesiproyek){
            def cari = StatementOfWork.get(sesiproyek)
            results = WorkRequirements.findAllByProjectName(cari)
        }else{
            results = WorkRequirements.list(params)
        }

        [workRequirementsInstanceList: results, workRequirementsInstanceTotal: WorkRequirements.count()]
    }

    def create() {
        [workRequirementsInstance: new WorkRequirements(params)]
    }

    def save() {
        def workRequirementsInstance = new WorkRequirements(params)
        if (!workRequirementsInstance.save(flush: true)) {
            render(view: "create", model: [workRequirementsInstance: workRequirementsInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'workRequirements.label', default: 'WorkRequirements'), workRequirementsInstance.id])
        redirect(action: "show", id: workRequirementsInstance.id)
    }

    def show(Long id) {
        def workRequirementsInstance = WorkRequirements.get(id)
        if (!workRequirementsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'workRequirements.label', default: 'WorkRequirements'), id])
            redirect(action: "list")
            return
        }

        [workRequirementsInstance: workRequirementsInstance]
    }

    def edit(Long id) {
        def workRequirementsInstance = WorkRequirements.get(id)
        if (!workRequirementsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'workRequirements.label', default: 'WorkRequirements'), id])
            redirect(action: "list")
            return
        }

        [workRequirementsInstance: workRequirementsInstance]
    }

    def update(Long id, Long version) {
        def workRequirementsInstance = WorkRequirements.get(id)
        if (!workRequirementsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'workRequirements.label', default: 'WorkRequirements'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (workRequirementsInstance.version > version) {
                workRequirementsInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'workRequirements.label', default: 'WorkRequirements')] as Object[],
                          "Another user has updated this WorkRequirements while you were editing")
                render(view: "edit", model: [workRequirementsInstance: workRequirementsInstance])
                return
            }
        }

        workRequirementsInstance.properties = params

        if (!workRequirementsInstance.save(flush: true)) {
            render(view: "edit", model: [workRequirementsInstance: workRequirementsInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'workRequirements.label', default: 'WorkRequirements'), workRequirementsInstance.id])
        redirect(action: "show", id: workRequirementsInstance.id)
    }

    def delete(Long id) {
        def workRequirementsInstance = WorkRequirements.get(id)
        if (!workRequirementsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'workRequirements.label', default: 'WorkRequirements'), id])
            redirect(action: "list")
            return
        }

        try {
            workRequirementsInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'workRequirements.label', default: 'WorkRequirements'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'workRequirements.label', default: 'WorkRequirements'), id])
            redirect(action: "show", id: id)
        }
    }
}
