package ProjectCommunicationManagement.IdentifyStakeholders

import ProjectIntegrationManagement.DevelopProjectCharter.StatementOfWork
import org.springframework.dao.DataIntegrityViolationException

class StakeholderRolesController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def getNamaProyek(){
        def result
        if(session.proyek){
            result = StatementOfWork.get(session.proyek)
        }else{
            result = StatementOfWork.list()
        }
        return result
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def results
        if(session.proyek){
            def temp= StatementOfWork.get(session.proyek)
            results = StakeholderRoles.findByProjectName(temp)
        }else{
            results = StakeholderRoles.list(params)
        }
        [stakeholderRolesInstanceList: results, stakeholderRolesInstanceTotal: StakeholderRoles.count()]
    }

    def create() {
        [stakeholderRolesInstance: new StakeholderRoles(params), namaProyek:getNamaProyek()]
    }

    def save() {
        def stakeholderRolesInstance = new StakeholderRoles(params)
        if (!stakeholderRolesInstance.save(flush: true)) {
            render(view: "create", model: [stakeholderRolesInstance: stakeholderRolesInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'stakeholderRoles.label', default: 'StakeholderRoles'), stakeholderRolesInstance.id])
        redirect(action: "show", id: stakeholderRolesInstance.id)
    }

    def show(Long id) {
        def stakeholderRolesInstance = StakeholderRoles.get(id)
        if (!stakeholderRolesInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'stakeholderRoles.label', default: 'StakeholderRoles'), id])
            redirect(action: "list")
            return
        }

        [stakeholderRolesInstance: stakeholderRolesInstance]
    }

    def edit(Long id) {
        def stakeholderRolesInstance = StakeholderRoles.get(id)
        if (!stakeholderRolesInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'stakeholderRoles.label', default: 'StakeholderRoles'), id])
            redirect(action: "list")
            return
        }

        [stakeholderRolesInstance: stakeholderRolesInstance, namaProyek:getNamaProyek()]
    }

    def update(Long id, Long version) {
        def stakeholderRolesInstance = StakeholderRoles.get(id)
        if (!stakeholderRolesInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'stakeholderRoles.label', default: 'StakeholderRoles'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (stakeholderRolesInstance.version > version) {
                stakeholderRolesInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'stakeholderRoles.label', default: 'StakeholderRoles')] as Object[],
                        "Another user has updated this StakeholderRoles while you were editing")
                render(view: "edit", model: [stakeholderRolesInstance: stakeholderRolesInstance])
                return
            }
        }

        stakeholderRolesInstance.properties = params

        if (!stakeholderRolesInstance.save(flush: true)) {
            render(view: "edit", model: [stakeholderRolesInstance: stakeholderRolesInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'stakeholderRoles.label', default: 'StakeholderRoles'), stakeholderRolesInstance.id])
        redirect(action: "show", id: stakeholderRolesInstance.id)
    }

    def delete(Long id) {
        def stakeholderRolesInstance = StakeholderRoles.get(id)
        if (!stakeholderRolesInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'stakeholderRoles.label', default: 'StakeholderRoles'), id])
            redirect(action: "list")
            return
        }

        try {
            stakeholderRolesInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'stakeholderRoles.label', default: 'StakeholderRoles'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'stakeholderRoles.label', default: 'StakeholderRoles'), id])
            redirect(action: "show", id: id)
        }
    }
}
