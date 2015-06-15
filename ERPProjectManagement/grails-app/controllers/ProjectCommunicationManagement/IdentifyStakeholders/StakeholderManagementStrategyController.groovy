package ProjectCommunicationManagement.IdentifyStakeholders

import ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter
import ProjectIntegrationManagement.DevelopProjectCharter.ProjectProposal
import ProjectIntegrationManagement.DevelopProjectCharter.StatementOfWork
import org.springframework.dao.DataIntegrityViolationException

class StakeholderManagementStrategyController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def getProjectName(){
        def results
        if(session.proyek){
            def temp = StatementOfWork.get(session.proyek)
            temp = ProjectProposal.findByProjectName(temp)
            results = ProjectCharter.findByProjectName(temp)
        }else{
            results = ProjectCharter.list(params)
        }
        return results
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def results
        if(session.proyek){
            def temp = StatementOfWork.get(session.proyek)
            temp = ProjectProposal.findByProjectName(temp)
            temp = ProjectCharter.findByProjectName(temp)
            results = StakeholderManagementStrategy.findAllByProjectName(temp)
        }else{
            results = StakeholderManagementStrategy.list(params)
        }
        [stakeholderManagementStrategyInstanceList: results, stakeholderManagementStrategyInstanceTotal: StakeholderManagementStrategy.count()]
    }

    def create() {
        [stakeholderManagementStrategyInstance: new StakeholderManagementStrategy(params), namaProyek:getProjectName()]
    }

    def save() {
        def stakeholderManagementStrategyInstance = new StakeholderManagementStrategy(params)
        if (!stakeholderManagementStrategyInstance.save(flush: true)) {
            render(view: "create", model: [stakeholderManagementStrategyInstance: stakeholderManagementStrategyInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'stakeholderManagementStrategy.label', default: 'StakeholderManagementStrategy'), stakeholderManagementStrategyInstance.id])
        redirect(action: "show", id: stakeholderManagementStrategyInstance.id)
    }

    def show(Long id) {
        def stakeholderManagementStrategyInstance = StakeholderManagementStrategy.get(id)
        if (!stakeholderManagementStrategyInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'stakeholderManagementStrategy.label', default: 'StakeholderManagementStrategy'), id])
            redirect(action: "list")
            return
        }

        [stakeholderManagementStrategyInstance: stakeholderManagementStrategyInstance]
    }

    def edit(Long id) {
        def stakeholderManagementStrategyInstance = StakeholderManagementStrategy.get(id)
        if (!stakeholderManagementStrategyInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'stakeholderManagementStrategy.label', default: 'StakeholderManagementStrategy'), id])
            redirect(action: "list")
            return
        }

        [stakeholderManagementStrategyInstance: stakeholderManagementStrategyInstance, namaProyek:getProjectName()]
    }

    def update(Long id, Long version) {
        def stakeholderManagementStrategyInstance = StakeholderManagementStrategy.get(id)
        if (!stakeholderManagementStrategyInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'stakeholderManagementStrategy.label', default: 'StakeholderManagementStrategy'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (stakeholderManagementStrategyInstance.version > version) {
                stakeholderManagementStrategyInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'stakeholderManagementStrategy.label', default: 'StakeholderManagementStrategy')] as Object[],
                        "Another user has updated this StakeholderManagementStrategy while you were editing")
                render(view: "edit", model: [stakeholderManagementStrategyInstance: stakeholderManagementStrategyInstance])
                return
            }
        }

        stakeholderManagementStrategyInstance.properties = params

        if (!stakeholderManagementStrategyInstance.save(flush: true)) {
            render(view: "edit", model: [stakeholderManagementStrategyInstance: stakeholderManagementStrategyInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'stakeholderManagementStrategy.label', default: 'StakeholderManagementStrategy'), stakeholderManagementStrategyInstance.id])
        redirect(action: "show", id: stakeholderManagementStrategyInstance.id)
    }

    def delete(Long id) {
        def stakeholderManagementStrategyInstance = StakeholderManagementStrategy.get(id)
        if (!stakeholderManagementStrategyInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'stakeholderManagementStrategy.label', default: 'StakeholderManagementStrategy'), id])
            redirect(action: "list")
            return
        }

        try {
            stakeholderManagementStrategyInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'stakeholderManagementStrategy.label', default: 'StakeholderManagementStrategy'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'stakeholderManagementStrategy.label', default: 'StakeholderManagementStrategy'), id])
            redirect(action: "show", id: id)
        }
    }
}
