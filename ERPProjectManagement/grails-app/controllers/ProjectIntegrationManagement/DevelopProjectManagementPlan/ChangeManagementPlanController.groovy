package ProjectIntegrationManagement.DevelopProjectManagementPlan

import ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter
import ProjectIntegrationManagement.DevelopProjectCharter.ProjectProposal
import ProjectIntegrationManagement.DevelopProjectCharter.StatementOfWork
import grails.plugins.springsecurity.Secured
import org.springframework.dao.DataIntegrityViolationException

class ChangeManagementPlanController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    @Secured(['ROLE_ADMIN', 'ROLE_PM'])
    def index() {
        if(session.proyek){
            redirect(action: "list", params: params)
        }else{
            redirect uri:'/chooseProject?tautan=ChangeManagementPlan'
        }
    }

    def getNamaProyek(){
        def sesiproyek = session.proyek
        def results2
        def results3
        if(sesiproyek){
            def cari = StatementOfWork.get(sesiproyek)
            results2 = ProjectProposal.findByProjectName(cari)
            results3 = ProjectCharter.findByProjectName(results2)
        }else{
            results3 = ProjectCharter.list(params)
        }
        return results3
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def sesiproyek = session.proyek
        def results2
        def results3
        def results4
        if(sesiproyek){
            def cari = StatementOfWork.get(sesiproyek)
            results2 = ProjectProposal.findByProjectName(cari)
            results3 = ProjectCharter.findByProjectName(results2)
            results4 = ChangeManagementPlan.findAllByProjectName(results3)
        }else{
            results4 = ChangeManagementPlan.list(params)
        }
        [changeManagementPlanInstanceList: results4, changeManagementPlanInstanceTotal: results4.size()]
    }

    def create() {
        [changeManagementPlanInstance: new ChangeManagementPlan(params), namaProyek: getNamaProyek()]
    }

    def save() {
        def changeManagementPlanInstance = new ChangeManagementPlan(params)
        if (!changeManagementPlanInstance.save(flush: true)) {
            render(view: "create", model: [changeManagementPlanInstance: changeManagementPlanInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'changeManagementPlan.label', default: 'ChangeManagementPlan'), changeManagementPlanInstance.id])
        redirect(action: "show", id: changeManagementPlanInstance.id)
    }

    def show(Long id) {
        def changeManagementPlanInstance = ChangeManagementPlan.get(id)
        if (!changeManagementPlanInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'changeManagementPlan.label', default: 'ChangeManagementPlan'), id])
            redirect(action: "list")
            return
        }

        [changeManagementPlanInstance: changeManagementPlanInstance]
    }

    def edit(Long id) {
        def changeManagementPlanInstance = ChangeManagementPlan.get(id)
        if (!changeManagementPlanInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'changeManagementPlan.label', default: 'ChangeManagementPlan'), id])
            redirect(action: "list")
            return
        }

        [changeManagementPlanInstance: changeManagementPlanInstance, namaProyek: getNamaProyek()]
    }

    def update(Long id, Long version) {
        def changeManagementPlanInstance = ChangeManagementPlan.get(id)
        if (!changeManagementPlanInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'changeManagementPlan.label', default: 'ChangeManagementPlan'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (changeManagementPlanInstance.version > version) {
                changeManagementPlanInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'changeManagementPlan.label', default: 'ChangeManagementPlan')] as Object[],
                          "Another user has updated this ChangeManagementPlan while you were editing")
                render(view: "edit", model: [changeManagementPlanInstance: changeManagementPlanInstance])
                return
            }
        }

        changeManagementPlanInstance.properties = params

        if (!changeManagementPlanInstance.save(flush: true)) {
            render(view: "edit", model: [changeManagementPlanInstance: changeManagementPlanInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'changeManagementPlan.label', default: 'ChangeManagementPlan'), changeManagementPlanInstance.id])
        redirect(action: "show", id: changeManagementPlanInstance.id)
    }

    def delete(Long id) {
        def changeManagementPlanInstance = ChangeManagementPlan.get(id)
        if (!changeManagementPlanInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'changeManagementPlan.label', default: 'ChangeManagementPlan'), id])
            redirect(action: "list")
            return
        }

        try {
            changeManagementPlanInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'changeManagementPlan.label', default: 'ChangeManagementPlan'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'changeManagementPlan.label', default: 'ChangeManagementPlan'), id])
            redirect(action: "show", id: id)
        }
    }
}
