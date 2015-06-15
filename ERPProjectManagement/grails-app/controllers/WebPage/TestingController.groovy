package WebPage
import grails.plugins.springsecurity.Secured
class TestingController {

@Secured(['ROLE_ADMIN'])
def index = {
    render 'Selamat, Anda sudah berhasil login'
    }
}
