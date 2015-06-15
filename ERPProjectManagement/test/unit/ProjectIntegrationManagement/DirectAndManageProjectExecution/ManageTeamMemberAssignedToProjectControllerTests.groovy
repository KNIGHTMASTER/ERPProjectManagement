package ProjectIntegrationManagement.DirectAndManageProjectExecution



import org.junit.*
import grails.test.mixin.*

@TestFor(ManageTeamMemberAssignedToProjectController)
@Mock(ManageTeamMemberAssignedToProject)
class ManageTeamMemberAssignedToProjectControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/manageTeamMemberAssignedToProject/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.manageTeamMemberAssignedToProjectInstanceList.size() == 0
        assert model.manageTeamMemberAssignedToProjectInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.manageTeamMemberAssignedToProjectInstance != null
    }

    void testSave() {
        controller.save()

        assert model.manageTeamMemberAssignedToProjectInstance != null
        assert view == '/manageTeamMemberAssignedToProject/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/manageTeamMemberAssignedToProject/show/1'
        assert controller.flash.message != null
        assert ManageTeamMemberAssignedToProject.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/manageTeamMemberAssignedToProject/list'

        populateValidParams(params)
        def manageTeamMemberAssignedToProject = new ManageTeamMemberAssignedToProject(params)

        assert manageTeamMemberAssignedToProject.save() != null

        params.id = manageTeamMemberAssignedToProject.id

        def model = controller.show()

        assert model.manageTeamMemberAssignedToProjectInstance == manageTeamMemberAssignedToProject
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/manageTeamMemberAssignedToProject/list'

        populateValidParams(params)
        def manageTeamMemberAssignedToProject = new ManageTeamMemberAssignedToProject(params)

        assert manageTeamMemberAssignedToProject.save() != null

        params.id = manageTeamMemberAssignedToProject.id

        def model = controller.edit()

        assert model.manageTeamMemberAssignedToProjectInstance == manageTeamMemberAssignedToProject
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/manageTeamMemberAssignedToProject/list'

        response.reset()

        populateValidParams(params)
        def manageTeamMemberAssignedToProject = new ManageTeamMemberAssignedToProject(params)

        assert manageTeamMemberAssignedToProject.save() != null

        // test invalid parameters in update
        params.id = manageTeamMemberAssignedToProject.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/manageTeamMemberAssignedToProject/edit"
        assert model.manageTeamMemberAssignedToProjectInstance != null

        manageTeamMemberAssignedToProject.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/manageTeamMemberAssignedToProject/show/$manageTeamMemberAssignedToProject.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        manageTeamMemberAssignedToProject.clearErrors()

        populateValidParams(params)
        params.id = manageTeamMemberAssignedToProject.id
        params.version = -1
        controller.update()

        assert view == "/manageTeamMemberAssignedToProject/edit"
        assert model.manageTeamMemberAssignedToProjectInstance != null
        assert model.manageTeamMemberAssignedToProjectInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/manageTeamMemberAssignedToProject/list'

        response.reset()

        populateValidParams(params)
        def manageTeamMemberAssignedToProject = new ManageTeamMemberAssignedToProject(params)

        assert manageTeamMemberAssignedToProject.save() != null
        assert ManageTeamMemberAssignedToProject.count() == 1

        params.id = manageTeamMemberAssignedToProject.id

        controller.delete()

        assert ManageTeamMemberAssignedToProject.count() == 0
        assert ManageTeamMemberAssignedToProject.get(manageTeamMemberAssignedToProject.id) == null
        assert response.redirectedUrl == '/manageTeamMemberAssignedToProject/list'
    }
}
