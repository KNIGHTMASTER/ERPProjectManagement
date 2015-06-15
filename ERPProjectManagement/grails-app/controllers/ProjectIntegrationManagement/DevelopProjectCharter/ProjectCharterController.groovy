package ProjectIntegrationManagement.DevelopProjectCharter

import grails.plugins.springsecurity.Secured
import org.springframework.dao.DataIntegrityViolationException

class ProjectCharterController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    @Secured(['ROLE_ADMIN', 'ROLE_PM'])
    def index() {
        if(session.proyek){
            redirect(action: "list", params: params)
        }else{
            redirect uri:'/chooseProject?tautan=ProjectCharter'
        }
    }

    def getMilestones(){
        def milestones
        if(session.proyek){
            def cari = StatementOfWork.get(session.proyek)
            milestones = Milestones.findAllByIdProject(cari)
        }else{
            milestones = Milestones.list()
        }
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def results2
        def results3
        if(session.proyek){
            def cari = StatementOfWork.get(session.proyek)
            results2 = ProjectProposal.findByProjectName(cari)
            results3 = ProjectCharter.findByProjectName(results2)
        }else{
            results3 = ProjectCharter.list(params)
        }
        [projectCharterInstanceList: results3, projectCharterInstanceTotal: ProjectCharter.count()]
    }

    def create() {
        def results2
        if(session.proyek){
            def cari = StatementOfWork.get(session.proyek)
            results2 = ProjectProposal.findByProjectName(cari)
        }else{
            results2 = ProjectProposal.list(params)
        }

        [projectCharterInstance: new ProjectCharter(params), milestones:getMilestones(), namaProyek: results2]
    }

    def save() {
        def projectCharterInstance = new ProjectCharter(params)
        if (!projectCharterInstance.save(flush: true)) {
            render(view: "create", model: [projectCharterInstance: projectCharterInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'projectCharter.label', default: 'ProjectCharter'), projectCharterInstance.id])
        redirect(action: "show", id: projectCharterInstance.id)
    }

    def show(Long id) {
        def projectCharterInstance = ProjectCharter.get(id)
        if (!projectCharterInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectCharter.label', default: 'ProjectCharter'), id])
            redirect(action: "list")
            return
        }

        [projectCharterInstance: projectCharterInstance]
    }

    def edit(Long id) {
        def projectCharterInstance = ProjectCharter.get(id)
        if (!projectCharterInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectCharter.label', default: 'ProjectCharter'), id])
            redirect(action: "list")
            return
        }

        def results2
        if(session.proyek){
            def cari = StatementOfWork.get(session.proyek)
            results2 = ProjectProposal.findByProjectName(cari)
        }else{
            results2 = ProjectProposal.list(params)
        }

        [projectCharterInstance: projectCharterInstance, milestones: getMilestones(), namaProyek: results2]
    }

    def update(Long id, Long version) {
        def projectCharterInstance = ProjectCharter.get(id)
        if (!projectCharterInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectCharter.label', default: 'ProjectCharter'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (projectCharterInstance.version > version) {
                projectCharterInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'projectCharter.label', default: 'ProjectCharter')] as Object[],
                          "Another user has updated this ProjectCharter while you were editing")
                render(view: "edit", model: [projectCharterInstance: projectCharterInstance])
                return
            }
        }

        projectCharterInstance.properties = params

        if (!projectCharterInstance.save(flush: true)) {
            render(view: "edit", model: [projectCharterInstance: projectCharterInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'projectCharter.label', default: 'ProjectCharter'), projectCharterInstance.id])
        redirect(action: "show", id: projectCharterInstance.id)
    }

    def delete(Long id) {
        def projectCharterInstance = ProjectCharter.get(id)
        if (!projectCharterInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectCharter.label', default: 'ProjectCharter'), id])
            redirect(action: "list")
            return
        }

        try {
            projectCharterInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'projectCharter.label', default: 'ProjectCharter'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'projectCharter.label', default: 'ProjectCharter'), id])
            redirect(action: "show", id: id)
        }
    }
}
