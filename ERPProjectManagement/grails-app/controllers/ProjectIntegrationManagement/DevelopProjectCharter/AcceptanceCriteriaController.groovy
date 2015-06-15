package ProjectIntegrationManagement.DevelopProjectCharter

import grails.plugins.springsecurity.Secured
import org.springframework.dao.DataIntegrityViolationException

class AcceptanceCriteriaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    @Secured(['ROLE_ADMIN', 'ROLE_PM'])
    def index() {
        if(session.proyek){
            redirect(action: "list", params: params)
        }else{
            redirect uri:'/chooseProject?tautan=AcceptanceCriteria'
        }
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def sesiproyek = session.proyek
        def results
        if(sesiproyek){
            def cari = StatementOfWork.get(sesiproyek)
            results = AcceptanceCriteria.findAllByProjectName(cari)
        }else{
            results = AcceptanceCriteria.list(params)
        }
        [acceptanceCriteriaInstanceList: results, acceptanceCriteriaInstanceTotal: AcceptanceCriteria.count()]
    }

    def create() {
        [acceptanceCriteriaInstance: new AcceptanceCriteria(params)]
    }

    def save() {
        def acceptanceCriteriaInstance = new AcceptanceCriteria(params)
        if (!acceptanceCriteriaInstance.save(flush: true)) {
            render(view: "create", model: [acceptanceCriteriaInstance: acceptanceCriteriaInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'acceptanceCriteria.label', default: 'AcceptanceCriteria'), acceptanceCriteriaInstance.id])
        redirect(action: "show", id: acceptanceCriteriaInstance.id)
    }

    def show(Long id) {
        def acceptanceCriteriaInstance = AcceptanceCriteria.get(id)
        if (!acceptanceCriteriaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'acceptanceCriteria.label', default: 'AcceptanceCriteria'), id])
            redirect(action: "list")
            return
        }

        [acceptanceCriteriaInstance: acceptanceCriteriaInstance]
    }

    def edit(Long id) {
        def acceptanceCriteriaInstance = AcceptanceCriteria.get(id)
        if (!acceptanceCriteriaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'acceptanceCriteria.label', default: 'AcceptanceCriteria'), id])
            redirect(action: "list")
            return
        }

        [acceptanceCriteriaInstance: acceptanceCriteriaInstance]
    }

    def update(Long id, Long version) {
        def acceptanceCriteriaInstance = AcceptanceCriteria.get(id)
        if (!acceptanceCriteriaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'acceptanceCriteria.label', default: 'AcceptanceCriteria'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (acceptanceCriteriaInstance.version > version) {
                acceptanceCriteriaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'acceptanceCriteria.label', default: 'AcceptanceCriteria')] as Object[],
                          "Another user has updated this AcceptanceCriteria while you were editing")
                render(view: "edit", model: [acceptanceCriteriaInstance: acceptanceCriteriaInstance])
                return
            }
        }

        acceptanceCriteriaInstance.properties = params

        if (!acceptanceCriteriaInstance.save(flush: true)) {
            render(view: "edit", model: [acceptanceCriteriaInstance: acceptanceCriteriaInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'acceptanceCriteria.label', default: 'AcceptanceCriteria'), acceptanceCriteriaInstance.id])
        redirect(action: "show", id: acceptanceCriteriaInstance.id)
    }

    def delete(Long id) {
        def acceptanceCriteriaInstance = AcceptanceCriteria.get(id)
        if (!acceptanceCriteriaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'acceptanceCriteria.label', default: 'AcceptanceCriteria'), id])
            redirect(action: "list")
            return
        }

        try {
            acceptanceCriteriaInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'acceptanceCriteria.label', default: 'AcceptanceCriteria'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'acceptanceCriteria.label', default: 'AcceptanceCriteria'), id])
            redirect(action: "show", id: id)
        }
    }
}
