package ProjectIntegrationManagement.DevelopProjectManagementPlan

import ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter
import ProjectIntegrationManagement.DevelopProjectCharter.ProjectProposal
import ProjectIntegrationManagement.DevelopProjectCharter.StatementOfWork
import grails.plugins.springsecurity.Secured
import org.springframework.dao.DataIntegrityViolationException

class ChangeControlBoardController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    @Secured(['ROLE_ADMIN', 'ROLE_PM'])
    def index() {
        if(session.proyek){
            redirect(action: "list", params: params)
        }else{
            redirect uri:'/chooseProject?tautan=ChangeControlBoard'
        }
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
            results5 = ChangeControlBoard.findAllByProjectName(results4)
        }else{
            results5 = ChangeControlBoard.list(params)
        }
        [changeControlBoardInstanceList: results5, changeControlBoardInstanceTotal: ChangeControlBoard.count()]
    }

    def create() {
        [changeControlBoardInstance: new ChangeControlBoard(params)]
    }

    def save() {
        def changeControlBoardInstance = new ChangeControlBoard(params)
        if (!changeControlBoardInstance.save(flush: true)) {
            render(view: "create", model: [changeControlBoardInstance: changeControlBoardInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'changeControlBoard.label', default: 'ChangeControlBoard'), changeControlBoardInstance.id])
        redirect(action: "show", id: changeControlBoardInstance.id)
    }

    def show(Long id) {
        def changeControlBoardInstance = ChangeControlBoard.get(id)
        if (!changeControlBoardInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'changeControlBoard.label', default: 'ChangeControlBoard'), id])
            redirect(action: "list")
            return
        }

        [changeControlBoardInstance: changeControlBoardInstance]
    }

    def edit(Long id) {
        def changeControlBoardInstance = ChangeControlBoard.get(id)
        if (!changeControlBoardInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'changeControlBoard.label', default: 'ChangeControlBoard'), id])
            redirect(action: "list")
            return
        }

        [changeControlBoardInstance: changeControlBoardInstance]
    }

    def update(Long id, Long version) {
        def changeControlBoardInstance = ChangeControlBoard.get(id)
        if (!changeControlBoardInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'changeControlBoard.label', default: 'ChangeControlBoard'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (changeControlBoardInstance.version > version) {
                changeControlBoardInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'changeControlBoard.label', default: 'ChangeControlBoard')] as Object[],
                          "Another user has updated this ChangeControlBoard while you were editing")
                render(view: "edit", model: [changeControlBoardInstance: changeControlBoardInstance])
                return
            }
        }

        changeControlBoardInstance.properties = params

        if (!changeControlBoardInstance.save(flush: true)) {
            render(view: "edit", model: [changeControlBoardInstance: changeControlBoardInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'changeControlBoard.label', default: 'ChangeControlBoard'), changeControlBoardInstance.id])
        redirect(action: "show", id: changeControlBoardInstance.id)
    }

    def delete(Long id) {
        def changeControlBoardInstance = ChangeControlBoard.get(id)
        if (!changeControlBoardInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'changeControlBoard.label', default: 'ChangeControlBoard'), id])
            redirect(action: "list")
            return
        }

        try {
            changeControlBoardInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'changeControlBoard.label', default: 'ChangeControlBoard'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'changeControlBoard.label', default: 'ChangeControlBoard'), id])
            redirect(action: "show", id: id)
        }
    }
}
