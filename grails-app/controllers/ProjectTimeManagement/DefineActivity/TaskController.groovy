package ProjectTimeManagement.DefineActivity

import ProjectIntegrationManagement.DevelopProjectCharter.StatementOfWork
import grails.plugins.springsecurity.Secured
import org.springframework.dao.DataIntegrityViolationException

class TaskController {
    def springSecurityService
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    @Secured(['ROLE_ADMIN','ROLE_PTM', 'ROLE_PM'])
    def index() {
        if(session.proyek){
            redirect(action: "list", params: params)
        }else{
            redirect uri:'/chooseProject'
        }
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def sesiproyek = session.proyek
        def results
        if(sesiproyek){
            def cari = StatementOfWork.get(sesiproyek)
            results = Task.findAllByIdProject(cari)
        }else{
            results = StatementOfWork.list(params)
        }
        [taskInstanceList: results, taskInstanceTotal: results.size()]
    }

    def create() {
        [taskInstance: new Task(params)]
    }

    def save() {
        def taskInstance = new Task(params)
        if (!taskInstance.save(flush: true)) {
            render(view: "create", model: [taskInstance: taskInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'task.label', default: 'Task'), taskInstance.id])
        redirect(action: "show", id: taskInstance.id)
    }

    def show(Long id) {
        def taskInstance = Task.get(id)
        if (!taskInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'task.label', default: 'Task'), id])
            redirect(action: "list")
            return
        }

        [taskInstance: taskInstance]
    }

    def edit(Long id) {
        def taskInstance = Task.get(id)
        if (!taskInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'task.label', default: 'Task'), id])
            redirect(action: "list")
            return
        }

        [taskInstance: taskInstance]
    }

    def update(Long id, Long version) {
        def taskInstance = Task.get(id)
        if (!taskInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'task.label', default: 'Task'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (taskInstance.version > version) {
                taskInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'task.label', default: 'Task')] as Object[],
                          "Another user has updated this Task while you were editing")
                render(view: "edit", model: [taskInstance: taskInstance])
                return
            }
        }

        taskInstance.properties = params

        if (!taskInstance.save(flush: true)) {
            render(view: "edit", model: [taskInstance: taskInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'task.label', default: 'Task'), taskInstance.id])
        redirect(action: "show", id: taskInstance.id)
    }

    def delete(Long id) {
        def taskInstance = Task.get(id)
        if (!taskInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'task.label', default: 'Task'), id])
            redirect(action: "list")
            return
        }

        try {
            taskInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'task.label', default: 'Task'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'task.label', default: 'Task'), id])
            redirect(action: "show", id: id)
        }
    }
}
