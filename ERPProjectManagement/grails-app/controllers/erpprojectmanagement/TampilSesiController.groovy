package erpprojectmanagement

class TampilSesiController {

    def index() {
        def sesiproyek = session.proyek
        render "sesi : ${sesiproyek}"
    }
}
