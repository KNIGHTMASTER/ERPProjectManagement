package ProjectIntegrationManagement.DevelopProjectCharter

import grails.plugins.springsecurity.Secured
import org.springframework.dao.DataIntegrityViolationException

class BusinessCaseApprovalController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    @Secured(['ROLE_ADMIN', 'ROLE_PM'])
    def index() {
        if(session.proyek){
            redirect(action: "list", params: params)
        }else{
            redirect uri:'/chooseProject?tautan=BusinessCaseApproval'
        }
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def results
        def results2
        def results3
        def results4
        if(session.proyek){
            results = StatementOfWork.get(session.proyek)
            results2 = ProjectProposal.findByProjectName(results)
            results3 = BusinessCase.findByProjectName(results2)
            results4 = BusinessCaseApproval.findAllByProjectName(results3)
        }else{
            results4 = BusinessCaseApproval.list(params)
        }
        [businessCaseApprovalInstanceList: results4, businessCaseApprovalInstanceTotal: BusinessCaseApproval.count()]
    }

    def create() {
        [businessCaseApprovalInstance: new BusinessCaseApproval(params)]
    }

    def save() {
        def businessCaseApprovalInstance = new BusinessCaseApproval(params)
        if (!businessCaseApprovalInstance.save(flush: true)) {
            render(view: "create", model: [businessCaseApprovalInstance: businessCaseApprovalInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'businessCaseApproval.label', default: 'BusinessCaseApproval'), businessCaseApprovalInstance.id])
        redirect(action: "show", id: businessCaseApprovalInstance.id)
    }

    def show(Long id) {
        def businessCaseApprovalInstance = BusinessCaseApproval.get(id)
        if (!businessCaseApprovalInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'businessCaseApproval.label', default: 'BusinessCaseApproval'), id])
            redirect(action: "list")
            return
        }

        [businessCaseApprovalInstance: businessCaseApprovalInstance]
    }

    def edit(Long id) {
        def businessCaseApprovalInstance = BusinessCaseApproval.get(id)
        if (!businessCaseApprovalInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'businessCaseApproval.label', default: 'BusinessCaseApproval'), id])
            redirect(action: "list")
            return
        }

        [businessCaseApprovalInstance: businessCaseApprovalInstance]
    }

    def update(Long id, Long version) {
        def businessCaseApprovalInstance = BusinessCaseApproval.get(id)
        if (!businessCaseApprovalInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'businessCaseApproval.label', default: 'BusinessCaseApproval'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (businessCaseApprovalInstance.version > version) {
                businessCaseApprovalInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'businessCaseApproval.label', default: 'BusinessCaseApproval')] as Object[],
                          "Another user has updated this BusinessCaseApproval while you were editing")
                render(view: "edit", model: [businessCaseApprovalInstance: businessCaseApprovalInstance])
                return
            }
        }

        businessCaseApprovalInstance.properties = params

        if (!businessCaseApprovalInstance.save(flush: true)) {
            render(view: "edit", model: [businessCaseApprovalInstance: businessCaseApprovalInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'businessCaseApproval.label', default: 'BusinessCaseApproval'), businessCaseApprovalInstance.id])
        redirect(action: "show", id: businessCaseApprovalInstance.id)
    }

    def delete(Long id) {
        def businessCaseApprovalInstance = BusinessCaseApproval.get(id)
        if (!businessCaseApprovalInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'businessCaseApproval.label', default: 'BusinessCaseApproval'), id])
            redirect(action: "list")
            return
        }

        try {
            businessCaseApprovalInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'businessCaseApproval.label', default: 'BusinessCaseApproval'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'businessCaseApproval.label', default: 'BusinessCaseApproval'), id])
            redirect(action: "show", id: id)
        }
    }
}
