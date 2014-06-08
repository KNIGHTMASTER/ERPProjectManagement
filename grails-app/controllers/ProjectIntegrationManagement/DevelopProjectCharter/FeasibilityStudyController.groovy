package ProjectIntegrationManagement.DevelopProjectCharter

import grails.plugins.springsecurity.Secured
import org.springframework.dao.DataIntegrityViolationException

class FeasibilityStudyController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    @Secured(['ROLE_ADMIN', 'ROLE_PM'])
    def index() {
        if(session.proyek){
            redirect(action: "list", params: params)
        }else{
            redirect uri:'/chooseProject?tautan=FeasibilityStudy'
        }
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def results
        def results2
        def results3
        if(session.proyek){
            results = StatementOfWork.get(session.proyek)
            results2 = ProjectProposal.findByProjectName(results)
            results3 = FeasibilityStudy.findByProjectName(results2)
        }else{
            results3 = FeasibilityStudy.list(params)
        }
        [feasibilityStudyInstanceList: results3, feasibilityStudyInstanceTotal: FeasibilityStudy.count()]
    }

    def create() {
        [feasibilityStudyInstance: new FeasibilityStudy(params)]
    }

    def save() {
        def feasibilityStudyInstance = new FeasibilityStudy(params)
        if (!feasibilityStudyInstance.save(flush: true)) {
            render(view: "create", model: [feasibilityStudyInstance: feasibilityStudyInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'feasibilityStudy.label', default: 'FeasibilityStudy'), feasibilityStudyInstance.id])
        redirect(action: "show", id: feasibilityStudyInstance.id)
    }

    def show(Long id) {
        def feasibilityStudyInstance = FeasibilityStudy.get(id)
        if (!feasibilityStudyInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'feasibilityStudy.label', default: 'FeasibilityStudy'), id])
            redirect(action: "list")
            return
        }

        [feasibilityStudyInstance: feasibilityStudyInstance]
    }

    def edit(Long id) {
        def feasibilityStudyInstance = FeasibilityStudy.get(id)
        if (!feasibilityStudyInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'feasibilityStudy.label', default: 'FeasibilityStudy'), id])
            redirect(action: "list")
            return
        }

        [feasibilityStudyInstance: feasibilityStudyInstance]
    }

    def update(Long id, Long version) {
        def feasibilityStudyInstance = FeasibilityStudy.get(id)
        if (!feasibilityStudyInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'feasibilityStudy.label', default: 'FeasibilityStudy'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (feasibilityStudyInstance.version > version) {
                feasibilityStudyInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'feasibilityStudy.label', default: 'FeasibilityStudy')] as Object[],
                          "Another user has updated this FeasibilityStudy while you were editing")
                render(view: "edit", model: [feasibilityStudyInstance: feasibilityStudyInstance])
                return
            }
        }

        feasibilityStudyInstance.properties = params

        if (!feasibilityStudyInstance.save(flush: true)) {
            render(view: "edit", model: [feasibilityStudyInstance: feasibilityStudyInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'feasibilityStudy.label', default: 'FeasibilityStudy'), feasibilityStudyInstance.id])
        redirect(action: "show", id: feasibilityStudyInstance.id)
    }

    def delete(Long id) {
        def feasibilityStudyInstance = FeasibilityStudy.get(id)
        if (!feasibilityStudyInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'feasibilityStudy.label', default: 'FeasibilityStudy'), id])
            redirect(action: "list")
            return
        }

        try {
            feasibilityStudyInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'feasibilityStudy.label', default: 'FeasibilityStudy'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'feasibilityStudy.label', default: 'FeasibilityStudy'), id])
            redirect(action: "show", id: id)
        }
    }
}
