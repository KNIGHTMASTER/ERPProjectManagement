package ProjectIntegrationManagement.DevelopProjectCharter
import grails.plugins.springsecurity.Secured;
import org.springframework.dao.DataIntegrityViolationException;

class MilestonesController {
    def springSecurityService
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        if(session.proyek){
            redirect(action: "list", params: params)
        }else{
            redirect uri:'/chooseProject'
        }
    }

    @Secured(['ROLE_PM', 'ROLE_ADMIN', 'ROLE_PTM'])
    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def sesiproyek = session.proyek
        def results
        if(sesiproyek){
            def cari = StatementOfWork.get(sesiproyek)
            results = Milestones.findAllByIdProject(cari)
        }else{
            results = Milestones.list(params)
        }

        [milestonesInstanceList: results, milestonesInstanceTotal: Milestones.count()]
    }
    @Secured(['ROLE_ADMIN'])
    def create() {
        [milestonesInstance: new Milestones(params)]
    }

    def save() {
        def milestonesInstance = new Milestones(params)
        if (!milestonesInstance.save(flush: true)) {
            render(view: "create", model: [milestonesInstance: milestonesInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'milestones.label', default: 'Milestones'), milestonesInstance.id])
        redirect(action: "show", id: milestonesInstance.id)
    }

    def show(Long id) {
        def milestonesInstance = Milestones.get(id)
        if (!milestonesInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'milestones.label', default: 'Milestones'), id])
            redirect(action: "list")
            return
        }

        [milestonesInstance: milestonesInstance]
    }

    def edit(Long id) {
        def milestonesInstance = Milestones.get(id)
        if (!milestonesInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'milestones.label', default: 'Milestones'), id])
            redirect(action: "list")
            return
        }

        [milestonesInstance: milestonesInstance]
    }

    def update(Long id, Long version) {
        def milestonesInstance = Milestones.get(id)
        if (!milestonesInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'milestones.label', default: 'Milestones'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (milestonesInstance.version > version) {
                milestonesInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'milestones.label', default: 'Milestones')] as Object[],
                          "Another user has updated this Milestones while you were editing")
                render(view: "edit", model: [milestonesInstance: milestonesInstance])
                return
            }
        }

        milestonesInstance.properties = params

        if (!milestonesInstance.save(flush: true)) {
            render(view: "edit", model: [milestonesInstance: milestonesInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'milestones.label', default: 'Milestones'), milestonesInstance.id])
        redirect(action: "show", id: milestonesInstance.id)
    }

    def delete(Long id) {
        def milestonesInstance = Milestones.get(id)
        if (!milestonesInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'milestones.label', default: 'Milestones'), id])
            redirect(action: "list")
            return
        }

        try {
            milestonesInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'milestones.label', default: 'Milestones'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'milestones.label', default: 'Milestones'), id])
            redirect(action: "show", id: id)
        }
    }
   private currentUser() {
		return User.get(springSecurityService.principal.id)
	}
}
