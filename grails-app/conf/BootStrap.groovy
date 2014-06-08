import org.sec.Role
import org.sec.User
import org.sec.UserRole

class BootStrap {

def init = { servletContext ->

def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)
def ptmRole = new Role(authority: 'ROLE_PTM').save(flush: true)
def hrmRole = new Role(authority: 'ROLE_HRM').save(flush: true)
def pmRole = new Role(authority: 'ROLE_PM').save(flush: true)

/*def testAdmin = new User(username: 'admin', enabled: true, password: 'admin')
testAdmin.save(flush: true)
def testPtm = new User(username: 'aldrin', enabled: true, password: 'aldrin')
testPtm.save(flush: true)
def testHrm = new User(username: 'hrm', enabled: true, password: 'hrm')
testHrm.save(flush: true)


UserRole.create testAdmin, adminRole, true
UserRole.create testPtm, ptmRole, true
UserRole.create testHrm, hrmRole, true*/

    }
}
