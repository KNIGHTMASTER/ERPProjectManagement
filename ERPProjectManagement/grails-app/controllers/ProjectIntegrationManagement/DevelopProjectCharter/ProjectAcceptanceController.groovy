package ProjectIntegrationManagement.DevelopProjectCharter

import grails.plugins.springsecurity.Secured
import org.springframework.dao.DataIntegrityViolationException

import ProjectIntegrationManagement.DevelopProjectCharter.*

import groovy.sql.Sql

class ProjectAcceptanceController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    @Secured(['ROLE_ADMIN', 'ROLE_PM'])
    def index() {
        if(session.proyek){
            redirect(action: "list", params: params)
        }else{
            redirect uri:'/chooseProject?tautan=ProjectAcceptance'
        }
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def results
        def results2
        def results3
        if(session.proyek){
            results = StatementOfWork.get(session.proyek)
            results2 = ProjectProposal.findByProjectName(results)
            results3 = ProjectAcceptance.findAllByProjectName(results2)
        }else{
            results3 = ProjectAcceptance.list(params)
        }
        [projectAcceptanceInstanceList: results3, projectAcceptanceInstanceTotal: ProjectAcceptance.count()]
    }

    def create() {
        [projectAcceptanceInstance: new ProjectAcceptance(params)]
    }

    def save() {
        def projectAcceptanceInstance = new ProjectAcceptance(params)
        if (!projectAcceptanceInstance.save(flush: true)) {
            render(view: "create", model: [projectAcceptanceInstance: projectAcceptanceInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'projectAcceptance.label', default: 'ProjectAcceptance'), projectAcceptanceInstance.id])
        redirect(action: "show", id: projectAcceptanceInstance.id)
    }

    def show(Long id) {
        def projectAcceptanceInstance = ProjectAcceptance.get(id)
        if (!projectAcceptanceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectAcceptance.label', default: 'ProjectAcceptance'), id])
            redirect(action: "list")
            return
        }

            def data = ProjectAcceptance.get(id)
            def cek = ProjectInformation.findByProjectName(data.projectName)
            def nextId

            def projectNameId
            Sql.withInstance("jdbc:h2:tcp://localhost/PRAM", "sa", "", "org.h2.Driver"){sql ->
                sql.eachRow('SELECT PROJECT_NAME_ID FROM PROJECT_ACCEPTANCE WHERE ID= '+id){
                    projectNameId = "$it.PROJECT_NAME_ID"
                }
            }
            
            //UNTUK PROJECT INFORMATION & REVIEW PROJECT PROPOSAL                    
            /*Sql.withInstance("jdbc:h2:tcp://localhost/PRAM", "sa", "", "org.h2.Driver"){sql ->
                sql.eachRow('SELECT PROJECT_NAME_ID FROM PROJECT_INFORMATION WHERE PROJECT_NAME_ID = '+projectNameId){
                    cek = "$it.PROJECT_NAME_ID"
                }
            }*/

            def projectInformation = new ProjectInformation()
            //PROJECT INFORMATION
            if(data.acceptance == true){
                projectInformation.projectStatus = "GRANTED"
            }else{
                projectInformation.projectStatus = "DENIED"
            }

            Sql.withInstance("jdbc:h2:tcp://localhost/PRAM", "sa", "", "org.h2.Driver"){sql ->
                sql.eachRow("SELECT MAX(ID)+1 AS MAKSIMUM FROM PROJECT_INFORMATION"){
                    nextId = "$it.MAKSIMUM"
                }
            }

            if(nextId == null){
                nextId = 1
            }

            if(cek){
            
            }else{
                //INSERT INTO PROJECT INFORMATION

                Sql.withInstance("jdbc:h2:tcp://localhost/PRAM", "sa", "", "org.h2.Driver"){sql ->
                    sql.execute("INSERT INTO PROJECT_INFORMATION(ID, VERSION, ACCEPTANCE, PROJECT_NAME_ID, PROJECT_STATUS) VALUES("+nextId+", 0, "+data.acceptance+", "+projectNameId+", '"+projectInformation.projectStatus+"')")
                }


                //REVIEW PROJECT PROPOSAL
                def reviewProjectProposal= new ReviewProjectProposal()
                if(data.acceptance == true){
                    reviewProjectProposal.projectStatus = "GRANTED"
                }else{
                    reviewProjectProposal.projectStatus = "DENIED"
                }

                def nextIdRPP
                Sql.withInstance("jdbc:h2:tcp://localhost/PRAM", "sa", "", "org.h2.Driver"){sql ->
                    sql.eachRow("SELECT MAX(ID)+1 AS MAKSIMUM FROM REVIEW_PROJECT_PROPOSAL"){
                        nextIdRPP = "$it.MAKSIMUM"
                    }
                }

                //INSERT INTO REVIEW PROJECT PROPOSAL

                Sql.withInstance("jdbc:h2:tcp://localhost/PRAM", "sa", "", "org.h2.Driver"){sql ->
                    sql.execute("INSERT INTO REVIEW_PROJECT_PROPOSAL(ID, VERSION, ACCEPTANCE, DESCRIPTION, PROJECT_NAME_ID, PROJECT_STATUS, REVIEWER_ID) VALUES("+nextIdRPP+", 0, "+data.acceptance+", '', "+projectNameId+", '"+reviewProjectProposal.projectStatus+"', "+null+")")
                }
            }

        [projectAcceptanceInstance: projectAcceptanceInstance]
    }

    def edit(Long id) {
        def projectAcceptanceInstance = ProjectAcceptance.get(id)
        if (!projectAcceptanceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectAcceptance.label', default: 'ProjectAcceptance'), id])
            redirect(action: "list")
            return
        }

        [projectAcceptanceInstance: projectAcceptanceInstance]
    }

    def update(Long id, Long version) {
        def projectAcceptanceInstance = ProjectAcceptance.get(id)
        if (!projectAcceptanceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectAcceptance.label', default: 'ProjectAcceptance'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (projectAcceptanceInstance.version > version) {
                projectAcceptanceInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'projectAcceptance.label', default: 'ProjectAcceptance')] as Object[],
                          "Another user has updated this ProjectAcceptance while you were editing")
                render(view: "edit", model: [projectAcceptanceInstance: projectAcceptanceInstance])
                return
            }
        }

        projectAcceptanceInstance.properties = params

        if (!projectAcceptanceInstance.save(flush: true)) {
            render(view: "edit", model: [projectAcceptanceInstance: projectAcceptanceInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'projectAcceptance.label', default: 'ProjectAcceptance'), projectAcceptanceInstance.id])
        redirect(action: "show", id: projectAcceptanceInstance.id)
    }

    def delete(Long id) {
        def projectAcceptanceInstance = ProjectAcceptance.get(id)
        if (!projectAcceptanceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectAcceptance.label', default: 'ProjectAcceptance'), id])
            redirect(action: "list")
            return
        }

        try {
            projectAcceptanceInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'projectAcceptance.label', default: 'ProjectAcceptance'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'projectAcceptance.label', default: 'ProjectAcceptance'), id])
            redirect(action: "show", id: id)
        }
    }
}
