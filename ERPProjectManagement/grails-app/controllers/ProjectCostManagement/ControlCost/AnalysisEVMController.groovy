package ProjectCostManagement.ControlCost

import org.springframework.dao.DataIntegrityViolationException

class AnalysisEVMController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [analysisEVMInstanceList: AnalysisEVM.list(params), analysisEVMInstanceTotal: AnalysisEVM.count()]
    }

    def create() {
        [analysisEVMInstance: new AnalysisEVM(params)]
    }

    def save() {
        def analysisEVMInstance = new AnalysisEVM(params)
        if (!analysisEVMInstance.save(flush: true)) {
            render(view: "create", model: [analysisEVMInstance: analysisEVMInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'analysisEVM.label', default: 'AnalysisEVM'), analysisEVMInstance.id])
        redirect(action: "show", id: analysisEVMInstance.id)
    }

    def show(Long id) {
        def analysisEVMInstance = AnalysisEVM.get(id)
        if (!analysisEVMInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'analysisEVM.label', default: 'AnalysisEVM'), id])
            redirect(action: "list")
            return
        }

        [analysisEVMInstance: analysisEVMInstance]
    }

    def edit(Long id) {
        def analysisEVMInstance = AnalysisEVM.get(id)
        if (!analysisEVMInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'analysisEVM.label', default: 'AnalysisEVM'), id])
            redirect(action: "list")
            return
        }

        [analysisEVMInstance: analysisEVMInstance]
    }

    def update(Long id, Long version) {
        def analysisEVMInstance = AnalysisEVM.get(id)
        if (!analysisEVMInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'analysisEVM.label', default: 'AnalysisEVM'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (analysisEVMInstance.version > version) {
                analysisEVMInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'analysisEVM.label', default: 'AnalysisEVM')] as Object[],
                          "Another user has updated this AnalysisEVM while you were editing")
                render(view: "edit", model: [analysisEVMInstance: analysisEVMInstance])
                return
            }
        }

        analysisEVMInstance.properties = params

        if (!analysisEVMInstance.save(flush: true)) {
            render(view: "edit", model: [analysisEVMInstance: analysisEVMInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'analysisEVM.label', default: 'AnalysisEVM'), analysisEVMInstance.id])
        redirect(action: "show", id: analysisEVMInstance.id)
    }

    def delete(Long id) {
        def analysisEVMInstance = AnalysisEVM.get(id)
        if (!analysisEVMInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'analysisEVM.label', default: 'AnalysisEVM'), id])
            redirect(action: "list")
            return
        }

        try {
            analysisEVMInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'analysisEVM.label', default: 'AnalysisEVM'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'analysisEVM.label', default: 'AnalysisEVM'), id])
            redirect(action: "show", id: id)
        }
    }
}
