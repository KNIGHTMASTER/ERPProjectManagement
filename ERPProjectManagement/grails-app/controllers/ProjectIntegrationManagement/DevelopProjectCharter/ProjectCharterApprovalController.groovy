package ProjectIntegrationManagement.DevelopProjectCharter


import grails.plugins.springsecurity.Secured
import org.springframework.dao.DataIntegrityViolationException

class ProjectCharterApprovalController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    @Secured(['ROLE_ADMIN', 'ROLE_PM'])
    def index() {
        if(session.proyek){
            redirect(action: "list", params: params)
        }else{
            redirect uri:'/chooseProject?tautan=ProjectCharterApproval'
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
            results3 = ProjectCharter.findByProjectName(results2)
            results4 = ProjectCharterApproval.findAllByProjectCharter(results3)
        }else{
            results4 = ProjectCharterApproval.list(params)
        }        
        [projectCharterApprovalInstanceList: results4, projectCharterApprovalInstanceTotal: ProjectCharterApproval.count()]
    }

    def getNamaProyekCharter(){
        def charter
        if(session.proyek){
            def sow = StatementOfWork.get(session.proyek)
            def proposal = ProjectProposal.findByProjectName(sow)
            charter = ProjectCharter.findByProjectName(proposal)
        }else{
            charter = ProjectCharter.list()
        }
        return charter
    }

    def getNamaProyekProposal(){
        def proposal
        if(session.proyek){
            def sow = StatementOfWork.get(session.proyek)
            proposal = ProjectProposal.findByProjectName(sow)
        }else{
            proposal = ProjectProposal.list()
        }
        return proposal
    }

    def getStakeholder(){
        def stakeholder
        if(session.proyek){
            def sow = StatementOfWork.get(session.proyek)
            stakeholder = StakeholderRegister.findAllByProjectName(sow)
        }else{
            stakeholder = StakeholderRegister.list()
        }
        return stakeholder
    }

    def create() {
        if(session.proyek){
            [projectCharterApprovalInstance: new ProjectCharterApproval(params), charter: getNamaProyekCharter(), proposal: getNamaProyekProposal(), stakeholder:getStakeholder()]
        }else{
            [projectCharterApprovalInstance: new ProjectCharterApproval(params)]
        }
    }

    def save() {
        def projectCharterApprovalInstance = new ProjectCharterApproval(params)
        if (!projectCharterApprovalInstance.save(flush: true)) {
            render(view: "create", model: [projectCharterApprovalInstance: projectCharterApprovalInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'projectCharterApproval.label', default: 'ProjectCharterApproval'), projectCharterApprovalInstance.id])
        redirect(action: "show", id: projectCharterApprovalInstance.id)
    }

    def show(Long id) {
        def projectCharterApprovalInstance = ProjectCharterApproval.get(id)
        if (!projectCharterApprovalInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectCharterApproval.label', default: 'ProjectCharterApproval'), id])
            redirect(action: "list")
            return
        }

        [projectCharterApprovalInstance: projectCharterApprovalInstance]
    }

    def edit(Long id) {
        def projectCharterApprovalInstance = ProjectCharterApproval.get(id)
        if (!projectCharterApprovalInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectCharterApproval.label', default: 'ProjectCharterApproval'), id])
            redirect(action: "list")
            return
        }

        if(session.proyek){
            [projectCharterApprovalInstance: projectCharterApprovalInstance, charter: getNamaProyekCharter(), proposal: getNamaProyekProposal(), stakeholder:getStakeholder()]
        }else{
            [projectCharterApprovalInstance: projectCharterApprovalInstance]
        }
    }

    def update(Long id, Long version) {
        def projectCharterApprovalInstance = ProjectCharterApproval.get(id)
        if (!projectCharterApprovalInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectCharterApproval.label', default: 'ProjectCharterApproval'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (projectCharterApprovalInstance.version > version) {
                projectCharterApprovalInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'projectCharterApproval.label', default: 'ProjectCharterApproval')] as Object[],
                          "Another user has updated this ProjectCharterApproval while you were editing")
                render(view: "edit", model: [projectCharterApprovalInstance: projectCharterApprovalInstance])
                return
            }
        }

        projectCharterApprovalInstance.properties = params

        if (!projectCharterApprovalInstance.save(flush: true)) {
            render(view: "edit", model: [projectCharterApprovalInstance: projectCharterApprovalInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'projectCharterApproval.label', default: 'ProjectCharterApproval'), projectCharterApprovalInstance.id])
        redirect(action: "show", id: projectCharterApprovalInstance.id)
    }

    def delete(Long id) {
        def projectCharterApprovalInstance = ProjectCharterApproval.get(id)
        if (!projectCharterApprovalInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectCharterApproval.label', default: 'ProjectCharterApproval'), id])
            redirect(action: "list")
            return
        }

        try {
            projectCharterApprovalInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'projectCharterApproval.label', default: 'ProjectCharterApproval'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'projectCharterApproval.label', default: 'ProjectCharterApproval'), id])
            redirect(action: "show", id: id)
        }
    }
}
