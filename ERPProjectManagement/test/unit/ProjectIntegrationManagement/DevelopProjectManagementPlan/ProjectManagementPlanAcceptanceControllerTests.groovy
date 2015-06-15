package ProjectIntegrationManagement.DevelopProjectManagementPlan



import org.junit.*
import grails.test.mixin.*

@TestFor(ProjectManagementPlanAcceptanceController)
@Mock(ProjectManagementPlanAcceptance)
class ProjectManagementPlanAcceptanceControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/projectManagementPlanAcceptance/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.projectManagementPlanAcceptanceInstanceList.size() == 0
        assert model.projectManagementPlanAcceptanceInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.projectManagementPlanAcceptanceInstance != null
    }

    void testSave() {
        controller.save()

        assert model.projectManagementPlanAcceptanceInstance != null
        assert view == '/projectManagementPlanAcceptance/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/projectManagementPlanAcceptance/show/1'
        assert controller.flash.message != null
        assert ProjectManagementPlanAcceptance.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/projectManagementPlanAcceptance/list'

        populateValidParams(params)
        def projectManagementPlanAcceptance = new ProjectManagementPlanAcceptance(params)

        assert projectManagementPlanAcceptance.save() != null

        params.id = projectManagementPlanAcceptance.id

        def model = controller.show()

        assert model.projectManagementPlanAcceptanceInstance == projectManagementPlanAcceptance
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/projectManagementPlanAcceptance/list'

        populateValidParams(params)
        def projectManagementPlanAcceptance = new ProjectManagementPlanAcceptance(params)

        assert projectManagementPlanAcceptance.save() != null

        params.id = projectManagementPlanAcceptance.id

        def model = controller.edit()

        assert model.projectManagementPlanAcceptanceInstance == projectManagementPlanAcceptance
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/projectManagementPlanAcceptance/list'

        response.reset()

        populateValidParams(params)
        def projectManagementPlanAcceptance = new ProjectManagementPlanAcceptance(params)

        assert projectManagementPlanAcceptance.save() != null

        // test invalid parameters in update
        params.id = projectManagementPlanAcceptance.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/projectManagementPlanAcceptance/edit"
        assert model.projectManagementPlanAcceptanceInstance != null

        projectManagementPlanAcceptance.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/projectManagementPlanAcceptance/show/$projectManagementPlanAcceptance.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        projectManagementPlanAcceptance.clearErrors()

        populateValidParams(params)
        params.id = projectManagementPlanAcceptance.id
        params.version = -1
        controller.update()

        assert view == "/projectManagementPlanAcceptance/edit"
        assert model.projectManagementPlanAcceptanceInstance != null
        assert model.projectManagementPlanAcceptanceInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/projectManagementPlanAcceptance/list'

        response.reset()

        populateValidParams(params)
        def projectManagementPlanAcceptance = new ProjectManagementPlanAcceptance(params)

        assert projectManagementPlanAcceptance.save() != null
        assert ProjectManagementPlanAcceptance.count() == 1

        params.id = projectManagementPlanAcceptance.id

        controller.delete()

        assert ProjectManagementPlanAcceptance.count() == 0
        assert ProjectManagementPlanAcceptance.get(projectManagementPlanAcceptance.id) == null
        assert response.redirectedUrl == '/projectManagementPlanAcceptance/list'
    }
}
