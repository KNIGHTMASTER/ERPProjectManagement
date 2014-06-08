package ProjectIntegrationManagement.DevelopProjectCharter

import grails.plugins.springsecurity.Secured
import org.springframework.dao.DataIntegrityViolationException

class BusinessCaseController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    @Secured(['ROLE_ADMIN', 'ROLE_PM'])
    def index() {
        if(session.proyek){
            redirect(action: "list", params: params)
        }else{
            redirect uri:'/chooseProject?tautan=BusinessCase'
        }
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def sesiproyek = session.proyek
        def results
        //def results2 = []
        def results2
        def results3
        if(sesiproyek){
            //results = BusinessCase.executeQuery("select bc from BusinessCase bc where bc.projectName in (select pp.id from ProjectProposal pp where pp.projectName in (select sow.id from StatementOfWork sow where sow.id="+sesiproyek+"))")
            results = StatementOfWork.get(sesiproyek)
            /*results = results.projectProposals
            results.each{
                results2.addAll(it.businessCases)
            }*/
            results2 = ProjectProposal.findByProjectName(results)
            results3 = BusinessCase.findByProjectName(results2)
        }else{
            results3 = BusinessCase.list(params)
        }
        [businessCaseInstanceList: results3, businessCaseInstanceTotal: BusinessCase.count()]
    }

    def create() {
        [businessCaseInstance: new BusinessCase(params)]
    }

    def save() {
        def businessCaseInstance = new BusinessCase(params)
        if (!businessCaseInstance.save(flush: true)) {
            render(view: "create", model: [businessCaseInstance: businessCaseInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'businessCase.label', default: 'BusinessCase'), businessCaseInstance.id])
        redirect(action: "show", id: businessCaseInstance.id)
    }

    def show(Long id) {
        def businessCaseInstance = BusinessCase.get(id)
        if (!businessCaseInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'businessCase.label', default: 'BusinessCase'), id])
            redirect(action: "list")
            return
        }

        [businessCaseInstance: businessCaseInstance]
    }

    def edit(Long id) {
        def businessCaseInstance = BusinessCase.get(id)
        if (!businessCaseInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'businessCase.label', default: 'BusinessCase'), id])
            redirect(action: "list")
            return
        }

        [businessCaseInstance: businessCaseInstance]
    }

    def update(Long id, Long version) {
        def businessCaseInstance = BusinessCase.get(id)
        if (!businessCaseInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'businessCase.label', default: 'BusinessCase'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (businessCaseInstance.version > version) {
                businessCaseInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'businessCase.label', default: 'BusinessCase')] as Object[],
                          "Another user has updated this BusinessCase while you were editing")
                render(view: "edit", model: [businessCaseInstance: businessCaseInstance])
                return
            }
        }

        businessCaseInstance.properties = params

        if (!businessCaseInstance.save(flush: true)) {
            render(view: "edit", model: [businessCaseInstance: businessCaseInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'businessCase.label', default: 'BusinessCase'), businessCaseInstance.id])
        redirect(action: "show", id: businessCaseInstance.id)
    }

    def delete(Long id) {
        def businessCaseInstance = BusinessCase.get(id)
        if (!businessCaseInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'businessCase.label', default: 'BusinessCase'), id])
            redirect(action: "list")
            return
        }

        try {
            businessCaseInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'businessCase.label', default: 'BusinessCase'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'businessCase.label', default: 'BusinessCase'), id])
            redirect(action: "show", id: id)
        }
    }
}
