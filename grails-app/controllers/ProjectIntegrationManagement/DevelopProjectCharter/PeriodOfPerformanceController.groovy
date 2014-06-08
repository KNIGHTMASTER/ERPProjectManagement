package ProjectIntegrationManagement.DevelopProjectCharter

import grails.plugins.springsecurity.Secured
import org.springframework.dao.DataIntegrityViolationException

class PeriodOfPerformanceController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    @Secured(['ROLE_ADMIN', 'ROLE_PM'])
    def index() {
        if(session.proyek){
            redirect(action: "list", params: params)
        }else{
            redirect uri:'/chooseProject?tautan=PeriodOfPerformance'
        }
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)

        def sesiproyek = session.proyek
        def results
        if(sesiproyek){
            def cari = StatementOfWork.get(sesiproyek)
            results = PeriodOfPerformance.findAllByProjectName(cari)
        }else{
            results = PeriodOfPerformance.list(params)
        }

        [periodOfPerformanceInstanceList: results, periodOfPerformanceInstanceTotal: PeriodOfPerformance.count()]
    }

    def create() {
        [periodOfPerformanceInstance: new PeriodOfPerformance(params)]
    }

    def save() {
        def periodOfPerformanceInstance = new PeriodOfPerformance(params)
        if (!periodOfPerformanceInstance.save(flush: true)) {
            render(view: "create", model: [periodOfPerformanceInstance: periodOfPerformanceInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'periodOfPerformance.label', default: 'PeriodOfPerformance'), periodOfPerformanceInstance.id])
        redirect(action: "show", id: periodOfPerformanceInstance.id)
    }

    def show(Long id) {
        def periodOfPerformanceInstance = PeriodOfPerformance.get(id)
        if (!periodOfPerformanceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'periodOfPerformance.label', default: 'PeriodOfPerformance'), id])
            redirect(action: "list")
            return
        }

        [periodOfPerformanceInstance: periodOfPerformanceInstance]
    }

    def edit(Long id) {
        def periodOfPerformanceInstance = PeriodOfPerformance.get(id)
        if (!periodOfPerformanceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'periodOfPerformance.label', default: 'PeriodOfPerformance'), id])
            redirect(action: "list")
            return
        }

        [periodOfPerformanceInstance: periodOfPerformanceInstance]
    }

    def update(Long id, Long version) {
        def periodOfPerformanceInstance = PeriodOfPerformance.get(id)
        if (!periodOfPerformanceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'periodOfPerformance.label', default: 'PeriodOfPerformance'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (periodOfPerformanceInstance.version > version) {
                periodOfPerformanceInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'periodOfPerformance.label', default: 'PeriodOfPerformance')] as Object[],
                          "Another user has updated this PeriodOfPerformance while you were editing")
                render(view: "edit", model: [periodOfPerformanceInstance: periodOfPerformanceInstance])
                return
            }
        }

        periodOfPerformanceInstance.properties = params

        if (!periodOfPerformanceInstance.save(flush: true)) {
            render(view: "edit", model: [periodOfPerformanceInstance: periodOfPerformanceInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'periodOfPerformance.label', default: 'PeriodOfPerformance'), periodOfPerformanceInstance.id])
        redirect(action: "show", id: periodOfPerformanceInstance.id)
    }

    def delete(Long id) {
        def periodOfPerformanceInstance = PeriodOfPerformance.get(id)
        if (!periodOfPerformanceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'periodOfPerformance.label', default: 'PeriodOfPerformance'), id])
            redirect(action: "list")
            return
        }

        try {
            periodOfPerformanceInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'periodOfPerformance.label', default: 'PeriodOfPerformance'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'periodOfPerformance.label', default: 'PeriodOfPerformance'), id])
            redirect(action: "show", id: id)
        }
    }
}
