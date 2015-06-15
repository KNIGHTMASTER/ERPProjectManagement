package ProjectIntegrationManagement.DevelopProjectCharter

import grails.plugins.springsecurity.Secured
import org.springframework.dao.DataIntegrityViolationException

class ProjectInformationController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    @Secured(['ROLE_ADMIN', 'ROLE_PM'])
    def index() {
        if(session.proyek){
            redirect(action: "list", params: params)
        }else{
            redirect uri:'/chooseProject?tautan=ProjectInformation'
        }
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def results2
        def results3
        if(session.proyek){
            def cari = StatementOfWork.get(session.proyek)
            results2 = ProjectProposal.findByProjectName(cari)
            results3 = ProjectInformation.findByProjectName(results2)
        }else{
            results3 = ProjectInformation.list(params)
        }
        [projectInformationInstanceList: results3, projectInformationInstanceTotal: ProjectInformation.count()]
    }

    def create() {
        [projectInformationInstance: new ProjectInformation(params)]
    }

    def save() {
        def projectInformationInstance = new ProjectInformation(params)
        if (!projectInformationInstance.save(flush: true)) {
            render(view: "create", model: [projectInformationInstance: projectInformationInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'projectInformation.label', default: 'ProjectInformation'), projectInformationInstance.id])
        redirect(action: "show", id: projectInformationInstance.id)
    }

    def show(Long id) {
        def projectInformationInstance = ProjectInformation.get(id)
        if (!projectInformationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectInformation.label', default: 'ProjectInformation'), id])
            redirect(action: "list")
            return
        }

        [projectInformationInstance: projectInformationInstance]
    }

    def edit(Long id) {
        def projectInformationInstance = ProjectInformation.get(id)
        if (!projectInformationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectInformation.label', default: 'ProjectInformation'), id])
            redirect(action: "list")
            return
        }

        [projectInformationInstance: projectInformationInstance]
    }

    def update(Long id, Long version) {
        def projectInformationInstance = ProjectInformation.get(id)
        if (!projectInformationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectInformation.label', default: 'ProjectInformation'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (projectInformationInstance.version > version) {
                projectInformationInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'projectInformation.label', default: 'ProjectInformation')] as Object[],
                          "Another user has updated this ProjectInformation while you were editing")
                render(view: "edit", model: [projectInformationInstance: projectInformationInstance])
                return
            }
        }

        projectInformationInstance.properties = params

        if (!projectInformationInstance.save(flush: true)) {
            render(view: "edit", model: [projectInformationInstance: projectInformationInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'projectInformation.label', default: 'ProjectInformation'), projectInformationInstance.id])
        redirect(action: "show", id: projectInformationInstance.id)
    }

    def delete(Long id) {
        def projectInformationInstance = ProjectInformation.get(id)
        if (!projectInformationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectInformation.label', default: 'ProjectInformation'), id])
            redirect(action: "list")
            return
        }

        try {
            projectInformationInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'projectInformation.label', default: 'ProjectInformation'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'projectInformation.label', default: 'ProjectInformation'), id])
            redirect(action: "show", id: id)
        }
    }
}
