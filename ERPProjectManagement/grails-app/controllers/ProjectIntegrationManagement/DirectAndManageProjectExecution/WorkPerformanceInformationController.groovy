package ProjectIntegrationManagement.DirectAndManageProjectExecution

import org.springframework.dao.DataIntegrityViolationException

class WorkPerformanceInformationController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        if(session.proyek){
            redirect(action: "list", params: params)
        }else{
            redirect uri:'/chooseProject?tautan=WorkPerformanceInformation'
        }
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [workPerformanceInformationInstanceList: WorkPerformanceInformation.list(params), workPerformanceInformationInstanceTotal: WorkPerformanceInformation.count()]
    }

    def create() {
        [workPerformanceInformationInstance: new WorkPerformanceInformation(params)]
    }

    def save() {
        def workPerformanceInformationInstance = new WorkPerformanceInformation(params)
        if (!workPerformanceInformationInstance.save(flush: true)) {
            render(view: "create", model: [workPerformanceInformationInstance: workPerformanceInformationInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'workPerformanceInformation.label', default: 'WorkPerformanceInformation'), workPerformanceInformationInstance.id])
        redirect(action: "show", id: workPerformanceInformationInstance.id)
    }

    def show(Long id) {
        def workPerformanceInformationInstance = WorkPerformanceInformation.get(id)
        if (!workPerformanceInformationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'workPerformanceInformation.label', default: 'WorkPerformanceInformation'), id])
            redirect(action: "list")
            return
        }

        [workPerformanceInformationInstance: workPerformanceInformationInstance]
    }

    def edit(Long id) {
        def workPerformanceInformationInstance = WorkPerformanceInformation.get(id)
        if (!workPerformanceInformationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'workPerformanceInformation.label', default: 'WorkPerformanceInformation'), id])
            redirect(action: "list")
            return
        }

        [workPerformanceInformationInstance: workPerformanceInformationInstance]
    }

    def update(Long id, Long version) {
        def workPerformanceInformationInstance = WorkPerformanceInformation.get(id)
        if (!workPerformanceInformationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'workPerformanceInformation.label', default: 'WorkPerformanceInformation'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (workPerformanceInformationInstance.version > version) {
                workPerformanceInformationInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'workPerformanceInformation.label', default: 'WorkPerformanceInformation')] as Object[],
                          "Another user has updated this WorkPerformanceInformation while you were editing")
                render(view: "edit", model: [workPerformanceInformationInstance: workPerformanceInformationInstance])
                return
            }
        }

        workPerformanceInformationInstance.properties = params

        if (!workPerformanceInformationInstance.save(flush: true)) {
            render(view: "edit", model: [workPerformanceInformationInstance: workPerformanceInformationInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'workPerformanceInformation.label', default: 'WorkPerformanceInformation'), workPerformanceInformationInstance.id])
        redirect(action: "show", id: workPerformanceInformationInstance.id)
    }

    def delete(Long id) {
        def workPerformanceInformationInstance = WorkPerformanceInformation.get(id)
        if (!workPerformanceInformationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'workPerformanceInformation.label', default: 'WorkPerformanceInformation'), id])
            redirect(action: "list")
            return
        }

        try {
            workPerformanceInformationInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'workPerformanceInformation.label', default: 'WorkPerformanceInformation'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'workPerformanceInformation.label', default: 'WorkPerformanceInformation'), id])
            redirect(action: "show", id: id)
        }
    }
}
