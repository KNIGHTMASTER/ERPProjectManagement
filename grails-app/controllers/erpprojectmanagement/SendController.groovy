package erpprojectmanagement

class SendController {

    def notifierService

    def index() {}

    def sendMail = {
        notifierService.contactUser(params.userName, params.email, params.message)
        /*sendMail{
            to params.email
            from "steve@apple.com"
            subject "hello from grails- mail"
            body "${params.message}<br />Thank You ${params.userName} For Using Grails- Mail"
        }*/
        render "email sent"
    }
}
