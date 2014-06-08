

import ProjectIntegrationManagement.DevelopProjectCharter.StatementOfWork
import grails.plugins.springsecurity.Secured
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils

class ChooseProjectController {

    def springSecurityService

    @Secured(['ROLE_ADMIN', 'ROLE_PM'])
    def index() {

        def projectId = getProjectId()

        def tautan = params.tautan
        if(params.pilihproyek){
            def proyek = session["proyek"]
            def lanjut = params.tautan
            session["proyek"] = params.pilihproyek

            assert params.pilihproyek == session.proyek

            redirect uri: "/"+lanjut+""
        }else{
            session.proyek = null
        }

        [projectIdList: projectId, tautan: tautan]
    }


    def getProjectId(){
        /*def hasil = []
        int b = 0
        Sql.withInstance("jdbc:h2:tcp://localhost/PRAM", "sa", "", "org.h2.Driver"){sql ->
            sql.eachRow('SELECT ID FROM STATEMENT_OF_WORK'){
                hasil[b] = "$it.ID"
                b++
            }
        }*/
        def hasil = new StatementOfWork().executeQuery("select id from StatementOfWork")
        return hasil
    }
}
