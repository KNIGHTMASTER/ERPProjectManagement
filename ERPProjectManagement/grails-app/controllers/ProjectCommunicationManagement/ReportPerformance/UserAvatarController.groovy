package ProjectCommunicationManagement.ReportPerformance

import command.UploadImageCommand
import org.springframework.dao.DataIntegrityViolationException

import java.awt.Image

class UserAvatarController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def displayAvatar(){
        def user = UserAvatar.get(params.id)
        response.contentType = "image/jpeg"
        response.contentLength = user?.avatar.length
        response.outputStream.write(user?.avatar)
    }


     def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [userAvatarInstanceList: UserAvatar.list(params), userAvatarInstanceTotal: UserAvatar.count()]
    }

    def create() {
        [userAvatarInstance: new UserAvatar(params)]
    }

    def save() {
        def userAvatarInstance = new UserAvatar(params)
        if (!userAvatarInstance.save(flush: true)) {
            render(view: "create", model: [userAvatarInstance: userAvatarInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'userAvatar.label', default: 'UserAvatar'), userAvatarInstance.id])
        redirect(action: "show", id: userAvatarInstance.id)
    }

    def show(Long id) {
        def userAvatarInstance = UserAvatar.get(id)
        if (!userAvatarInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userAvatar.label', default: 'UserAvatar'), id])
            redirect(action: "list")
            return
        }

        [userAvatarInstance: userAvatarInstance]
    }

    def edit(Long id) {
        def userAvatarInstance = UserAvatar.get(id)
        if (!userAvatarInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userAvatar.label', default: 'UserAvatar'), id])
            redirect(action: "list")
            return
        }

        [userAvatarInstance: userAvatarInstance]
    }

    def update(Long id, Long version) {
        def userAvatarInstance = UserAvatar.get(id)
        if (!userAvatarInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userAvatar.label', default: 'UserAvatar'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (userAvatarInstance.version > version) {
                userAvatarInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'userAvatar.label', default: 'UserAvatar')] as Object[],
                        "Another user has updated this UserAvatar while you were editing")
                render(view: "edit", model: [userAvatarInstance: userAvatarInstance])
                return
            }
        }

        userAvatarInstance.properties = params

        if (!userAvatarInstance.save(flush: true)) {
            render(view: "edit", model: [userAvatarInstance: userAvatarInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'userAvatar.label', default: 'UserAvatar'), userAvatarInstance.id])
        redirect(action: "show", id: userAvatarInstance.id)
    }

    def delete(Long id) {
        def userAvatarInstance = UserAvatar.get(id)
        if (!userAvatarInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userAvatar.label', default: 'UserAvatar'), id])
            redirect(action: "list")
            return
        }

        try {
            userAvatarInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'userAvatar.label', default: 'UserAvatar'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'userAvatar.label', default: 'UserAvatar'), id])
            redirect(action: "show", id: id)
        }
    }
}
