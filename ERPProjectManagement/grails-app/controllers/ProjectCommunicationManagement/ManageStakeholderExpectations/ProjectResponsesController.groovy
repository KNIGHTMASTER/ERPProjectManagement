package ProjectCommunicationManagement.ManageStakeholderExpectations

import Fuzzy.Fuzzy
import ProjectCommunicationManagement.IdentifyStakeholders.StakeholderRegister
import ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter
import ProjectIntegrationManagement.DevelopProjectCharter.ProjectProposal
import ProjectIntegrationManagement.DevelopProjectCharter.StatementOfWork
import ProjectScopeManagement.VerifyScope.Inspection
import ProjectTimeManagement.DefineActivity.GanttController
import grails.plugins.springsecurity.Secured
import org.springframework.dao.DataIntegrityViolationException

class ProjectResponsesController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    @Secured(['ROLE_ADMIN', 'ROLE_PCOM'])
    def index() {
        if(session.proyek){
            redirect(action: "list", params: params)
        }else{
            redirect uri:'/chooseProject?tautan=ProjectResponses'
        }
    }

    def getStakeholderFuzzy(){
        def stakeholderFuzzy = new Fuzzy()
        def data
        if(session.proyek){
            def temp = StatementOfWork.get(session.proyek)
            temp = ProjectProposal.findByProjectName(temp)
            temp = ProjectCharter.findByProjectName(temp)
            data = ProjectResponses.findAllByProjectCharter(temp)
        }else{
            data = ProjectResponses.list()
        }
        def hasil = []
        data.each{
            //(10*it.cost)/ 4
            //(10*it.time)/ 4
            stakeholderFuzzy.setCost((4*it.cost)/10)
            stakeholderFuzzy.setTime((4*it.time)/10)
            stakeholderFuzzy.mainCore()
            hasil.add(stakeholderFuzzy.getDefuzzifikasi())
        }
        return hasil
    }

    def getMiuCost(){
        def stakeholderFuzzy = new Fuzzy()
        def data = ProjectResponses.list()
        def hasil = []
        data.each{
            stakeholderFuzzy.setCost((4*it.cost)/10)
            stakeholderFuzzy.setTime((4*it.time)/10)
            stakeholderFuzzy.mainCore()
            hasil.add(stakeholderFuzzy.getMiuCost())
        }
        return hasil
    }

    def getMiuTime(){
        def stakeholderFuzzy = new Fuzzy()
        def data = ProjectResponses.list()
        def hasil = []
        data.each{
            stakeholderFuzzy.setCost((4*it.cost)/10)
            stakeholderFuzzy.setTime((4*it.time)/10)
            stakeholderFuzzy.mainCore()
            hasil.add(stakeholderFuzzy.getMiuTime())
        }
        return hasil
    }

    def getSortDefuzzifikasi(){
        def defuzzifikasi = getStakeholderFuzzy()
        def asc = defuzzifikasi.sort()
        def desc = []
        def a=asc.size()-1
        asc.each {
            desc.add(asc[a])
            a--
        }
        return desc
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def results
        def ganttObj
        def inspectionList
        if(session.proyek){
            def temp = StatementOfWork.get(session.proyek)
            temp = ProjectProposal.findByProjectName(temp)
            temp = ProjectCharter.findByProjectName(temp)
            results = ProjectResponses.findAllByProjectCharter(temp)
            inspectionList = Inspection.findAllByProjectName(temp)
            ganttObj = new GanttController()
        }else{
            results = ProjectResponses.list(params)
        }
        [projectResponsesInstanceList: results, projectResponsesInstanceTotal: ProjectResponses.count(), miuCost:getMiuCost(), miuTime:getMiuTime(), hasilDefuzzifikasi:getStakeholderFuzzy(), sortAscDefuzzi:getStakeholderFuzzy().sort(), sortDescDefuzzi:getSortDefuzzifikasi(), gantt: ganttObj.createGanttChart(), inspectionInstanceList:inspectionList]
    }

    def getProjectName(){
        def results
        if(session.proyek){
            def temp = StatementOfWork.get(session.proyek)
            temp = ProjectProposal.findByProjectName(temp)
            results = ProjectCharter.findByProjectName(temp)
        }else{
            results = ProjectCharter.list(params)
        }
        return results
    }

    def getStakeholder(){
        def results
        if(session.proyek){
            def temp = StatementOfWork.get(session.proyek)
            results = StakeholderRegister.findAllByProjectName(temp)
        }else{
            results = ProjectCharter.list(params)
        }
        return results
    }

    def create() {
        [projectResponsesInstance: new ProjectResponses(params), namaProyek:getProjectName(), stakeholder:getStakeholder()]
    }

    def save() {
        def projectResponsesInstance = new ProjectResponses(params)
        if (!projectResponsesInstance.save(flush: true)) {
            render(view: "create", model: [projectResponsesInstance: projectResponsesInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'projectResponses.label', default: 'ProjectResponses'), projectResponsesInstance.id])
        redirect(action: "show", id: projectResponsesInstance.id)
    }

    def show(Long id) {
        def projectResponsesInstance = ProjectResponses.get(id)
        if (!projectResponsesInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectResponses.label', default: 'ProjectResponses'), id])
            redirect(action: "list")
            return
        }

        [projectResponsesInstance: projectResponsesInstance]
    }

    def edit(Long id) {
        def projectResponsesInstance = ProjectResponses.get(id)
        if (!projectResponsesInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectResponses.label', default: 'ProjectResponses'), id])
            redirect(action: "list")
            return
        }

        [projectResponsesInstance: projectResponsesInstance, namaProyek:getProjectName(), stakeholder:getStakeholder()]
    }

    def update(Long id, Long version) {
        def projectResponsesInstance = ProjectResponses.get(id)
        if (!projectResponsesInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectResponses.label', default: 'ProjectResponses'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (projectResponsesInstance.version > version) {
                projectResponsesInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'projectResponses.label', default: 'ProjectResponses')] as Object[],
                        "Another user has updated this ProjectResponses while you were editing")
                render(view: "edit", model: [projectResponsesInstance: projectResponsesInstance])
                return
            }
        }

        projectResponsesInstance.properties = params

        if (!projectResponsesInstance.save(flush: true)) {
            render(view: "edit", model: [projectResponsesInstance: projectResponsesInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'projectResponses.label', default: 'ProjectResponses'), projectResponsesInstance.id])
        redirect(action: "show", id: projectResponsesInstance.id)
    }

    def delete(Long id) {
        def projectResponsesInstance = ProjectResponses.get(id)
        if (!projectResponsesInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectResponses.label', default: 'ProjectResponses'), id])
            redirect(action: "list")
            return
        }

        try {
            projectResponsesInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'projectResponses.label', default: 'ProjectResponses'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'projectResponses.label', default: 'ProjectResponses'), id])
            redirect(action: "show", id: id)
        }
    }
}
