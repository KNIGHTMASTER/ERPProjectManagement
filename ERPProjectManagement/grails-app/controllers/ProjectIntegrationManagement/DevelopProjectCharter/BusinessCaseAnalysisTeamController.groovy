package ProjectIntegrationManagement.DevelopProjectCharter

import grails.plugins.springsecurity.Secured
import org.springframework.dao.DataIntegrityViolationException

class BusinessCaseAnalysisTeamController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    @Secured(['ROLE_ADMIN', 'ROLE_PM'])
    def index() {
        if(session.proyek){
            redirect(action: "list", params: params)
        }else{
            redirect uri:'/chooseProject?tautan=BusinessCaseAnalysisTeam'
        }
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def results2
        def results3
        def results4
        if(session.proyek){
            def cari = StatementOfWork.get(session.proyek)
            results2 = ProjectProposal.findByProjectName(cari)
            results3 = BusinessCase.findByProjectName(results2)
            results4 = BusinessCaseAnalysisTeam.findAllByProjectName(results3)
        }else{
            results4 = BusinessCaseAnalysisTeam.list(params)
        }
        [businessCaseAnalysisTeamInstanceList: results4, businessCaseAnalysisTeamInstanceTotal: BusinessCaseAnalysisTeam.count()]
    }

    def create() {
        [businessCaseAnalysisTeamInstance: new BusinessCaseAnalysisTeam(params)]
    }

    def save() {
        def businessCaseAnalysisTeamInstance = new BusinessCaseAnalysisTeam(params)
        if (!businessCaseAnalysisTeamInstance.save(flush: true)) {
            render(view: "create", model: [businessCaseAnalysisTeamInstance: businessCaseAnalysisTeamInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'businessCaseAnalysisTeam.label', default: 'BusinessCaseAnalysisTeam'), businessCaseAnalysisTeamInstance.id])
        redirect(action: "show", id: businessCaseAnalysisTeamInstance.id)
    }

    def show(Long id) {
        def businessCaseAnalysisTeamInstance = BusinessCaseAnalysisTeam.get(id)
        if (!businessCaseAnalysisTeamInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'businessCaseAnalysisTeam.label', default: 'BusinessCaseAnalysisTeam'), id])
            redirect(action: "list")
            return
        }

        [businessCaseAnalysisTeamInstance: businessCaseAnalysisTeamInstance]
    }

    def edit(Long id) {
        def businessCaseAnalysisTeamInstance = BusinessCaseAnalysisTeam.get(id)
        if (!businessCaseAnalysisTeamInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'businessCaseAnalysisTeam.label', default: 'BusinessCaseAnalysisTeam'), id])
            redirect(action: "list")
            return
        }

        [businessCaseAnalysisTeamInstance: businessCaseAnalysisTeamInstance]
    }

    def update(Long id, Long version) {
        def businessCaseAnalysisTeamInstance = BusinessCaseAnalysisTeam.get(id)
        if (!businessCaseAnalysisTeamInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'businessCaseAnalysisTeam.label', default: 'BusinessCaseAnalysisTeam'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (businessCaseAnalysisTeamInstance.version > version) {
                businessCaseAnalysisTeamInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'businessCaseAnalysisTeam.label', default: 'BusinessCaseAnalysisTeam')] as Object[],
                          "Another user has updated this BusinessCaseAnalysisTeam while you were editing")
                render(view: "edit", model: [businessCaseAnalysisTeamInstance: businessCaseAnalysisTeamInstance])
                return
            }
        }

        businessCaseAnalysisTeamInstance.properties = params

        if (!businessCaseAnalysisTeamInstance.save(flush: true)) {
            render(view: "edit", model: [businessCaseAnalysisTeamInstance: businessCaseAnalysisTeamInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'businessCaseAnalysisTeam.label', default: 'BusinessCaseAnalysisTeam'), businessCaseAnalysisTeamInstance.id])
        redirect(action: "show", id: businessCaseAnalysisTeamInstance.id)
    }

    def delete(Long id) {
        def businessCaseAnalysisTeamInstance = BusinessCaseAnalysisTeam.get(id)
        if (!businessCaseAnalysisTeamInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'businessCaseAnalysisTeam.label', default: 'BusinessCaseAnalysisTeam'), id])
            redirect(action: "list")
            return
        }

        try {
            businessCaseAnalysisTeamInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'businessCaseAnalysisTeam.label', default: 'BusinessCaseAnalysisTeam'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'businessCaseAnalysisTeam.label', default: 'BusinessCaseAnalysisTeam'), id])
            redirect(action: "show", id: id)
        }
    }
}
