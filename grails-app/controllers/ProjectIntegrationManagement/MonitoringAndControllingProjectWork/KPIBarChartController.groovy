package ProjectIntegrationManagement.MonitoringAndControllingProjectWork
import ProjectCostManagement.DetermineBudget.*
import ProjectIntegrationManagement.DevelopProjectCharter.Payment
import ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter
import ProjectIntegrationManagement.DevelopProjectCharter.ProjectProposal
import ProjectIntegrationManagement.DevelopProjectCharter.StatementOfWork;
import ProjectTimeManagement.DefineActivity.*;
import ProjectHumanResourceManagement.*;
import ProjectRiskManagement.Planning.*;
import ProjectProcurementManagement.ConductProcurements.*;
import ProjectProcurementManagement.AdministerProcurements.*
import grails.plugins.springsecurity.Secured;

class KPIBarChartController {
    @Secured(['ROLE_ADMIN', 'ROLE_PM'])
    def index() {
        def namaProyek
        if(session.proyek){
            namaProyek = StatementOfWork.get(session.proyek)
            namaProyek = namaProyek.projectName
            [data2:createChartBar(), namaProyek:namaProyek]
        }else{
            namaProyek = ""
            redirect uri:"/chooseProject?tautan=KPIBarChart"
        }
    }
//==================START OBJECT QUERY=================
    //MATERIAL COST ACTIVITY
    def get_EV_MaterialCostActivity(){
        def result = 0
        if(session.proyek){
            def sow = StatementOfWork.get(session.proyek)
            def milestones = sow.milestones
            def activities
            def materialCostActivities
            milestones.each{
                activities = Activity.executeQuery("select t from Activity t where idMilestone=${it.id}")
                activities.each{
                    materialCostActivities = MaterialCostActivity.executeQuery("select t from MaterialCostActivity t where activity = ${it.id}")
                    materialCostActivities.each{
                        result += it.earnedValue
                    }
                }
            }
        }else{
            def data = MaterialCostActivity.list()
            data.each {
                result+=it.earnedValue
            }
        }
        return result
    }

    def get_AC_MaterialCostActivity(){
        def result = 0
        if(session.proyek){
            def sow = StatementOfWork.get(session.proyek)
            def milestones = sow.milestones
            def activities
            def materialCostActivities
            milestones.each{
                activities = Activity.executeQuery("select t from Activity t where idMilestone=${it.id}")
                activities.each{
                    materialCostActivities = MaterialCostActivity.executeQuery("select t from MaterialCostActivity t where activity = ${it.id}")
                    materialCostActivities.each{
                        result += it.actualCost
                    }
                }
            }
        }else{
            def data = MaterialCostActivity.list()
            data.each {
                result+=it.actualCost
            }
        }
        return result
    }

    //MANAGEMENT COST ACTIVITY
    def get_EV_ManagementCostActivity(){
        def result = 0
        if(session.proyek){
            def sow = StatementOfWork.get(session.proyek)
            def proposal = ProjectProposal.findByProjectName(sow)
            def charter = ProjectCharter.findByProjectName(proposal)
            def cost = Cost.findAllByProject(charter)
            def managementCostActivities
            cost.each{
                managementCostActivities = ManagementCostActivity.executeQuery("select t from ManagementCostActivity t where t.cost=${it.id}")
                managementCostActivities.each {
                    result += it.earnedValue
                }
            }
        }else{
            def data = ManagementCostActivity.list()
            data.each {
                result+=it.earnedValue
            }
        }
        return result
    }

    def get_AC_ManagementCostActivity(){
        def result = 0
        if(session.proyek){
            def sow = StatementOfWork.get(session.proyek)
            def proposal = ProjectProposal.findByProjectName(sow)
            def charter = ProjectCharter.findByProjectName(proposal)
            def cost = Cost.findAllByProject(charter)
            def managementCostActivities
            cost.each{
                managementCostActivities = ManagementCostActivity.executeQuery("select t from ManagementCostActivity t where t.cost=${it.id}")
                managementCostActivities.each {
                    result += it.actualCost
                }
            }
        }else{
            def data = ManagementCostActivity.list()
            data.each {
                result+=it.actualCost
            }
        }
        return result
    }

    //ACTIVITY COST
    def get_EV_ActivityCost(){
        def result = 0
        if(session.proyek){
            def sow = StatementOfWork.get(session.proyek)
            def milestones = sow.milestones
            def activities
            def activityCost
            milestones.each{
                activities = Activity.executeQuery("select t from Activity t where idMilestone=${it.id}")
                activities.each{
                    activityCost = ActivityCost.executeQuery("select t from ActivityCost t where activity = ${it.id}")
                    activityCost.each{
                        result += it.earnedValue
                    }
                }
            }
        }else{
            def data = ActivityCost.list()
            data.each {
                result+=it.earnedValue
            }
        }
        return result
    }

    def get_AC_ActivityCost(){
        def result = 0
        if(session.proyek){
            def sow = StatementOfWork.get(session.proyek)
            def milestones = sow.milestones
            def activities
            def activityCost
            milestones.each{
                activities = Activity.executeQuery("select t from Activity t where idMilestone=${it.id}")
                activities.each{
                    activityCost = ActivityCost.executeQuery("select t from ActivityCost t where activity = ${it.id}")
                    activityCost.each{
                        result += it.actualCost
                    }
                }
            }
        }else{
            def data = ActivityCost.list()
            data.each {
                result+=it.actualCost
            }
        }
        return result
    }


    //EV TOTAL : MATERIAL + MANAGEMENT + ACTIVITY
    def getEvTotal(){
        return get_EV_ActivityCost()+get_EV_ManagementCostActivity()+get_EV_MaterialCostActivity()
    }

    //AC TOTAL : MATERIAL + MANAGEMENT + ACTIVITY
    def getAcTotal(){
        return get_AC_ActivityCost()+get_AC_ManagementCostActivity()+get_AC_MaterialCostActivity()
    }

    //PAYMENT
    def getIncome(){
        def result = 0
        if(session.proyek){
            def sow = StatementOfWork.get(session.proyek)
            def proposal = ProjectProposal.findByProjectName(sow)
            def charter = ProjectCharter.findByProjectName(proposal)
            def payment = Payment.findAllByProjectName(charter)
            payment.each{
                result += it.cost
            }
        }else{
            def data = Payment.list()
            data.each{
                result += it.cost
            }
        }
        return result
    }

    //BALANCE
    def getNetIncome(){
        def result
        if(session.proyek){
            def sow = StatementOfWork.get(session.proyek)
            def proposal = ProjectProposal.findByProjectName(sow)
            def charter = ProjectCharter.findByProjectName(proposal)
            def budget =  Budget.findByProject(charter)
            result = budget.balance
        }else{
            def data = Budget.list()
            data.each{
                result += it.balance
            }
        }
        return result
    }

    //Modal
    def getShareHolderEquity(){
        def result
        if(session.proyek){
            def sow = StatementOfWork.get(session.proyek)
            def proposal = ProjectProposal.findByProjectName(sow)
            def charter = ProjectCharter.findByProjectName(proposal)
            def she =  Modal.findByProjectName(charter)
            result = she.value
        }else{
            def data = Modal.list()
            data.each{
                result += it.value
            }
        }
        return result
    }

    //PV HRM
    def getPV_HumanResource(){
        def result = 0
        if(session.proyek){
            def sow = StatementOfWork.get(session.proyek)
            def milestones = sow.milestones
            def activities
            def activityCost
            milestones.each{
                activities = Activity.executeQuery("select t from Activity t where idMilestone=${it.id}")
                activities.each{
                    activityCost = ActivityCost.executeQuery("select t from ActivityCost t where activity = ${it.id}")
                    activityCost.each{
                        result += it.total
                    }
                }
            }
        }else{
            def data = ActivityCost.list()
            data.each {
                result+=it.total
            }
        }
        return result
    }

    //PV Management
    def getPV_Management(){
        def result = 0
        if(session.proyek){
            def sow = StatementOfWork.get(session.proyek)
            def proposal = ProjectProposal.findByProjectName(sow)
            def charter = ProjectCharter.findByProjectName(proposal)
            def cost = Cost.findAllByProject(charter)
            def managementCostActivities
            cost.each{
                managementCostActivities = ManagementCostActivity.executeQuery("select t from ManagementCostActivity t where t.cost=${it.id}")
                managementCostActivities.each {
                    result += it.price
                }
            }
        }else{
            def data = ManagementCostActivity.list()
            data.each {
                result+=it.price
            }
        }
        return result
    }

    //PV Material
    def getPV_Material(){

        def result = 0
        if(session.proyek){
            def sow = StatementOfWork.get(session.proyek)
            def milestones = sow.milestones
            def activities
            def materialCostActivities
            milestones.each{
                activities = Activity.executeQuery("select t from Activity t where idMilestone=${it.id}")
                activities.each{
                    materialCostActivities = MaterialCostActivity.executeQuery("select t from MaterialCostActivity t where activity = ${it.id}")
                    materialCostActivities.each{
                        result += it.total
                    }
                }
            }
        }else{
            def data = MaterialCostActivity.list()
            data.each {
                result+=it.total
            }
        }
        return result
    }

    def getPVTotal(){
        return getPV_HumanResource() + getPV_Management() + getPV_Material()
    }

    //n Activity per proyek
    def getN_Activity(){
        def hasil = 0
        if(session.proyek){
            def activities = []
            def sow = StatementOfWork.get(session.proyek)
            def milestones = sow.milestones
            milestones.each{
                activities.add(it.activity)
            }
            hasil = activities.size()
        }else{
            hasil = Activity.list().size()
        }
        return hasil
    }

    def getN_Delay(){
        def hasil = 0
        if(session.proyek){
            def activities
            def sow = StatementOfWork.get(session.proyek)
            def milestones = sow.milestones
            def delays
            milestones.each{
                activities = Activity.executeQuery("select t from Activity t where t.idMilestone=${it.id}")
                activities.each{
                    delays = DelayActivity.executeQuery("select t from DelayActivity t where t.activity=${it.id}")
                    delays.each {
                        hasil += 1
                    }
                }
            }
        }else{
            hasil = DelayActivity.list().size()
        }

        return hasil
    }

    def getLossTime(){
        def hasil = 0
        if(session.proyek){
            def activities
            def sow = StatementOfWork.get(session.proyek)
            def milestones = sow.milestones
            def delays
            milestones.each{
                activities = Activity.executeQuery("select t from Activity t where t.idMilestone=${it.id}")
                activities.each{
                    delays = DelayActivity.executeQuery("select t from DelayActivity t where t.activity=${it.id}")
                    delays.each {
                        hasil += it.difference
                    }
                }
            }
        }else{
            def data = DelayActivity.list()
            data.each{
                hasil += it.difference
            }
        }
        return hasil
    }

    def getNRiskIdentified(){
        def result = 0
        if(session.proyek){
            def sow = StatementOfWork.get(session.proyek)
            def proposal = ProjectProposal.findByProjectName(sow)
            def charter = ProjectCharter.findByProjectName(proposal)
            def riskCategories = RiskCategories.findAllByProjectCharter(charter)
            riskCategories.each{
                result += 1
            }
        }else{
            RiskCategories.list().size()
        }
        return result
    }

    def getNCostRisk(){
        def result = 0
        if(session.proyek){
            def sow = StatementOfWork.get(session.proyek)
            def proposal = ProjectProposal.findByProjectName(sow)
            def charter = ProjectCharter.findByProjectName(proposal)
            def r
            def identificationCost
            charter.each{
                r = RiskCategories.executeQuery("select t from RiskCategories t where t.projectCharter = ${it.id}")
                r.each{
                    identificationCost = IdentificationCostManagementPlan.executeQuery("select t from ProjectRiskManagement.Planning.IdentificationCostManagementPlan t where t.riskCategories = ${it.id}")
                    identificationCost.each{
                        result += 1
                    }
                }
            }
        }else{
            result = IdentificationCostManagementPlan.list().size()
        }
        return result
    }

    def getNTimeRisk(){
        def result = 0
        if(session.proyek){
            def sow = StatementOfWork.get(session.proyek)
            def proposal = ProjectProposal.findByProjectName(sow)
            def charter = ProjectCharter.findByProjectName(proposal)
            def r
            def identificationCost
            charter.each{
                r = RiskCategories.executeQuery("select t from RiskCategories t where t.projectCharter = ${it.id}")
                r.each{
                    identificationCost = IdentificationTimeManagementPlan.executeQuery("select t from ProjectRiskManagement.Planning.IdentificationTimeManagementPlan t where t.riskCategories = ${it.id}")
                    identificationCost.each{
                        result += 1
                    }
                }
            }
        }else{
            result = IdentificationTimeManagementPlan.list().size()
        }
        return result
    }

    def getNScopeRisk(){
        def result = 0
        if(session.proyek){
            def sow = StatementOfWork.get(session.proyek)
            def proposal = ProjectProposal.findByProjectName(sow)
            def charter = ProjectCharter.findByProjectName(proposal)
            def r
            def identificationCost
            charter.each{
                r = RiskCategories.executeQuery("select t from RiskCategories t where t.projectCharter = ${it.id}")
                r.each{
                    identificationCost = IdentificationProjectScopeStatement.executeQuery("select t from ProjectRiskManagement.Planning.IdentificationProjectScopeStatement t where t.riskCategories = ${it.id}")
                    identificationCost.each{
                        result += 1
                    }
                }
            }
        }else{
            result = IdentificationProjectScopeStatement.list().size()
        }
        return result
    }

    def getNVendor(){
        def result = 0
        if(session.proyek){
            def sow = StatementOfWork.get(session.proyek)
            def proposal = ProjectProposal.findByProjectName(sow)
            def charter = ProjectCharter.findByProjectName(proposal)
            def vendor = VendorRegister.findAllByProjectName(charter)
            vendor.each{
                result += 1
            }
        }else{
            result = VendorRegister.list().size()
        }
        return result
    }

    def getNAcceptedVendor(){
        def result = 0
        if(session.proyek){
            def sow = StatementOfWork.get(session.proyek)
            def proposal = ProjectProposal.findByProjectName(sow)
            def charter = ProjectCharter.findByProjectName(proposal)
            def vendor
            charter.each{
                vendor = Contract.executeQuery("select distinct vendorName from Contract t where t.id=${it.id}")
                vendor.each {
                    result += 1
                }
            }
        }else{
            result = VendorRegister.list().size()
        }
        return result
    }

    def getNStakeholder(){
        def result = 0
        if(session.proyek){
            def sow = StatementOfWork.get(session.proyek)
            def employee = Employee.findAllByProject(sow)
            employee.each{
                result += 1
            }
        }else{
            result = Employee.list().size()
        }
        return result
    }

    def getNComplain(){
        def result = 0
        if(session.proyek){
            def sow = StatementOfWork.get(session.proyek)
            def complain = Customer.findAllByProjectName(sow)
            complain.each{
                result += 1
            }
        }else{
            result = Customer.list().size()
        }
        return result
    }

    def getTotalDay(){
        def hasil = 0
        if(session.proyek){
            def activities
            def sow = StatementOfWork.get(session.proyek)
            def milestones = sow.milestones
            milestones.each{
                activities = it.activity
                activities.each {
                    hasil += it.duration
                }
            }
        }else{
            def data = Activity.list()
            data.each{
                hasil += it.duration
            }
        }
        return hasil
    }

    //==================END OF OBJECT QUERY=================


def roundFunc(double value){
        double result;
        if(value<=0.1111111111111111){
            result = 1/9;
        }else if((value>=0.6666666665) && (value<=2)){
            result = 1;
        }else if((value>2) && (value<=4)){
            result = 3
        }else if((value>4) && (value<=6)){
            result = 5;
        }else if((value>6) && (value<=8)){
            result = 7;
        }else if(value>8){
            result = 9;
        }else if((value>=0.2666666665) && (value<0.6666666665)){
            result = 1/3;
        }else if((value>=0.1714285715)&&(value<0.2666666665)){
            result = 1/5;
        }else if((value>=0.126984127) && (value<0.1714285715)){
            result = 1/7;
        }
        return result;
    }
    
    def showMatrix(){
        render createMatrix();
    }
    def roundingMatrix(){
        createMatrix();
        for(int a=0; a<5; a++){
            for(int b=0; b<5; b++){
                matrix[a][b] = roundFunc(matrix[a][b]);
            }
        }
        return matrix;
    }
    
    def showRoundingMatrix(){
        render roundingMatrix();
    }
    def low = new double[5][5];
    def med = new double[5][5];
    def up = new double[5][5];
    
    def convLow(double value){
        double result = 0;
        if(value == 1){
            result = 1;
        }else if(value==3){
            result = 1;
        }else if(value==5){
            result = 3;
        }else if(value==7){
            result = 5;
        }else if(value==9){
            result = 7;
        }else if(value ==  1/3){
            result = 1/5;
        }else if(value == 1/5){
            result = 1/7;
        }else if(value == 1/7){
            result = 1/9;
        }else if(value == 1/9){
            result = 1/11;
        }
            return result;        
    }
    
    def convUp(double value){
        double result = 0;
        if(value == 1){
            result = 1;
        }else if(value==3){
            result = 5;
        }else if(value==5){
            result = 7;
        }else if(value==7){
            result = 9;
        }else if(value==9){
            result = 11;
        }else if(value ==  1/3){
            result = 1;
        }else if(value == 1/5){
            result = 1/3;
        }else if(value == 1/7){
            result = 1/5;
        }else if(value == 1/9){
            result = 1/7;
        }
            return result;        
    }
    
    def isiLow(int bar, int kol, roundMatrix){
        def hasil = new double[bar][kol];
        for(int a=0; a<bar; a++){
            for(int b=0; b<kol; b++){
                if(a==b){
                    hasil[a][b] = 1;                    
                }
                else{
                    hasil[a][b] = convLow(roundMatrix[a][b]);                    
                }
            }
        }
        return hasil;
    }
    def isiMed(int bar, int kol, roundMatrix){        
        def hasil = new double[bar][kol];
        for(int a=0; a<bar; a++){
            for(int b=0; b<kol; b++){
                if(a==b){
                    hasil[a][b] = 1;                    
                }
                else{
                    hasil[a][b] = roundMatrix[a][b];                   
                }
            }
        }
        return hasil;
    }
    
    def isiUp(int bar, int kol, roundMatrix){        
        def hasil = new double[bar][kol];
        for(int a=0; a<bar; a++){
            for(int b=0; b<kol; b++){
                if(a==b){
                    hasil[a][b] = 1;                    
                }
                else{
                    hasil[a][b] = convUp(roundMatrix[a][b]);                    
                }
            }
        }
        return hasil;
    }
    
    def showLow(){
        render isiLow();
    }
    def showMed(){
        render isiMed();
    }
    def showUp(){
        render isiUp();
    }
    def sumLow = new double[5];
    def sumPerLineLow(){
        isiLow();
        for(int a=0; a<5; a++){
            for(int b=0; b<5; b++){
                sumLow[a]+=low[a][b];
            }
        }
        return sumLow;
    }
    def showSumPerLineLow(){
        render sumPerLineLow();
    }
    
    def getTotalLow(int bar, data){
        double total = 0;
        for(int a=0; a<bar; a++){
            total+=data[a];
        }
        return total;
    }
    def showTotalLow(){
        render getTotalLow();
    }
    def sumMed = new double[5];
    def sumPerLineMed(){
        isiMed();
        for(int a=0; a<5; a++){
            for(int b=0; b<5; b++){
                sumMed[a]+=med[a][b];
            }
        }
        return sumMed;
    }
    def showSumPerLineMed(){
        render sumPerLineMed();
    }
    
    def getTotalMed(int bar, data){
        double total = 0;
        for(int a=0; a<bar; a++){
            total+=data[a];
        }
        return total;
    }
    
    def sumUp = new double[5];
    def sumPerLineUp(){
        isiUp();        
        for(int a=0; a<5; a++){
            for(int b=0; b<5; b++){
                sumUp[a]+=up[a][b];
            }
        }
        return sumUp
    }
    
    def showSumPerLineUp(){
        render sumPerLineUp();
    }
    
    def getTotalUp(int bar, data){
        double total = 0;
        for(int a=0; a<bar; a++){
            total+=data[a];
        }
        return total;
    }
    
    //def triangularMatrix = new double[5][3];
    
    def joinTriangularMatrix(){
        def totalLow = getTotalLow();
        def totalMed = getTotalMed();
        def totalUp = getTotalUp();
        
        def sumPerLineUp = sumUp
        def sumPerLineMed = sumMed;
        def sumPerLineLow = sumLow;
        
        for(int a=0; a<5; a++){
            for(int b=0; b<3; b++){
                if(b==0){
                    triangularMatrix[a][b] = sumPerLineLow[a]/totalUp;
                }else if(b==1){
                    triangularMatrix[a][b] = sumPerLineMed[a]/totalMed;
                }else if(b==2){
                    triangularMatrix[a][b] = totalLow/sumPerLineUp[a];
                }
            }
        }                
    }
    
    def showTriangularMatrix(){
        render triangularMatrix();
    }
    
    def isiTempData(int index, triangularMatrix){
        def hasil = new double[3];
        for(int a=0; a<3; a++){
            hasil[a] = triangularMatrix[index][a];
        }
        return hasil;
    }
    
    def finalMatrix = new double[4][5];
    def tempData1 = new double[3];
    def tempData2 = new double[3];
    def isiFinalMatrix(){
        double hasil;
        if(tempData2[1]>=tempData1[1]){
            hasil=1;
        }else if(tempData1[0]>=tempData2[2]){
            hasil=0;
        }else{
            hasil = (tempData1[0]-tempData2[2])/((tempData2[1]-tempData2[2])-(tempData1[1]-tempData1[0]));
        }
        return hasil;
    }

    def createFinalMatrix(int bar, int kol, triangularMatrix){
        def hasil = new double[bar][kol];
        for(int a=0; a<bar; a++){
            for(int b=0; b<kol; b++){                
                tempData2 = isiTempData(b, triangularMatrix);
                if(b<=a){
                    tempData1 = isiTempData((a+1), triangularMatrix);
                }else if(b>a){
                    tempData1 = isiTempData((a), triangularMatrix);
                }
                hasil[a][b] = isiFinalMatrix();
            }            
        }
        return hasil;
    }
    
    def showFinalMatrix(){
        createFinalMatrix();
        render finalMatrix;
    }
    
    def transFinalMatrix = new double[5][4];
    
    def createTransFinalMatrix(int bar, int kol, finalMatrix){
        def hasil = new double[bar][kol];
        for(int a=0; a<kol; a++){
            for(int b=0; b<bar; b++){
                hasil[b][a] = finalMatrix[a][b];
            }
        }
        return hasil;
    }
    
    def showTransFinalMatrix(){
        createTransFinalMatrix();
        render transFinalMatrix;
    }
        
    def createMatrixMin(int bar, int kol, transFinalMatrix){
        def hasil = new double[bar]
        for(int a=0; a<bar; a++){    
            double tempMin = transFinalMatrix[a][0];
            for(int b=0; b<kol; b++){                
                if(transFinalMatrix[a][b]<=tempMin){                    
                    hasil[a] = transFinalMatrix[a][b];
                }
            }
        }
        return hasil;
    }
    
    def showMatrixMin(){
        createMatrixMin();
        render matrixMin;
    }
    
    def sumMatrixMin(int n, matrixMin){
        double hasil = 0;
        for(int a=0; a<n; a++){
            hasil+=matrixMin[a];
        }
        return hasil;
    }
    
    def showSumMatrixMin(){
        render sumMatrixMin();
    }
    
    def matrixHasil = new double[5];
    
    def createMatrixHasil(int n, matrixMin, sumMatrixMin){
        def hasil = new double[n];
        for(int a=0; a<n; a++){
            hasil[a] = matrixMin[a]/sumMatrixMin;
        }
        return hasil;
    }
    
    def showMatrixHasil(){
        createMatrixHasil();
        render matrixHasil;
    }
    
    def sumMatrixHasil(int n, matrixHasil){
        double hasil = 0;
        for(int a=0; a<n; a++){
            hasil+=matrixHasil[a];
        }        
        return hasil;
    }
    
    def showSumMatrixHasil(){        
        render sumMatrixHasil();
    }    
    
     
    
    /*proses KPI CUSTOMER*/            
    
    def getValueFormula(String key, String tableName){
        def query=Customer.executeQuery('select '+key+' from '+ tableName);
        def a=0;
        BigDecimal hasil = 0;
        query.each{
            hasil+=query.get(a);
            a++
        }   
        return hasil;
    }        
    
    def getFormula(def a, def b){
        return a/b;
    }

    def isiKPIFinance(def a, def b, def c, def d, def e){
        def hasil = new double[5];
        hasil[0] = a;
        hasil[1] = b;
        hasil[2] = c;
        hasil[3] = d;
        hasil[4] = e;
        return hasil;
    }    
    
    def isiKPICustomer(def a, def b){
        def hasil = new double[2];
        hasil[0] = a;
        hasil[1] = b;
        return hasil;
    }

    def createMatrix(def bar, def kol, daftarKPI){
        def matrix = new double[bar][kol];
        def tempPos=new int[bar];
        for(int a=0; a<bar; a++){
                for(int b=0; b<kol; b++){
                    if(a==b){
                        matrix[a][b]=1;
                        tempPos[a] = a;
                    }
                }
        }
        for(int a=0; a<bar; a++){
            for(int b=0; b<kol; b++){
                if(b>tempPos[a]){
                    //for(int c=0; c<kol; c++){
                        matrix[a][b] = daftarKPI[a]/daftarKPI[b]; 
                        if(matrix[a][b]==Double.POSITIVE_INFINITY || matrix[a][b]==Double.NEGATIVE_INFINITY){
                            matrix[a][b]=9;
                        }
                    //}                    
                }else if(b<tempPos[a]){
                    matrix[a][b] = 1/matrix[b][a];                    
                        if(matrix[a][b]==Double.POSITIVE_INFINITY || matrix[a][b]==Double.NEGATIVE_INFINITY){
                            matrix[a][b]=9;
                        }                    
                }
            }
        }
        
        return matrix;        
    }
    
    def roundCellMatrix(def bar, def kol, matrix){
        def hasil = new double[bar][kol];
        for(int a=0; a<bar; a++){
            for(int b=0; b<kol; b++){
                hasil[a][b] = roundFunc(matrix[a][b]);
            }
        }
        return hasil;
    }

    def sumPerLine(def bar, def kol, data){
        def hasil = new double[bar];
        for(int a=0; a<bar; a++){
            for(int b=0; b<kol; b++){
                hasil[a]+=data[a][b];
            }
        }
        return hasil;
    }
    
    def createTriangularMatrix(def bar, sumPerLineLow, sumPerLineMed, sumPerLineUp, totalLow, totalMed, totalUp){
        def hasil = new double[bar][3];
        for(int a=0; a<bar; a++){
            for(int b=0; b<3; b++){
                if(b==0){
                    hasil[a][b] = sumPerLineLow[a]/totalUp;
                }else if(b==1){
                    hasil[a][b] = sumPerLineMed[a]/totalMed;    
                }else if(b==2){
                    hasil[a][b] = sumPerLineUp[a]/totalLow;
                }
            }
        }
        return hasil;
    }
    
    def finance(){
        //showSumMatrixHasil();
        def ev=getEvTotal()
        def ac=getAcTotal()
        def income = getIncome()
        def netIncome = getNetIncome()
        def shq = getShareHolderEquity()
        def pv = getPVTotal()

        def cpi = getFormula(ev, ac);
        def tato = getFormula(income, ev);
        def roe = getFormula(netIncome, shq);
        def roa = getFormula(netIncome, ev);
        def spi = getFormula(ev, pv);
        
        def daftarKPIFinance = new double[5];
        daftarKPIFinance = isiKPIFinance(cpi, tato, roe, roa, spi);

        def matrix = new double[5][5];
        matrix = createMatrix(5, 5, daftarKPIFinance);
        
        def roundMatrix = new double[5][5];
        roundMatrix = roundCellMatrix(5, 5, matrix);
        
        def low = new double[5][5];
        def med = new double[2][5];
        def up = new double[5][5];
        
        low = isiLow(5, 5, roundMatrix);
        med = isiMed(5, 5, roundMatrix);
        up = isiUp(5, 5, roundMatrix);
        
        def sumPerLineLow = new double[5];
        def sumPerLineMed = new double[5];
        def sumPerLineUp = new double[5];
        
        sumPerLineLow = sumPerLine(5, 5, low);
        sumPerLineMed = sumPerLine(5, 5, med);
        sumPerLineUp = sumPerLine(5, 5, up);
        
        def totalLow = getTotalLow(5, sumPerLineLow);
        def totalMed = getTotalMed(5, sumPerLineMed);
        def totalUp = getTotalUp(5, sumPerLineUp);
        
        def triangularMatrix = new double[5][3];
        triangularMatrix = createTriangularMatrix(5, sumPerLineLow, sumPerLineMed, sumPerLineUp, totalLow, totalMed, totalUp);
        
        def finalMatrix = new double[4][5];
        finalMatrix = createFinalMatrix(4, 5, triangularMatrix);
        
        def transFinalMatrix = new double[5][4];
        transFinalMatrix = createTransFinalMatrix(5, 4, finalMatrix);
        
        def matrixMin = new double[5];
        matrixMin = createMatrixMin(5, 4, transFinalMatrix);        
        def sumMatrixMin = sumMatrixMin(5, matrixMin);
        
        def matrixHasil = new double[5];
        matrixHasil = createMatrixHasil(5, matrixMin, sumMatrixMin);
        def sumMatrixHasil = sumMatrixHasil(5, matrixHasil);
        return matrixHasil;        
    }
    
    def customer(){
        int nVendor = getNVendor()
        int nComplain = getNComplain()
        int nStakeholder = getNStakeholder()
        int nAcceptedVendor=getNAcceptedVendor()
        def cs = getFormula(nComplain, nStakeholder);
        def nomv = getFormula(nAcceptedVendor, nVendor);

        def daftarKPICustomer = new double[2];
        daftarKPICustomer = isiKPICustomer(cs, nomv);

        def matrix = new double[2][2];
        matrix = createMatrix(2, 2, daftarKPICustomer);
        
        def roundMatrix = new double[2][2];
        roundMatrix = roundCellMatrix(2, 2, matrix);
        
        def low = new double[2][2];
        def med = new double[2][2];
        def up = new double[2][2];
        
        low = isiLow(2, 2, roundMatrix);
        med = isiMed(2, 2, roundMatrix);
        up = isiUp(2, 2, roundMatrix);
        
        def sumPerLineLow = new double[2];
        def sumPerLineMed = new double[2];
        def sumPerLineUp = new double[2];
        
        sumPerLineLow = sumPerLine(2, 2, low);
        sumPerLineMed = sumPerLine(2, 2, med);
        sumPerLineUp = sumPerLine(2, 2, up);
        
        def totalLow = getTotalLow(2, sumPerLineLow);
        def totalMed = getTotalMed(2, sumPerLineMed);
        def totalUp = getTotalUp(2, sumPerLineUp);
        
        def triangularMatrix = new double[2][3];
        triangularMatrix = createTriangularMatrix(2, sumPerLineLow, sumPerLineMed, sumPerLineUp, totalLow, totalMed, totalUp);
        
        def finalMatrix = new double[1][2];
        finalMatrix = createFinalMatrix(1, 2, triangularMatrix);
        
        def transFinalMatrix = new double[2][1];
        transFinalMatrix = createTransFinalMatrix(2, 1, finalMatrix);
        
        def matrixMin = new double[2];
        matrixMin = createMatrixMin(2, 1, transFinalMatrix);        
        def sumMatrixMin = sumMatrixMin(2, matrixMin);
        
        def matrixHasil = new double[2];
        matrixHasil = createMatrixHasil(2, matrixMin, sumMatrixMin);
        def sumMatrixHasil = sumMatrixHasil(2, matrixHasil);
        return matrixHasil;
    }        
    
    def internalProcess(){        
        def nDelay = getN_Delay()
        def nActivity = getN_Activity()
        def nMissSequence= 0;
        def matrix = new double[2][2];
        def daftarKPIInternalProcess = new double[2];
        def pod = getFormula(nDelay, nActivity);
        def poms= getFormula(nMissSequence, nActivity);
        daftarKPIInternalProcess = isiKPICustomer(pod, poms);
        matrix = createMatrix(2, 2, daftarKPIInternalProcess);


        def roundMatrix = new double[2][2];
        roundMatrix = roundCellMatrix(2, 2, matrix);
        
        def low = new double[2][2];
        def med = new double[2][2];
        def up = new double[2][2];
        
        low = isiLow(2, 2, roundMatrix);
        med = isiMed(2, 2, roundMatrix);
        up = isiUp(2, 2, roundMatrix);
        
        def sumPerLineLow = new double[2];
        def sumPerLineMed = new double[2];
        def sumPerLineUp = new double[2];
        
        sumPerLineLow = sumPerLine(2, 2, low);
        sumPerLineMed = sumPerLine(2, 2, med);
        sumPerLineUp = sumPerLine(2, 2, up);
        
        def totalLow = getTotalLow(2, sumPerLineLow);
        def totalMed = getTotalMed(2, sumPerLineMed);
        def totalUp = getTotalUp(2, sumPerLineUp);
        
        def triangularMatrix = new double[2][3];
        triangularMatrix = createTriangularMatrix(2, sumPerLineLow, sumPerLineMed, sumPerLineUp, totalLow, totalMed, totalUp);
        
        def finalMatrix = new double[1][2];
        finalMatrix = createFinalMatrix(1, 2, triangularMatrix);
        
        def transFinalMatrix = new double[2][1];
        transFinalMatrix = createTransFinalMatrix(2, 1, finalMatrix);
        
        def matrixMin = new double[2];
        matrixMin = createMatrixMin(2, 1, transFinalMatrix);        
        def sumMatrixMin = sumMatrixMin(2, matrixMin);
        
        def matrixHasil = new double[2];
        matrixHasil = createMatrixHasil(2, matrixMin, sumMatrixMin);
        def sumMatrixHasil = sumMatrixHasil(2, matrixHasil);
        return matrixHasil;        
    }

    def learningAndGrowth(){
        def nTurnOver = 0;
        def nActivity = getN_Activity()
        def dayLoss = getN_Delay()
        def nEmployee = getNStakeholder()
        //def totalDay = getValueFormula("duration", "Activity");
        int b=0;
        def totalDay=getTotalDay()
        def ncr = getNCostRisk()
        def ntr= getNTimeRisk()
        def nsr = getNScopeRisk()
        def nr = ncr+nsr+ntr;
        def et = getFormula(nTurnOver, nActivity);
        def penyebut = nEmployee * totalDay;
        def plt = getFormula(dayLoss, penyebut);
        def pocr = getFormula(ncr, nr);
        def potr = getFormula(ntr, nr)
        def posr = getFormula(nsr, nr);                

        def daftarKPILearningAndGrowth = new double[5];
        daftarKPILearningAndGrowth = isiKPIFinance(et, plt, pocr, potr, posr);

        def matrix = new double[5][5];
        matrix = createMatrix(5, 5, daftarKPILearningAndGrowth);
        
        def roundMatrix = new double[5][5];
        roundMatrix = roundCellMatrix(5, 5, matrix);
        
        def low = new double[5][5];
        def med = new double[5][5];
        def up = new double[5][5];
        
        low = isiLow(5, 5, roundMatrix);
        med = isiMed(5, 5, roundMatrix);
        up = isiUp(5, 5, roundMatrix);
        
        def sumPerLineLow = new double[5];
        def sumPerLineMed = new double[5];
        def sumPerLineUp = new double[5];
        
        sumPerLineLow = sumPerLine(5, 5, low);
        sumPerLineMed = sumPerLine(5, 5, med);
        sumPerLineUp = sumPerLine(5, 5, up);
        
        def totalLow = getTotalLow(5, sumPerLineLow);
        def totalMed = getTotalMed(5, sumPerLineMed);
        def totalUp = getTotalUp(5, sumPerLineUp);
        
        def triangularMatrix = new double[5][3];
        triangularMatrix = createTriangularMatrix(5, sumPerLineLow, sumPerLineMed, sumPerLineUp, totalLow, totalMed, totalUp);
        
        def finalMatrix = new double[4][5];
        finalMatrix = createFinalMatrix(4, 5, triangularMatrix);
        
        def transFinalMatrix = new double[5][4];
        transFinalMatrix = createTransFinalMatrix(5, 4, finalMatrix);
        
        def matrixMin = new double[5];
        matrixMin = createMatrixMin(5, 4, transFinalMatrix);        
        def sumMatrixMin = sumMatrixMin(5, matrixMin);
        
        def matrixHasil = new double[5];
        matrixHasil = createMatrixHasil(5, matrixMin, sumMatrixMin);
        def sumMatrixHasil = sumMatrixHasil(5, matrixHasil);

        return matrixHasil;        
    }
    
    def baris=4;
    def getMatrixBerpasangan(){        
        def tempPos = new int[baris];
        def matrixBerpasangan = new double[baris][baris];
        for(int a=0; a<baris; a++){
            for(int b=0; b<baris; b++){
                if(a==b){
                    matrixBerpasangan[a][b] = 1;
                    tempPos[a] = a;
                }
            }
        }        
        def matrixPerspektif = new String[4];
        matrixPerspektif[0] = 'Finance';
        matrixPerspektif[1] = 'Internal Process';
        matrixPerspektif[2] = 'Learning and Growth';
        matrixPerspektif[3] = 'Customer';
        for(int a=0; a<baris; a++){
            def a1 = matrixPerspektif[a];
            for(int b=0; b<baris; b++){
                def b2 = matrixPerspektif[b];
                def r = Perspektif.findByData1AndData2(a1, b2);
                if(a==b){
                    matrixBerpasangan[a][b] = 1;
                }
                if(b>tempPos[a]){
                    if(r){
                        matrixBerpasangan[a][b] = r.value;
                    }
                }else if(b<tempPos[a]){
                    matrixBerpasangan[a][b] = 1/matrixBerpasangan[b][a];
                }
            }
        }
        return matrixBerpasangan;
    }

    def perspektif(){
        def matrixBerpasangan = new double[4][4];
        matrixBerpasangan = getMatrixBerpasangan();
        
        def matrix = new double[4][4];
        matrix = getMatrixBerpasangan();
        
        def low = new double[4][4];
        def med = new double[4][4];
        def up = new double[4][4];
        
        low = isiLow(4, 4, matrix);
        med = isiMed(4, 4, matrix);
        up = isiUp(4, 4, matrix);
        
        def sumPerLineLow = new double[4];
        def sumPerLineMed = new double[4];
        def sumPerLineUp = new double[4];
        
        sumPerLineLow = sumPerLine(4, 4, low);
        sumPerLineMed = sumPerLine(4, 4, med);
        sumPerLineUp = sumPerLine(4, 4, up);
        
        def totalLow = getTotalLow(4, sumPerLineLow);
        def totalMed = getTotalMed(4, sumPerLineMed);
        def totalUp = getTotalUp(4, sumPerLineUp);
        
        def triangularMatrix = new double[4][3];
        triangularMatrix = createTriangularMatrix(4, sumPerLineLow, sumPerLineMed, sumPerLineUp, totalLow, totalMed, totalUp);
        
        def finalMatrix = new double[3][4];
        finalMatrix = createFinalMatrix(3, 4, triangularMatrix);
        
        def transFinalMatrix = new double[4][3];
        transFinalMatrix = createTransFinalMatrix(4, 3, finalMatrix);
        
        def matrixMin = new double[4];
        matrixMin = createMatrixMin(4, 3, transFinalMatrix);        
        def sumMatrixMin = sumMatrixMin(4, matrixMin);
        
        def matrixHasil = new double[4];
        matrixHasil = createMatrixHasil(4, matrixMin, sumMatrixMin);
        def sumMatrixHasil = sumMatrixHasil(4, matrixHasil);        
        return matrixHasil;
    }
    
    def getTotalBobot(def n, def matrix, def perspektif){
        def hasil = new double[n];
        for(int a=0; a<n; a++){
            hasil[a] = matrix[a] * perspektif;
        }
        return hasil;
    }
    
    def autoSum(def n, def matrix){
        def hasil = 0;
        for(int a=0; a<n; a++){
            hasil+=matrix[a];
        }
        return hasil;
    }
    
        def totalBobotFinance = new double[5];
        def totalBobotInternalProcess = new double[2];
        def totalBobotlearningAndGrowth = new double[5];
        def totalBobotCustomer = new double[2];
        
    def createBSC(){
        def perspektif = perspektif();
        def financep = perspektif[0];
        def internalProcessp = perspektif[1];
        def learningAndGrowthp = perspektif[2];
        def customerp = perspektif[3];
        
        def finance = finance();
        def customer = customer();
        def internalProcess = internalProcess();
        def learningAndGrowth = learningAndGrowth();                
        
        totalBobotFinance = getTotalBobot(5, finance, financep);
                
        totalBobotInternalProcess = getTotalBobot(2, internalProcess, internalProcessp);
                
        totalBobotlearningAndGrowth = getTotalBobot(5, learningAndGrowth, learningAndGrowthp);
                
        totalBobotCustomer = getTotalBobot(2, customer, customerp);
        
        def total = new double[4];
        total[0] = autoSum(5, totalBobotFinance);
        total[1] = autoSum(2, totalBobotInternalProcess);
        total[2] = autoSum(5, totalBobotlearningAndGrowth);
        total[3] = autoSum(2, totalBobotCustomer);
        
        def sumTotal = autoSum(4, total);
        return total;
    }

    def concat(int n, matrix){
        def hasil="";
        for(int a=0; a<n; a++){
            hasil+=matrix[a]+",";
        }
        return hasil
    }
    
    def createChartBar(){
        def namaProyek
        if(session.proyek){
            namaProyek = StatementOfWork.get(session.proyek)
            namaProyek = namaProyek.projectName
        }else{
            namaProyek = ""
        }

    def total = createBSC();
    
    def financeV = concat(5, totalBobotFinance);
    def learningAndGrowthV = concat(5, totalBobotlearningAndGrowth);
    def internalProcessV = concat(2, totalBobotInternalProcess);
    def customerV = concat(2, totalBobotCustomer);
    
    def js="""
    <script type="text/javascript" >        
        // Build the chart
          var colors = Highcharts.getOptions().colors,
            categories = ['Finance', 'Internal Process', 'Learning and Growth', 'Customer'],
            name = 'Perspective Balanced ScoreCard',
            data = [{
                    y: """+total[0]+""",
                    color: colors[0],
                    drilldown: {
                        name: 'Finance versions',
                        categories: ['CPI', 'TATO', 'ROE', 'ROA', 'SPI'],
                        data: ["""+financeV+"""],
                        color: colors[0]
                    }
                }, {
                    y: """+total[1]+""",
                    color: colors[1],
                    drilldown: {
                        name: 'Internal Process versions',
                        categories: ['Percentage of Delay', 'Percentage of Missequence'],
                        data: ["""+internalProcessV+"""],
                        color: colors[1]
                    }
                }, {
                    y: """+total[2]+""",
                    color: colors[2],
                    drilldown: {
                        name: 'Learning and Growth versions',
                        categories: ['ET', 'PLT', 'POCR', 'POTR', 'POSR'],
                        data: ["""+learningAndGrowthV+"""],
                        color: colors[2]
                    }
                }, {
                    y: """+total[3]+""",
                    color: colors[3],
                    drilldown: {
                        name: 'Customer versions',
                        categories: ['Customer Satisfaction', 'Number of Matching Vendor'],
                        data: ["""+customerV+"""],
                        color: colors[3]
                    }
                }];
    
        function setChart(name, categories, data, color) {
			chart.xAxis[0].setCategories(categories, false);
			chart.series[0].remove(false);
			chart.addSeries({
				name: name,
				data: data,
				color: color || 'white'
			}, false);
			chart.redraw();
        }
        var chart = new Highcharts.Chart({
            chart: {
                renderTo: 'containerKPI',
                type: 'column'
            },
            title: {
                text: 'KPI Bar Chart Comparison'
            },
            subtitle: {
                text: 'Click the columns to view Detail Perspective. Click again to view Perspective.'
            },
            xAxis: {
                categories: categories
            },
            yAxis: {
                title: {
                    text: 'Total percent Perspective'
                }
            },
            plotOptions: {
                column: {
                    cursor: 'pointer',
                    point: {
                        events: {
                            click: function() {
                                var drilldown = this.drilldown;
                                if (drilldown) { // drill down
                                    setChart(drilldown.name, drilldown.categories, drilldown.data, drilldown.color);
                                } else { // restore
                                    setChart(name, categories, data);
                                }
                            }
                        }
                    },
                    dataLabels: {
                        enabled: true,
                        color: colors[0],
                        style: {
                            fontWeight: 'bold'
                        },
                        formatter: function() {
                            return this.y +'%';
                        }
                    }
                }
            },
            tooltip: {
                formatter: function() {
                    var point = this.point,
                        s = this.x +':<b>'+ this.y +'%</b><br/>';
                    if (point.drilldown) {
                        s += 'Click to view '+ point.category +' versions';
                    } else {
                        s += 'Click to return to Perspective Comparison';
                    }
                    return s;
                }
            },
            series: [{
                name: name,
                data: data,
                color: 'white'
            }],
            exporting: {
                enabled: false
            }
        })           
    </script>    
    """
        
    return js
    }
}
