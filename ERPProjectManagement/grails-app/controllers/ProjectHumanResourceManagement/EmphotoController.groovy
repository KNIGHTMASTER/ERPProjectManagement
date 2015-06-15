package ProjectHumanResourceManagement

import org.springframework.dao.DataIntegrityViolationException

class EmphotoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [emphotoInstanceList: Emphoto.list(params), emphotoInstanceTotal: Emphoto.count()]
    }

    def create() {
        [emphotoInstance: new Emphoto(params)]
    }

    def save() {
        def emphotoInstance = new Emphoto(params)
        if (!emphotoInstance.save(flush: true)) {
            render(view: "create", model: [emphotoInstance: emphotoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'emphoto.label', default: 'Emphoto'), emphotoInstance.id])
        redirect(action: "show", id: emphotoInstance.id)
    }

    def show(Long id) {
        def emphotoInstance = Emphoto.get(id)
        if (!emphotoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'emphoto.label', default: 'Emphoto'), id])
            redirect(action: "list")
            return
        }

        [emphotoInstance: emphotoInstance]
    }

    def edit(Long id) {
        def emphotoInstance = Emphoto.get(id)
        if (!emphotoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'emphoto.label', default: 'Emphoto'), id])
            redirect(action: "list")
            return
        }

        [emphotoInstance: emphotoInstance]
    }

    def update(Long id, Long version) {
        def emphotoInstance = Emphoto.get(id)
        if (!emphotoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'emphoto.label', default: 'Emphoto'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (emphotoInstance.version > version) {
                emphotoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'emphoto.label', default: 'Emphoto')] as Object[],
                          "Another user has updated this Emphoto while you were editing")
                render(view: "edit", model: [emphotoInstance: emphotoInstance])
                return
            }
        }

        emphotoInstance.properties = params

        if (!emphotoInstance.save(flush: true)) {
            render(view: "edit", model: [emphotoInstance: emphotoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'emphoto.label', default: 'Emphoto'), emphotoInstance.id])
        redirect(action: "show", id: emphotoInstance.id)
    }

    def delete(Long id) {
        def emphotoInstance = Emphoto.get(id)
        if (!emphotoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'emphoto.label', default: 'Emphoto'), id])
            redirect(action: "list")
            return
        }

        try {
            emphotoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'emphoto.label', default: 'Emphoto'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'emphoto.label', default: 'Emphoto'), id])
            redirect(action: "show", id: id)
        }
    }
    def tampil(){
        def img = Emphoto.get(params.id)
        byte[] image = img.photo
        response.outputStream << image
    }
}
