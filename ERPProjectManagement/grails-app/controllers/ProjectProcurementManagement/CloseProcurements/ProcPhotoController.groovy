package ProjectProcurementManagement.CloseProcurements

import org.springframework.dao.DataIntegrityViolationException

class ProcPhotoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [procPhotoInstanceList: ProcPhoto.list(params), procPhotoInstanceTotal: ProcPhoto.count()]
    }

    def create() {
        [procPhotoInstance: new ProcPhoto(params)]
    }

    def save() {
        def procPhotoInstance = new ProcPhoto(params)
        if (!procPhotoInstance.save(flush: true)) {
            render(view: "create", model: [procPhotoInstance: procPhotoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'procPhoto.label', default: 'ProcPhoto'), procPhotoInstance.id])
        redirect(action: "show", id: procPhotoInstance.id)
    }

    def show(Long id) {
        def procPhotoInstance = ProcPhoto.get(id)
        if (!procPhotoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'procPhoto.label', default: 'ProcPhoto'), id])
            redirect(action: "list")
            return
        }

        [procPhotoInstance: procPhotoInstance]
    }

    def edit(Long id) {
        def procPhotoInstance = ProcPhoto.get(id)
        if (!procPhotoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'procPhoto.label', default: 'ProcPhoto'), id])
            redirect(action: "list")
            return
        }

        [procPhotoInstance: procPhotoInstance]
    }

    def update(Long id, Long version) {
        def procPhotoInstance = ProcPhoto.get(id)
        if (!procPhotoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'procPhoto.label', default: 'ProcPhoto'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (procPhotoInstance.version > version) {
                procPhotoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'procPhoto.label', default: 'ProcPhoto')] as Object[],
                          "Another user has updated this ProcPhoto while you were editing")
                render(view: "edit", model: [procPhotoInstance: procPhotoInstance])
                return
            }
        }

        procPhotoInstance.properties = params

        if (!procPhotoInstance.save(flush: true)) {
            render(view: "edit", model: [procPhotoInstance: procPhotoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'procPhoto.label', default: 'ProcPhoto'), procPhotoInstance.id])
        redirect(action: "show", id: procPhotoInstance.id)
    }

    def delete(Long id) {
        def procPhotoInstance = ProcPhoto.get(id)
        if (!procPhotoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'procPhoto.label', default: 'ProcPhoto'), id])
            redirect(action: "list")
            return
        }

        try {
            procPhotoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'procPhoto.label', default: 'ProcPhoto'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'procPhoto.label', default: 'ProcPhoto'), id])
            redirect(action: "show", id: id)
        }
    }
}
