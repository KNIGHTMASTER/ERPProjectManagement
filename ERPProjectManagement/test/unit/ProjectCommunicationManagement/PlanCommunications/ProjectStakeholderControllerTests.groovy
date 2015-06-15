package ProjectCommunicationManagement.PlanCommunications



import org.junit.*
import grails.test.mixin.*

@TestFor(ProjectStakeholderController)
@Mock(ProjectStakeholder)
class ProjectStakeholderControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/projectStakeholder/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.projectStakeholderInstanceList.size() == 0
        assert model.projectStakeholderInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.projectStakeholderInstance != null
    }

    void testSave() {
        controller.save()

        assert model.projectStakeholderInstance != null
        assert view == '/projectStakeholder/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/projectStakeholder/show/1'
        assert controller.flash.message != null
        assert ProjectStakeholder.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/projectStakeholder/list'

        populateValidParams(params)
        def projectStakeholder = new ProjectStakeholder(params)

        assert projectStakeholder.save() != null

        params.id = projectStakeholder.id

        def model = controller.show()

        assert model.projectStakeholderInstance == projectStakeholder
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/projectStakeholder/list'

        populateValidParams(params)
        def projectStakeholder = new ProjectStakeholder(params)

        assert projectStakeholder.save() != null

        params.id = projectStakeholder.id

        def model = controller.edit()

        assert model.projectStakeholderInstance == projectStakeholder
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/projectStakeholder/list'

        response.reset()

        populateValidParams(params)
        def projectStakeholder = new ProjectStakeholder(params)

        assert projectStakeholder.save() != null

        // test invalid parameters in update
        params.id = projectStakeholder.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/projectStakeholder/edit"
        assert model.projectStakeholderInstance != null

        projectStakeholder.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/projectStakeholder/show/$projectStakeholder.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        projectStakeholder.clearErrors()

        populateValidParams(params)
        params.id = projectStakeholder.id
        params.version = -1
        controller.update()

        assert view == "/projectStakeholder/edit"
        assert model.projectStakeholderInstance != null
        assert model.projectStakeholderInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/projectStakeholder/list'

        response.reset()

        populateValidParams(params)
        def projectStakeholder = new ProjectStakeholder(params)

        assert projectStakeholder.save() != null
        assert ProjectStakeholder.count() == 1

        params.id = projectStakeholder.id

        controller.delete()

        assert ProjectStakeholder.count() == 0
        assert ProjectStakeholder.get(projectStakeholder.id) == null
        assert response.redirectedUrl == '/projectStakeholder/list'
    }
}
