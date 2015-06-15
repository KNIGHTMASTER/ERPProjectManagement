package ProjectCommunicationManagement.ManageStakeholderExpectations

import FuzzyQuantitative.*
import ProjectCommunicationManagement.IdentifyStakeholders.StakeholderRegister
import ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter
import ProjectIntegrationManagement.DevelopProjectCharter.ProjectProposal
import ProjectIntegrationManagement.DevelopProjectCharter.StatementOfWork
import ProjectScopeManagement.VerifyScope.Inspection
import ProjectTimeManagement.DefineActivity.GanttController
import grails.plugins.springsecurity.Secured
import org.springframework.dao.DataIntegrityViolationException

class ProjectResponseQualityController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    @Secured(['ROLE_ADMIN', 'ROLE_PCOM'])
    def index() {
        if(session.proyek){
            redirect(action: "list", params: params)
        }else{
            redirect uri:'/chooseProject?tautan=ProjectResponseQuality'
        }
    }

    def getStakeholderFuzzy(){
        def stakeholderFuzzy = new Fuzzy()
        def data
        if(session.proyek){
            def temp = StatementOfWork.get(session.proyek)
            temp = ProjectProposal.findByProjectName(temp)
            temp = ProjectCharter.findByProjectName(temp)
            data = ProjectResponseQuality.findAllByProjectCharter(temp)
        }else{
            data = ProjectResponseQuality.list()
        }

        def hasil = []
        data.each{
            //(10*it.cost)/ 4
            //(10*it.time)/ 4
            stakeholderFuzzy.setQuality((4*it.quality)/10)
            stakeholderFuzzy.setScope((4*it.scope)/10)
            stakeholderFuzzy.mainCore()
            hasil.add(stakeholderFuzzy.getDefuzzifikasi())
        }
        return hasil
    }

    def getMiuQuality(){
        def stakeholderFuzzy = new Fuzzy()
        def data
        if(session.proyek){
            def temp = StatementOfWork.get(session.proyek)
            temp = ProjectProposal.findByProjectName(temp)
            temp = ProjectCharter.findByProjectName(temp)
            data = ProjectResponseQuality.findAllByProjectCharter(temp)
        }else{
            data = ProjectResponseQuality.list()
        }
        def hasil = []
        data.each{
            stakeholderFuzzy.setQuality((4*it.quality)/10)
            stakeholderFuzzy.setScope((4*it.scope)/10)
            stakeholderFuzzy.mainCore()
            hasil.add(stakeholderFuzzy.getMiuquality())
        }
        return hasil
    }

    def getMiuScope(){
        def stakeholderFuzzy = new Fuzzy()
        def data
        if(session.proyek){
            def temp = StatementOfWork.get(session.proyek)
            temp = ProjectProposal.findByProjectName(temp)
            temp = ProjectCharter.findByProjectName(temp)
            data = ProjectResponseQuality.findAllByProjectCharter(temp)
        }else{
            data = ProjectResponseQuality.list()
        }
        def hasil = []
        data.each{
            stakeholderFuzzy.setQuality((4*it.quality)/10)
            stakeholderFuzzy.setScope((4*it.scope)/10)
            stakeholderFuzzy.mainCore()
            hasil.add(stakeholderFuzzy.getMiuscope())
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

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def results
        def ganttObj
        def inspectionList
        if(session.proyek){
            def temp = StatementOfWork.get(session.proyek)
            temp = ProjectProposal.findByProjectName(temp)
            temp = ProjectCharter.findByProjectName(temp)
            results = ProjectResponseQuality.findAllByProjectCharter(temp)
            inspectionList = Inspection.findAllByProjectName(temp)
            ganttObj = new GanttController()
        }else{
            results = ProjectResponseQuality.list(params)
        }
        [projectResponseQualityInstanceList: results, projectResponseQualityInstanceTotal: ProjectResponseQuality.count(), miuQuality:getMiuQuality(), miuScope:getMiuScope(), hasilDefuzzifikasi:getStakeholderFuzzy(), sortAscDefuzzi:getStakeholderFuzzy().sort(), sortDescDefuzzi:getSortDefuzzifikasi(), gantt: ganttObj.createGanttChart(), inspectionInstanceList:inspectionList]
    }

    def create() {
        [projectResponseQualityInstance: new ProjectResponseQuality(params), namaProyek:getProjectName(), stakeholder:getStakeholder()]
    }

    def save() {
        def projectResponseQualityInstance = new ProjectResponseQuality(params)
        if (!projectResponseQualityInstance.save(flush: true)) {
            render(view: "create", model: [projectResponseQualityInstance: projectResponseQualityInstance])
            return
        }

        /*def quality = projectResponseQualityInstance.quality
        def qualityResult = (quality*4)/10

        def scope = projectResponseQualityInstance.scope
        def scopeResult = (scope*4)/10


        projectResponseQualityInstance.quality = qualityResult
        projectResponseQualityInstance.scope = scopeResult*/

        flash.message = message(code: 'default.created.message', args: [message(code: 'projectResponseQuality.label', default: 'ProjectResponseQuality'), projectResponseQualityInstance.id])
        redirect(action: "show", id: projectResponseQualityInstance.id)
    }

    def show(Long id) {
        def projectResponseQualityInstance = ProjectResponseQuality.get(id)
        if (!projectResponseQualityInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectResponseQuality.label', default: 'ProjectResponseQuality'), id])
            redirect(action: "list")
            return
        }

        [projectResponseQualityInstance: projectResponseQualityInstance]
    }

    def edit(Long id) {
        def projectResponseQualityInstance = ProjectResponseQuality.get(id)
        if (!projectResponseQualityInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectResponseQuality.label', default: 'ProjectResponseQuality'), id])
            redirect(action: "list")
            return
        }

        [projectResponseQualityInstance: projectResponseQualityInstance, namaProyek:getProjectName(), stakeholder:getStakeholder()]
    }

    def update(Long id, Long version) {
        def projectResponseQualityInstance = ProjectResponseQuality.get(id)
        if (!projectResponseQualityInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectResponseQuality.label', default: 'ProjectResponseQuality'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (projectResponseQualityInstance.version > version) {
                projectResponseQualityInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'projectResponseQuality.label', default: 'ProjectResponseQuality')] as Object[],
                        "Another user has updated this ProjectResponseQuality while you were editing")
                render(view: "edit", model: [projectResponseQualityInstance: projectResponseQualityInstance])
                return
            }
        }

        projectResponseQualityInstance.properties = params

        if (!projectResponseQualityInstance.save(flush: true)) {
            render(view: "edit", model: [projectResponseQualityInstance: projectResponseQualityInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'projectResponseQuality.label', default: 'ProjectResponseQuality'), projectResponseQualityInstance.id])
        redirect(action: "show", id: projectResponseQualityInstance.id)
    }

    def delete(Long id) {
        def projectResponseQualityInstance = ProjectResponseQuality.get(id)
        if (!projectResponseQualityInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectResponseQuality.label', default: 'ProjectResponseQuality'), id])
            redirect(action: "list")
            return
        }

        try {
            projectResponseQualityInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'projectResponseQuality.label', default: 'ProjectResponseQuality'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'projectResponseQuality.label', default: 'ProjectResponseQuality'), id])
            redirect(action: "show", id: id)
        }
    }
}
