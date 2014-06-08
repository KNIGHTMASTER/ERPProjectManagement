package ProjectCommunicationManagement.IdentifyStakeholders

import ProjectIntegrationManagement.DevelopProjectCharter.StatementOfWork
import org.springframework.dao.DataIntegrityViolationException

class StakeholderRegisterController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def displayAvatar(){
        def user = StakeholderRegister.get(params.id)
        //response.contentType = "image/jpeg"
        response.contentLength = user?.image.length
        response.outputStream.write(user?.image)
    }

    def getProjectName(){
        def result
        if(session.proyek){
            result = StatementOfWork.get(session.proyek)
        }else{
            result = StatementOfWork.list()
        }
        return result
    }

    def getRole(){
        def result
        if(session.proyek){
            def temp = StatementOfWork.get(session.proyek)
            result = StakeholderRoles.findAllByProjectName(temp)
        }else{
            result = StakeholderRoles.list()
        }
        return result
    }

    def getCommunicationType(){
        def result
        if(session.proyek){
            def temp = StatementOfWork.get(session.proyek)
            result = CommunicationType.findAllByStatementOfWork(temp)
        }else{
            result = CommunicationType.list()
        }
        return result
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def results
        if(session.proyek){
            def temp = StatementOfWork.get(session.proyek)
            results = StakeholderRegister.findAllByProjectName(temp)
        }else{
            results = StakeholderRegister.list(params)
        }
        [stakeholderRegisterInstanceList: results, stakeholderRegisterInstanceTotal: StakeholderRegister.count()]
    }

    def create() {
        [stakeholderRegisterInstance: new StakeholderRegister(params), namaProyek:getProjectName(), role:getRole(), communicationType:getCommunicationType()]
    }

    def save() {
        def stakeholderRegisterInstance = new StakeholderRegister(params)
        if (!stakeholderRegisterInstance.save(flush: true)) {
            render(view: "create", model: [stakeholderRegisterInstance: stakeholderRegisterInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'stakeholderRegister.label', default: 'StakeholderRegister'), stakeholderRegisterInstance.id])
        redirect(action: "show", id: stakeholderRegisterInstance.id)
    }

    def show(Long id) {
        def stakeholderRegisterInstance = StakeholderRegister.get(id)
        if (!stakeholderRegisterInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'stakeholderRegister.label', default: 'StakeholderRegister'), id])
            redirect(action: "list")
            return
        }

        [stakeholderRegisterInstance: stakeholderRegisterInstance]
    }

    def edit(Long id) {
        def stakeholderRegisterInstance = StakeholderRegister.get(id)
        if (!stakeholderRegisterInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'stakeholderRegister.label', default: 'StakeholderRegister'), id])
            redirect(action: "list")
            return
        }

        [stakeholderRegisterInstance: stakeholderRegisterInstance, namaProyek:getProjectName(), role:getRole(), communicationType:getCommunicationType()]
    }

    def update(Long id, Long version) {
        def stakeholderRegisterInstance = StakeholderRegister.get(id)
        if (!stakeholderRegisterInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'stakeholderRegister.label', default: 'StakeholderRegister'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (stakeholderRegisterInstance.version > version) {
                stakeholderRegisterInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'stakeholderRegister.label', default: 'StakeholderRegister')] as Object[],
                          "Another user has updated this StakeholderRegister while you were editing")
                render(view: "edit", model: [stakeholderRegisterInstance: stakeholderRegisterInstance])
                return
            }
        }

        stakeholderRegisterInstance.properties = params

        if (!stakeholderRegisterInstance.save(flush: true)) {
            render(view: "edit", model: [stakeholderRegisterInstance: stakeholderRegisterInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'stakeholderRegister.label', default: 'StakeholderRegister'), stakeholderRegisterInstance.id])
        redirect(action: "show", id: stakeholderRegisterInstance.id)
    }

    def delete(Long id) {
        def stakeholderRegisterInstance = StakeholderRegister.get(id)
        if (!stakeholderRegisterInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'stakeholderRegister.label', default: 'StakeholderRegister'), id])
            redirect(action: "list")
            return
        }

        try {
            stakeholderRegisterInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'stakeholderRegister.label', default: 'StakeholderRegister'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'stakeholderRegister.label', default: 'StakeholderRegister'), id])
            redirect(action: "show", id: id)
        }
    }
}
