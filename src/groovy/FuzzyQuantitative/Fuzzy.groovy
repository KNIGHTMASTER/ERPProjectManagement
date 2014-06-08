package FuzzyQuantitative

import ProjectCommunicationManagement.ManageStakeholderExpectations.ProjectResponseQuality
import ProjectCommunicationManagement.ManageStakeholderExpectations.ProjectResponses

/**
 * Created by FAUZI on 12/28/13.
 */
class Fuzzy {
    def getQualityProcess(){
        def rawData = ProjectResponseQuality.list()
        def qualityProcess = []
        rawData.each{
            qualityProcess.add(it.quality)
        }
        return qualityProcess
    }

    def getScopeProcess(){
        def rawData = ProjectResponseQuality.list()
        def scopeProcess = []
        rawData.each{
            scopeProcess.add(it.scope)
        }
        return scopeProcess
    }

    def quality

    def setQualityValue(def quality){
        this.quality = quality
    }

    def scope
    def setScopeValue(def scope){
        this.scope = scope
    }

    String [] kriteriaQuality = ["VL", "L", "M", "H", "VH"]
    String [] kriteriaScope = ["VL", "L", "M", "H", "VH"]

    def qualityRange = new QualityRange()
    def scopeRange = new ScopeRange()
    def outputRange = new Output()
    def nilaiTengahOutput

    def getNilaiTengahOutput(){
        nilaiTengahOutput = outputRange.getNilaiTengahOutput()
    }

    double VL, L, M, H, VH
    double VLs, Ls, Ms, Hs, VHs

    def outputRule = new double[25]
    def variabelRule = new double[25]


    def getMiuquality(){
        qualityRange.setQUALITY(quality)
        VL = qualityRange.VL()
        L = qualityRange.L()
        M = qualityRange.M()
        H = qualityRange.H()
        VH = qualityRange.VH()
    }

    def getMiuscope(){
        scopeRange.setSCOPE(scope)
        VLs = scopeRange.VL()
        Ls = scopeRange.L()
        Ms = scopeRange.M()
        Hs = scopeRange.H()
        VHs = scopeRange.VH()
    }

    def getMinValue(def miuquality, def miuscope){
        def list = []
        list.add(miuquality)
        list.add(miuscope)
        return Collections.min(list)
    }

    def countRole(){
        //IF quality = VL && scope = VL THEN E
        outputRule[0] = getMinValue(VL, VLs)
        variabelRule[0] = getNilaiTengahOutput()[0]

        //IF quality = VL && scope = L THEN E
        outputRule[1] = getMinValue(VL, Ls)
        variabelRule[1] = getNilaiTengahOutput()[0]

        //IF quality = VL && scope = M THEN D
        outputRule[2] = getMinValue(VL, Ms)
        variabelRule[2] = getNilaiTengahOutput()[1]

        //IF quality = VL && scope = H YHEN D
        outputRule[3] = getMinValue(VL, Hs)
        variabelRule[3] = getNilaiTengahOutput()[1]

        //IF quality = VL && scope = VH THEN D
        outputRule[4] = getMinValue(VL, VHs)
        variabelRule[4] = getNilaiTengahOutput()[1]

        //=============================================

        //IF quality = L && scope = VL THEN E
        outputRule[5] = getMinValue(L, VLs)
        variabelRule[5] = getNilaiTengahOutput()[0]

        //IF quality = L && scope = L THEN E
        outputRule[6] = getMinValue(L, Ls)
        variabelRule[6] = getNilaiTengahOutput()[0]

        //IF quality = L && scope = M THEN D
        outputRule[7] = getMinValue(L, Ms)
        variabelRule[7] = getNilaiTengahOutput()[1]

        //IF quality = L && scope = H THEN D
        outputRule[8] = getMinValue(L, Hs)
        variabelRule[8] = getNilaiTengahOutput()[1]

        //IF quality = L && scope = VH THEN C
        outputRule[9] = getMinValue(L, VHs)
        variabelRule[9] = getNilaiTengahOutput()[2]

        //=============================================

        //IF quality = M && scope = VL THEN D
        outputRule[10] = getMinValue(M, VLs)
        variabelRule[10] = getNilaiTengahOutput()[1]

        //IF quality = M && scope = L THEN D
        outputRule[11] = getMinValue(M, Ls)
        variabelRule[11] = getNilaiTengahOutput()[1]

        //IF quality = M && scope = M THEN C
        outputRule[12] = getMinValue(M, Ms)
        variabelRule[12] = getNilaiTengahOutput()[2]

        //IF quality = M && scope = H THEN C
        outputRule[13] = getMinValue(M, Hs)
        variabelRule[13] = getNilaiTengahOutput()[2]

        //IF quality = M && scope = VH THEN B
        outputRule[14] = getMinValue(M, VHs)
        variabelRule[14] = getNilaiTengahOutput()[3]

        //=============================================

        //IF quality = H && scope = VL THEN D
        outputRule[15] = getMinValue(H, VLs)
        variabelRule[15] = getNilaiTengahOutput()[1]

        //IF quality = H && scope = L THEN D
        outputRule[16] = getMinValue(H, Ls)
        variabelRule[16] = getNilaiTengahOutput()[1]

        //IF quality = H && scope = M THEN C
        outputRule[17] = getMinValue(H, Ms)
        variabelRule[17] = getNilaiTengahOutput()[2]

        //IF quality = H && scope = H THEN B
        outputRule[18] = getMinValue(H, Hs)
        variabelRule[18] = getNilaiTengahOutput()[3]

        //IF quality = H && scope = VH THEN A
        outputRule[19] = getMinValue(H, VHs)
        variabelRule[19] = getNilaiTengahOutput()[4]

        //=============================================

        //IF quality = VH && scope = VL THEN D
        outputRule[20] = getMinValue(VH, VLs)
        variabelRule[20] = getNilaiTengahOutput()[1]

        //IF quality = VH && scope = L THEN C
        outputRule[21] = getMinValue(VH, Ls)
        variabelRule[21] = getNilaiTengahOutput()[2]

        //IF quality = VH && scope = M THEN B
        outputRule[22] = getMinValue(VH, Ms)
        variabelRule[22] = getNilaiTengahOutput()[3]

        //IF quality = VH && scope = H THEN A
        outputRule[23] = getMinValue(VH, Hs)
        variabelRule[23] = getNilaiTengahOutput()[4]

        //IF quality = VH && scope = VH THEN A
        outputRule[24] = getMinValue(VH, VHs)
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
        getMiuquality()
        getMiuscope()
        countRole()
    }

}
