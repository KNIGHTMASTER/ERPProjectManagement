package Fuzzy


import ProjectCommunicationManagement.ManageStakeholderExpectations.ProjectResponses
import ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter
import ProjectIntegrationManagement.DevelopProjectCharter.ProjectProposal
import ProjectIntegrationManagement.DevelopProjectCharter.StatementOfWork

/**
 * Created by FAUZI on 12/28/13.
 */
class Fuzzy {
    def getCostProcess(){
        def rawData
        if(session.proyek){
            def temp = StatementOfWork.get(session.proyek)
            temp = ProjectProposal.findByProjectName(temp)
            temp = ProjectCharter.findByProjectName(temp)
            rawData = ProjectResponses.findAllByProjectCharter(temp)
        }else{
            rawData = ProjectResponses.list()
        }
        def costProcess = []
        rawData.each{
            costProcess.add(it.cost)
        }
        return costProcess
    }

    def getTimeProcess(){
        def rawData
        if(session.proyek){
            def temp = StatementOfWork.get(session.proyek)
            temp = ProjectProposal.findByProjectName(temp)
            temp = ProjectCharter.findByProjectName(temp)
            rawData = ProjectResponses.findAllByProjectCharter(temp)
        }else{
            rawData = ProjectResponses.list()
        }
        def timeProcess = []
        rawData.each{
            timeProcess.add(it.time)
        }
        return timeProcess
    }

    def cost

    def setCostValue(def cost){
        this.cost = cost
    }

    def time
    def setTimeValue(def time){
        this.time = time
    }

    String [] kriteriaCost = ["VL", "L", "M", "H", "VH"]
    String [] kriteriaTime = ["VL", "L", "M", "H", "VH"]

    def costRange = new CostRange()
    def timeRange = new TimeRange()
    def outputRange = new Output()
    def nilaiTengahOutput

    def getNilaiTengahOutput(){
        nilaiTengahOutput = outputRange.getNilaiTengahOutput()
    }

    double VL, L, M, H, VH
    double VLt, Lt, Mt, Ht, VHt

    def outputRule = new double[25]
    def variabelRule = new double[25]


    def getMiuCost(){
        costRange.setCOST(cost)
        VL = costRange.VL()
        L = costRange.L()
        M = costRange.M()
        H = costRange.H()
        VH = costRange.VH()
    }

    def getMiuTime(){
        timeRange.setTIME(time)
        VLt = timeRange.VL()
        Lt = timeRange.L()
        Mt = timeRange.M()
        Ht = timeRange.H()
        VHt = timeRange.VH()
    }

    def getMinValue(def miuCost, def miuTime){
        def list = []
        list.add(miuCost)
        list.add(miuTime)
        return Collections.min(list)
    }

    def countRole(){
        //IF quality = VL && scope = VL THEN E
        outputRule[0] = getMinValue(VL, VLt)
        variabelRule[0] = getNilaiTengahOutput()[0]

        //IF quality = VL && scope = L THEN E
        outputRule[1] = getMinValue(VL, Lt)
        variabelRule[1] = getNilaiTengahOutput()[0]

        //IF quality = VL && scope = M THEN D
        outputRule[2] = getMinValue(VL, Mt)
        variabelRule[2] = getNilaiTengahOutput()[1]

        //IF quality = VL && scope = H YHEN D
        outputRule[3] = getMinValue(VL, Ht)
        variabelRule[3] = getNilaiTengahOutput()[1]

        //IF quality = VL && scope = VH THEN D
        outputRule[4] = getMinValue(VL, VHt)
        variabelRule[4] = getNilaiTengahOutput()[1]

        //=============================================

        //IF quality = L && scope = VL THEN E
        outputRule[5] = getMinValue(L, VLt)
        variabelRule[5] = getNilaiTengahOutput()[0]

        //IF quality = L && scope = L THEN E
        outputRule[6] = getMinValue(L, Lt)
        variabelRule[6] = getNilaiTengahOutput()[0]

        //IF quality = L && scope = M THEN D
        outputRule[7] = getMinValue(L, Mt)
        variabelRule[7] = getNilaiTengahOutput()[1]

        //IF quality = L && scope = H THEN D
        outputRule[8] = getMinValue(L, Ht)
        variabelRule[8] = getNilaiTengahOutput()[1]

        //IF quality = L && scope = VH THEN C
        outputRule[9] = getMinValue(L, VHt)
        variabelRule[9] = getNilaiTengahOutput()[2]

        //=============================================

        //IF quality = M && scope = VL THEN D
        outputRule[10] = getMinValue(M, VLt)
        variabelRule[10] = getNilaiTengahOutput()[1]

        //IF quality = M && scope = L THEN D
        outputRule[11] = getMinValue(M, Lt)
        variabelRule[11] = getNilaiTengahOutput()[1]

        //IF quality = M && scope = M THEN C
        outputRule[12] = getMinValue(M, Mt)
        variabelRule[12] = getNilaiTengahOutput()[2]

        //IF quality = M && scope = H THEN C
        outputRule[13] = getMinValue(M, Ht)
        variabelRule[13] = getNilaiTengahOutput()[2]

        //IF quality = M && scope = VH THEN B
        outputRule[14] = getMinValue(M, VHt)
        variabelRule[14] = getNilaiTengahOutput()[3]

        //=============================================

        //IF quality = H && scope = VL THEN D
        outputRule[15] = getMinValue(H, VLt)
        variabelRule[15] = getNilaiTengahOutput()[1]

        //IF quality = H && scope = L THEN D
        outputRule[16] = getMinValue(H, Lt)
        variabelRule[16] = getNilaiTengahOutput()[1]

        //IF quality = H && scope = M THEN C
        outputRule[17] = getMinValue(H, Mt)
        variabelRule[17] = getNilaiTengahOutput()[2]

        //IF quality = H && scope = H THEN B
        outputRule[18] = getMinValue(H, Ht)
        variabelRule[18] = getNilaiTengahOutput()[3]

        //IF quality = H && scope = VH THEN A
        outputRule[19] = getMinValue(H, VHt)
        variabelRule[19] = getNilaiTengahOutput()[4]

        //=============================================

        //IF quality = VH && scope = VL THEN D
        outputRule[20] = getMinValue(VH, VLt)
        variabelRule[20] = getNilaiTengahOutput()[1]

        //IF quality = VH && scope = L THEN C
        outputRule[21] = getMinValue(VH, Lt)
        variabelRule[21] = getNilaiTengahOutput()[2]

        //IF quality = VH && scope = M THEN B
        outputRule[22] = getMinValue(VH, Mt)
        variabelRule[22] = getNilaiTengahOutput()[3]

        //IF quality = VH && scope = H THEN A
        outputRule[23] = getMinValue(VH, Ht)
        variabelRule[23] = getNilaiTengahOutput()[4]

        //IF quality = VH && scope = VH THEN A
        outputRule[24] = getMinValue(VH, VHt)
        variabelRule[24] = getNilaiTengahOutput()[4]
    }

    def getDefuzzifikasi(){
        def hasil=0
        def temp1=0
        def temp2=0

        for(int a=0; a<outputRule.size(); a++){
            temp1 += outputRule[a] * variabelRule[a]
            temp2 += outputRule[a]
        }

        hasil = temp1/temp2

        return hasil
    }

    def mainCore(){
        getMiuCost()
        getMiuTime()
        countRole()
    }

}
