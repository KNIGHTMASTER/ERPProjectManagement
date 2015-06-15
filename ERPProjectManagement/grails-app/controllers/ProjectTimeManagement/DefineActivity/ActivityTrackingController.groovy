package ProjectTimeManagement.DefineActivity

import ProjectIntegrationManagement.DevelopProjectCharter.StatementOfWork
import grails.plugins.springsecurity.Secured
import org.springframework.dao.DataIntegrityViolationException

class ActivityTrackingController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    @Secured(['ROLE_ADMIN', 'ROLE_PM'])
    def index() {
        if(session.proyek){
            redirect(action: "list", params: params)
        }else{
            redirect uri:'/chooseProject?tautan=ActivityTracking'
        }
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def result = []
        if(session.proyek){
            def sow = StatementOfWork.get(session.proyek)
            def milestones = sow.milestones
            def activities
            milestones.each {
                activities = Activity.executeQuery("select t from Activity t where t.id = ${it.id}")
                activities.each{
                    result.addAll(it.trackings)
                }
            }
        }else{
            result = ActivityTracking.list(params)
        }
        [activityTrackingInstanceList: result, activityTrackingInstanceTotal: ActivityTracking.count()]
    }

    def create() {
        [activityTrackingInstance: new ActivityTracking(params)]
    }

    def save() {
        def activityTrackingInstance = new ActivityTracking(params)
        if (!activityTrackingInstance.save(flush: true)) {
            render(view: "create", model: [activityTrackingInstance: activityTrackingInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'activityTracking.label', default: 'ActivityTracking'), activityTrackingInstance.id])
        redirect(action: "show", id: activityTrackingInstance.id)
    }

    def show(Long id) {
        def activityTrackingInstance = ActivityTracking.get(id)
        if (!activityTrackingInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'activityTracking.label', default: 'ActivityTracking'), id])
            redirect(action: "list")
            return
        }

        [activityTrackingInstance: activityTrackingInstance]
    }

    def edit(Long id) {
        def activityTrackingInstance = ActivityTracking.get(id)
        if (!activityTrackingInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'activityTracking.label', default: 'ActivityTracking'), id])
            redirect(action: "list")
            return
        }

        [activityTrackingInstance: activityTrackingInstance]
    }

    def update(Long id, Long version) {
        def activityTrackingInstance = ActivityTracking.get(id)
        if (!activityTrackingInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'activityTracking.label', default: 'ActivityTracking'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (activityTrackingInstance.version > version) {
                activityTrackingInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'activityTracking.label', default: 'ActivityTracking')] as Object[],
                          "Another user has updated this ActivityTracking while you were editing")
                render(view: "edit", model: [activityTrackingInstance: activityTrackingInstance])
                return
            }
        }

        activityTrackingInstance.properties = params

        if (!activityTrackingInstance.save(flush: true)) {
            render(view: "edit", model: [activityTrackingInstance: activityTrackingInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'activityTracking.label', default: 'ActivityTracking'), activityTrackingInstance.id])
        redirect(action: "show", id: activityTrackingInstance.id)
    }

    def delete(Long id) {
        def activityTrackingInstance = ActivityTracking.get(id)
        if (!activityTrackingInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'activityTracking.label', default: 'ActivityTracking'), id])
            redirect(action: "list")
            return
        }

        try {
            activityTrackingInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'activityTracking.label', default: 'ActivityTracking'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'activityTracking.label', default: 'ActivityTracking'), id])
            redirect(action: "show", id: id)
        }
    }
}
