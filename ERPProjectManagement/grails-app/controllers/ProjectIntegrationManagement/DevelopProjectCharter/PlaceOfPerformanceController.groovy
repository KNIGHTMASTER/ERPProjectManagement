package ProjectIntegrationManagement.DevelopProjectCharter

import grails.plugins.springsecurity.Secured
import org.springframework.dao.DataIntegrityViolationException

class PlaceOfPerformanceController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    @Secured(['ROLE_ADMIN', 'ROLE_PM'])
    def index() {
        if(session.proyek){
            redirect(action: "list", params: params)
        }else{
            redirect uri:'/chooseProject?tautan=PlaceOfPerformance'
        }
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)

        def sesiproyek = session.proyek
        def results
        if(sesiproyek){
            def cari = StatementOfWork.get(sesiproyek)
            results = PlaceOfPerformance.findAllByProjectName(cari)
        }else{
            results = PlaceOfPerformance.list(params)
        }

        [placeOfPerformanceInstanceList: results, placeOfPerformanceInstanceTotal: PlaceOfPerformance.count()]
    }

    def create() {
        [placeOfPerformanceInstance: new PlaceOfPerformance(params)]
    }

    def save() {
        def placeOfPerformanceInstance = new PlaceOfPerformance(params)
        if (!placeOfPerformanceInstance.save(flush: true)) {
            render(view: "create", model: [placeOfPerformanceInstance: placeOfPerformanceInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'placeOfPerformance.label', default: 'PlaceOfPerformance'), placeOfPerformanceInstance.id])
        redirect(action: "show", id: placeOfPerformanceInstance.id)
    }

    def show(Long id) {
        def placeOfPerformanceInstance = PlaceOfPerformance.get(id)
        if (!placeOfPerformanceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'placeOfPerformance.label', default: 'PlaceOfPerformance'), id])
            redirect(action: "list")
            return
        }

        [placeOfPerformanceInstance: placeOfPerformanceInstance]
    }

    def edit(Long id) {
        def placeOfPerformanceInstance = PlaceOfPerformance.get(id)
        if (!placeOfPerformanceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'placeOfPerformance.label', default: 'PlaceOfPerformance'), id])
            redirect(action: "list")
            return
        }

        [placeOfPerformanceInstance: placeOfPerformanceInstance]
    }

    def update(Long id, Long version) {
        def placeOfPerformanceInstance = PlaceOfPerformance.get(id)
        if (!placeOfPerformanceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'placeOfPerformance.label', default: 'PlaceOfPerformance'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (placeOfPerformanceInstance.version > version) {
                placeOfPerformanceInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'placeOfPerformance.label', default: 'PlaceOfPerformance')] as Object[],
                          "Another user has updated this PlaceOfPerformance while you were editing")
                render(view: "edit", model: [placeOfPerformanceInstance: placeOfPerformanceInstance])
                return
            }
        }

        placeOfPerformanceInstance.properties = params

        if (!placeOfPerformanceInstance.save(flush: true)) {
            render(view: "edit", model: [placeOfPerformanceInstance: placeOfPerformanceInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'placeOfPerformance.label', default: 'PlaceOfPerformance'), placeOfPerformanceInstance.id])
        redirect(action: "show", id: placeOfPerformanceInstance.id)
    }

    def delete(Long id) {
        def placeOfPerformanceInstance = PlaceOfPerformance.get(id)
        if (!placeOfPerformanceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'placeOfPerformance.label', default: 'PlaceOfPerformance'), id])
            redirect(action: "list")
            return
        }

        try {
            placeOfPerformanceInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'placeOfPerformance.label', default: 'PlaceOfPerformance'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'placeOfPerformance.label', default: 'PlaceOfPerformance'), id])
            redirect(action: "show", id: id)
        }
    }
}
