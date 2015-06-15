package ProjectIntegrationManagement.DevelopProjectCharter

import grails.plugins.springsecurity.Secured
import org.springframework.dao.DataIntegrityViolationException

class StatementOfWorkController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    @Secured(['ROLE_ADMIN', 'ROLE_PM'])
    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)

        def sesiproyek = session.proyek
        def results
        if(sesiproyek){
            results = StatementOfWork.findAllById(sesiproyek)
        }else{
            results = StatementOfWork.list(params)
        }

        [statementOfWorkInstanceList: results, statementOfWorkInstanceTotal: StatementOfWork.count(), sesi:sesiproyek]
    }

    def create() {
        [statementOfWorkInstance: new StatementOfWork(params)]
    }

    def save() {
        def statementOfWorkInstance = new StatementOfWork(params)
        if (!statementOfWorkInstance.save(flush: true)) {
            render(view: "create", model: [statementOfWorkInstance: statementOfWorkInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'statementOfWork.label', default: 'StatementOfWork'), statementOfWorkInstance.id])
        redirect(action: "show", id: statementOfWorkInstance.id)
    }

    def show(Long id) {
        def statementOfWorkInstance = StatementOfWork.get(id)
        if (!statementOfWorkInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'statementOfWork.label', default: 'StatementOfWork'), id])
            redirect(action: "list")
            return
        }

        [statementOfWorkInstance: statementOfWorkInstance]
    }

    def edit(Long id) {
        def statementOfWorkInstance = StatementOfWork.get(id)
        if (!statementOfWorkInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'statementOfWork.label', default: 'StatementOfWork'), id])
            redirect(action: "list")
            return
        }

        [statementOfWorkInstance: statementOfWorkInstance]
    }

    def update(Long id, Long version) {
        def statementOfWorkInstance = StatementOfWork.get(id)
        if (!statementOfWorkInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'statementOfWork.label', default: 'StatementOfWork'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (statementOfWorkInstance.version > version) {
                statementOfWorkInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'statementOfWork.label', default: 'StatementOfWork')] as Object[],
                          "Another user has updated this StatementOfWork while you were editing")
                render(view: "edit", model: [statementOfWorkInstance: statementOfWorkInstance])
                return
            }
        }

        statementOfWorkInstance.properties = params

        if (!statementOfWorkInstance.save(flush: true)) {
            render(view: "edit", model: [statementOfWorkInstance: statementOfWorkInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'statementOfWork.label', default: 'StatementOfWork'), statementOfWorkInstance.id])
        redirect(action: "show", id: statementOfWorkInstance.id)
    }

    def delete(Long id) {
        def statementOfWorkInstance = StatementOfWork.get(id)
        if (!statementOfWorkInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'statementOfWork.label', default: 'StatementOfWork'), id])
            redirect(action: "list")
            return
        }

        try {
            statementOfWorkInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'statementOfWork.label', default: 'StatementOfWork'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'statementOfWork.label', default: 'StatementOfWork'), id])
            redirect(action: "show", id: id)
        }
    }
}
