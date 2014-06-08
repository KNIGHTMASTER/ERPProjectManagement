package ProjectIntegrationManagement.DevelopProjectCharter

import grails.plugins.springsecurity.Secured
import org.springframework.dao.DataIntegrityViolationException

class ReviewProjectProposalController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    @Secured(['ROLE_ADMIN', 'ROLE_PM'])
    def index() {
        if(session.proyek){
            redirect(action: "list", params: params)
        }else{
            redirect uri:'/chooseProject?tautan=ReviewProjectProposal'
        }
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def results
        def results2

        if(session.proyek){
            def cari = StatementOfWork.get(session.proyek)
            results = ProjectProposal.findByProjectName(cari)
            results2 = ReviewProjectProposal.findAllByProjectName(results)

        }else{
            results2 = ReviewProjectProposal.list(params)
        }
        [reviewProjectProposalInstanceList: results2, reviewProjectProposalInstanceTotal: ReviewProjectProposal.count()]
    }

    def create() {
        [reviewProjectProposalInstance: new ReviewProjectProposal(params)]
    }

    def save() {
        def reviewProjectProposalInstance = new ReviewProjectProposal(params)
        if (!reviewProjectProposalInstance.save(flush: true)) {
            render(view: "create", model: [reviewProjectProposalInstance: reviewProjectProposalInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'reviewProjectProposal.label', default: 'ReviewProjectProposal'), reviewProjectProposalInstance.id])
        redirect(action: "show", id: reviewProjectProposalInstance.id)
    }

    def show(Long id) {
        def reviewProjectProposalInstance = ReviewProjectProposal.get(id)
        if (!reviewProjectProposalInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'reviewProjectProposal.label', default: 'ReviewProjectProposal'), id])
            redirect(action: "list")
            return
        }

        [reviewProjectProposalInstance: reviewProjectProposalInstance]
    }

    def edit(Long id) {
        def reviewProjectProposalInstance = ReviewProjectProposal.get(id)
        if (!reviewProjectProposalInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'reviewProjectProposal.label', default: 'ReviewProjectProposal'), id])
            redirect(action: "list")
            return
        }

        [reviewProjectProposalInstance: reviewProjectProposalInstance]
    }

    def update(Long id, Long version) {
        def reviewProjectProposalInstance = ReviewProjectProposal.get(id)
        if (!reviewProjectProposalInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'reviewProjectProposal.label', default: 'ReviewProjectProposal'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (reviewProjectProposalInstance.version > version) {
                reviewProjectProposalInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'reviewProjectProposal.label', default: 'ReviewProjectProposal')] as Object[],
                          "Another user has updated this ReviewProjectProposal while you were editing")
                render(view: "edit", model: [reviewProjectProposalInstance: reviewProjectProposalInstance])
                return
            }
        }

        reviewProjectProposalInstance.properties = params

        if (!reviewProjectProposalInstance.save(flush: true)) {
            render(view: "edit", model: [reviewProjectProposalInstance: reviewProjectProposalInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'reviewProjectProposal.label', default: 'ReviewProjectProposal'), reviewProjectProposalInstance.id])
        redirect(action: "show", id: reviewProjectProposalInstance.id)
    }

    def delete(Long id) {
        def reviewProjectProposalInstance = ReviewProjectProposal.get(id)
        if (!reviewProjectProposalInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'reviewProjectProposal.label', default: 'ReviewProjectProposal'), id])
            redirect(action: "list")
            return
        }

        try {
            reviewProjectProposalInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'reviewProjectProposal.label', default: 'ReviewProjectProposal'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'reviewProjectProposal.label', default: 'ReviewProjectProposal'), id])
            redirect(action: "show", id: id)
        }
    }
}
