package ProjectIntegrationManagement.DevelopProjectCharter

import grails.plugins.springsecurity.Secured
import org.springframework.dao.DataIntegrityViolationException

import ProjectIntegrationManagement.DevelopProjectCharter.*

import groovy.sql.Sql

class CostBenefitAnalysisController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    @Secured(['ROLE_ADMIN', 'ROLE_PM'])
    def index() {
        if(session.proyek){
            redirect(action: "list", params: params)
        }else{
            redirect uri:'/chooseProject?tautan=CostBenefitAnalysis'
        }
    }

    def getProyekId(){
        def hasil = CostBenefitAnalysis.executeQuery('select distinct proyekid from CostBenefitAnalysis')
        return hasil
    }
    
    def list(Integer max) {
        params.max = Math.min(max ?: 30, 100)
        
        def results
    
        /*def proyekIds = getProyekId()
        
        if(proyekIds.size() <2 ){
            if(proyekIds.size() == 0){
                proyekIds[0] = 0
                proyekIds[1] = 0
            }else if(proyekIds.size() == 1){
                proyekIds[0] = getProyekId()
                proyekIds[1] = 0
            }            
        }else{
        }
        if (params.keyWord) {
            def kataKunci = params.keyWord            
        
            results = CostBenefitAnalysis.findAllByProyekid(kataKunci)
            /*results = CostBenefitAnalysis.where {
                proyekid == kataKunci
            }*/
        /*} else {
            if(CostBenefitAnalysis.count() == 0){
                results = CostBenefitAnalysis.list(params)
            }else{
                results = CostBenefitAnalysis.findAllByProyekid(1)
            }*/
        def results2
        def results3
        def results4
        if(session.proyek){
            def cari = StatementOfWork.get(session.proyek)
            results2 = ProjectProposal.findByProjectName(cari)
            results3 = BusinessCase.findByProjectName(results2)
            results4 = CostBenefitAnalysis.findAllByProjectName(results3)
        }else{
            results4 = CostBenefitAnalysis.list(params)
        }

        [costBenefitAnalysisInstanceList:results4, costBenefitAnalysisInstanceTotal: CostBenefitAnalysis.count()]
    }

    def create() {
        [costBenefitAnalysisInstance: new CostBenefitAnalysis(params)]
    }

    def save() {     
        def costBenefitAnalysisInstance = new CostBenefitAnalysis(params)
        if (!costBenefitAnalysisInstance.save(flush: true)) {
            render(view: "create", model: [costBenefitAnalysisInstance: costBenefitAnalysisInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'costBenefitAnalysis.label', default: 'CostBenefitAnalysis'), costBenefitAnalysisInstance.id])
        redirect(action: "show", id: costBenefitAnalysisInstance.id)
    }

    def show(Long id) {
        def costBenefitAnalysisInstance = CostBenefitAnalysis.get(id)
        if (!costBenefitAnalysisInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'costBenefitAnalysis.label', default: 'CostBenefitAnalysis'), id])
            redirect(action: "list")
            return
        }       
         
        def hasil = []
        int b = 0
        Sql.withInstance("jdbc:h2:tcp://localhost/PRAM", "sa", "", "org.h2.Driver"){sql ->
            sql.eachRow('SELECT PROJECT_NAME_ID FROM COST_BENEFIT_ANALYSIS'){
                hasil[b] = "$it.PROJECT_NAME_ID"
                b++
            }
        }
            
        def i = CostBenefitAnalysis.count()
        for(int a=0; a<i; a++){
            Sql.withInstance("jdbc:h2:tcp://localhost/PRAM", "sa", "", "org.h2.Driver"){sql ->
                sql.execute('UPDATE COST_BENEFIT_ANALYSIS SET PROYEKID = '+hasil[a]+' WHERE PROJECT_NAME_ID = '+hasil[a])
            }
        }
        [costBenefitAnalysisInstance: costBenefitAnalysisInstance]
    }

    def edit(Long id) {
        def costBenefitAnalysisInstance = CostBenefitAnalysis.get(id)
        if (!costBenefitAnalysisInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'costBenefitAnalysis.label', default: 'CostBenefitAnalysis'), id])
            redirect(action: "list")
            return
        }

        [costBenefitAnalysisInstance: costBenefitAnalysisInstance]
    }

    def update(Long id, Long version) {
        def costBenefitAnalysisInstance = CostBenefitAnalysis.get(id)
        if (!costBenefitAnalysisInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'costBenefitAnalysis.label', default: 'CostBenefitAnalysis'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (costBenefitAnalysisInstance.version > version) {
                costBenefitAnalysisInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'costBenefitAnalysis.label', default: 'CostBenefitAnalysis')] as Object[],
                          "Another user has updated this CostBenefitAnalysis while you were editing")
                render(view: "edit", model: [costBenefitAnalysisInstance: costBenefitAnalysisInstance])
                return
            }
        }

        costBenefitAnalysisInstance.properties = params

        if (!costBenefitAnalysisInstance.save(flush: true)) {
            render(view: "edit", model: [costBenefitAnalysisInstance: costBenefitAnalysisInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'costBenefitAnalysis.label', default: 'CostBenefitAnalysis'), costBenefitAnalysisInstance.id])
        redirect(action: "show", id: costBenefitAnalysisInstance.id)
    }

    def delete(Long id) {
        def costBenefitAnalysisInstance = CostBenefitAnalysis.get(id)
        if (!costBenefitAnalysisInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'costBenefitAnalysis.label', default: 'CostBenefitAnalysis'), id])
            redirect(action: "list")
            return
        }

        try {
            costBenefitAnalysisInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'costBenefitAnalysis.label', default: 'CostBenefitAnalysis'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'costBenefitAnalysis.label', default: 'CostBenefitAnalysis'), id])
            redirect(action: "show", id: id)
        }
    }
}
