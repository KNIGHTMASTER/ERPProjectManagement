package ProjectIntegrationManagement.DevelopProjectManagementPlan

import ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter
import ProjectIntegrationManagement.DevelopProjectCharter.ProjectProposal
import ProjectIntegrationManagement.DevelopProjectCharter.StatementOfWork
import grails.plugins.springsecurity.Secured
import org.springframework.dao.DataIntegrityViolationException

class DefinitionsOfChangeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    @Secured(['ROLE_ADMIN', 'ROLE_PM'])
    def index() {
        if(session.proyek){
            redirect(action: "list", params: params)
        }else{
            redirect uri:'/chooseProject?tautan=DefinitionsOfChange'
        }
    }

    def getNamaProyek(){
        def results2
        def results3
        def results4
        if(session.proyek){
            def cari = StatementOfWork.get(session.proyek)
            results2 = ProjectProposal.findByProjectName(cari)
            results3 = ProjectCharter.findByProjectName(results2)
            results4 = ChangeManagementPlan.findByProjectName(results3)
        }else{
            results4 = ChangeManagementPlan.list(params)
        }
        return results4
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def results2
        def results3
        def results4
        def results5
        if(session.proyek){
            def cari = StatementOfWork.get(session.proyek)
            results2 = ProjectProposal.findByProjectName(cari)
            results3 = ProjectCharter.findByProjectName(results2)
            results4 = ChangeManagementPlan.findByProjectName(results3)
            results5 = DefinitionsOfChange.findAllByChangeManagementPlan(results4)
        }else{
            results5 = DefinitionsOfChange.list(params)
        }
        [definitionsOfChangeInstanceList: results5, definitionsOfChangeInstanceTotal: DefinitionsOfChange.count()]
    }

    def create() {
        [definitionsOfChangeInstance: new DefinitionsOfChange(params), namaProyek: getNamaProyek()]
    }

    def save() {
        def definitionsOfChangeInstance = new DefinitionsOfChange(params)
        if (!definitionsOfChangeInstance.save(flush: true)) {
            render(view: "create", model: [definitionsOfChangeInstance: definitionsOfChangeInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'definitionsOfChange.label', default: 'DefinitionsOfChange'), definitionsOfChangeInstance.id])
        redirect(action: "show", id: definitionsOfChangeInstance.id)
    }

    def show(Long id) {
        def definitionsOfChangeInstance = DefinitionsOfChange.get(id)
        if (!definitionsOfChangeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'definitionsOfChange.label', default: 'DefinitionsOfChange'), id])
            redirect(action: "list")
            return
        }

        [definitionsOfChangeInstance: definitionsOfChangeInstance]
    }

    def edit(Long id) {
        def definitionsOfChangeInstance = DefinitionsOfChange.get(id)
        if (!definitionsOfChangeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'definitionsOfChange.label', default: 'DefinitionsOfChange'), id])
            redirect(action: "list")
            return
        }

        [definitionsOfChangeInstance: definitionsOfChangeInstance, namaProyek: getNamaProyek()]
    }

    def update(Long id, Long version) {
        def definitionsOfChangeInstance = DefinitionsOfChange.get(id)
        if (!definitionsOfChangeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'definitionsOfChange.label', default: 'DefinitionsOfChange'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (definitionsOfChangeInstance.version > version) {
                definitionsOfChangeInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'definitionsOfChange.label', default: 'DefinitionsOfChange')] as Object[],
                          "Another user has updated this DefinitionsOfChange while you were editing")
                render(view: "edit", model: [definitionsOfChangeInstance: definitionsOfChangeInstance])
                return
            }
        }

        definitionsOfChangeInstance.properties = params

        if (!definitionsOfChangeInstance.save(flush: true)) {
            render(view: "edit", model: [definitionsOfChangeInstance: definitionsOfChangeInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'definitionsOfChange.label', default: 'DefinitionsOfChange'), definitionsOfChangeInstance.id])
        redirect(action: "show", id: definitionsOfChangeInstance.id)
    }

    def delete(Long id) {
        def definitionsOfChangeInstance = DefinitionsOfChange.get(id)
        if (!definitionsOfChangeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'definitionsOfChange.label', default: 'DefinitionsOfChange'), id])
            redirect(action: "list")
            return
        }

        try {
            definitionsOfChangeInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'definitionsOfChange.label', default: 'DefinitionsOfChange'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'definitionsOfChange.label', default: 'DefinitionsOfChange'), id])
            redirect(action: "show", id: id)
        }
    }
}
