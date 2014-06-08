package ProjectIntegrationManagement.DevelopProjectCharter

import grails.plugins.springsecurity.Secured
import org.springframework.dao.DataIntegrityViolationException

class StatementOfWorkApprovalController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    @Secured(['ROLE_PM', 'ROLE_ADMIN'])
    def index() {
        if(session.proyek){
            redirect(action: "list", params: params)
        }else{
            redirect uri:'/chooseProject?tautan=StatementOfWorkApproval'
        }
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def sesiproyek = session.proyek
        def results
        if(sesiproyek){
            def cari = StatementOfWork.get(sesiproyek)
            results = StatementOfWorkApproval.findAllByStatementOfWork(cari)
        }else{
            results = StatementOfWorkApproval.list(params)
        }

        [statementOfWorkApprovalInstanceList: results, statementOfWorkApprovalInstanceTotal: StatementOfWorkApproval.count()]
    }

    def create() {
        [statementOfWorkApprovalInstance: new StatementOfWorkApproval(params)]
    }

    def save() {
        def statementOfWorkApprovalInstance = new StatementOfWorkApproval(params)
        if (!statementOfWorkApprovalInstance.save(flush: true)) {
            render(view: "create", model: [statementOfWorkApprovalInstance: statementOfWorkApprovalInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'statementOfWorkApproval.label', default: 'StatementOfWorkApproval'), statementOfWorkApprovalInstance.id])
        redirect(action: "show", id: statementOfWorkApprovalInstance.id)
    }

    def show(Long id) {
        def statementOfWorkApprovalInstance = StatementOfWorkApproval.get(id)
        if (!statementOfWorkApprovalInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'statementOfWorkApproval.label', default: 'StatementOfWorkApproval'), id])
            redirect(action: "list")
            return
        }

        [statementOfWorkApprovalInstance: statementOfWorkApprovalInstance]
    }

    def edit(Long id) {
        def statementOfWorkApprovalInstance = StatementOfWorkApproval.get(id)
        if (!statementOfWorkApprovalInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'statementOfWorkApproval.label', default: 'StatementOfWorkApproval'), id])
            redirect(action: "list")
            return
        }

        [statementOfWorkApprovalInstance: statementOfWorkApprovalInstance]
    }

    def update(Long id, Long version) {
        def statementOfWorkApprovalInstance = StatementOfWorkApproval.get(id)
        if (!statementOfWorkApprovalInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'statementOfWorkApproval.label', default: 'StatementOfWorkApproval'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (statementOfWorkApprovalInstance.version > version) {
                statementOfWorkApprovalInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'statementOfWorkApproval.label', default: 'StatementOfWorkApproval')] as Object[],
                          "Another user has updated this StatementOfWorkApproval while you were editing")
                render(view: "edit", model: [statementOfWorkApprovalInstance: statementOfWorkApprovalInstance])
                return
            }
        }

        statementOfWorkApprovalInstance.properties = params

        if (!statementOfWorkApprovalInstance.save(flush: true)) {
            render(view: "edit", model: [statementOfWorkApprovalInstance: statementOfWorkApprovalInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'statementOfWorkApproval.label', default: 'StatementOfWorkApproval'), statementOfWorkApprovalInstance.id])
        redirect(action: "show", id: statementOfWorkApprovalInstance.id)
    }

    def delete(Long id) {
        def statementOfWorkApprovalInstance = StatementOfWorkApproval.get(id)
        if (!statementOfWorkApprovalInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'statementOfWorkApproval.label', default: 'StatementOfWorkApproval'), id])
            redirect(action: "list")
            return
        }

        try {
            statementOfWorkApprovalInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'statementOfWorkApproval.label', default: 'StatementOfWorkApproval'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'statementOfWorkApproval.label', default: 'StatementOfWorkApproval'), id])
            redirect(action: "show", id: id)
        }
    }
}
