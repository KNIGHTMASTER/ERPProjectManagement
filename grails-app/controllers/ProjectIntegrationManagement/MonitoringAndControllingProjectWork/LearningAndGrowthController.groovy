package ProjectIntegrationManagement.MonitoringAndControllingProjectWork

import org.springframework.dao.DataIntegrityViolationException

class LearningAndGrowthController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [learningAndGrowthInstanceList: LearningAndGrowth.list(params), learningAndGrowthInstanceTotal: LearningAndGrowth.count()]
    }

    def create() {
        [learningAndGrowthInstance: new LearningAndGrowth(params)]
    }

    def save() {
        def learningAndGrowthInstance = new LearningAndGrowth(params)
        if (!learningAndGrowthInstance.save(flush: true)) {
            render(view: "create", model: [learningAndGrowthInstance: learningAndGrowthInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'learningAndGrowth.label', default: 'LearningAndGrowth'), learningAndGrowthInstance.id])
        redirect(action: "show", id: learningAndGrowthInstance.id)
    }

    def show(Long id) {
        def learningAndGrowthInstance = LearningAndGrowth.get(id)
        if (!learningAndGrowthInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'learningAndGrowth.label', default: 'LearningAndGrowth'), id])
            redirect(action: "list")
            return
        }

        [learningAndGrowthInstance: learningAndGrowthInstance]
    }

    def edit(Long id) {
        def learningAndGrowthInstance = LearningAndGrowth.get(id)
        if (!learningAndGrowthInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'learningAndGrowth.label', default: 'LearningAndGrowth'), id])
            redirect(action: "list")
            return
        }

        [learningAndGrowthInstance: learningAndGrowthInstance]
    }

    def update(Long id, Long version) {
        def learningAndGrowthInstance = LearningAndGrowth.get(id)
        if (!learningAndGrowthInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'learningAndGrowth.label', default: 'LearningAndGrowth'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (learningAndGrowthInstance.version > version) {
                learningAndGrowthInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'learningAndGrowth.label', default: 'LearningAndGrowth')] as Object[],
                          "Another user has updated this LearningAndGrowth while you were editing")
                render(view: "edit", model: [learningAndGrowthInstance: learningAndGrowthInstance])
                return
            }
        }

        learningAndGrowthInstance.properties = params

        if (!learningAndGrowthInstance.save(flush: true)) {
            render(view: "edit", model: [learningAndGrowthInstance: learningAndGrowthInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'learningAndGrowth.label', default: 'LearningAndGrowth'), learningAndGrowthInstance.id])
        redirect(action: "show", id: learningAndGrowthInstance.id)
    }

    def delete(Long id) {
        def learningAndGrowthInstance = LearningAndGrowth.get(id)
        if (!learningAndGrowthInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'learningAndGrowth.label', default: 'LearningAndGrowth'), id])
            redirect(action: "list")
            return
        }

        try {
            learningAndGrowthInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'learningAndGrowth.label', default: 'LearningAndGrowth'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'learningAndGrowth.label', default: 'LearningAndGrowth'), id])
            redirect(action: "show", id: id)
        }
    }
}
