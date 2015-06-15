package ProjectCommunicationManagement.ManageStakeholderExpectations



import org.junit.*
import grails.test.mixin.*

@TestFor(ProjectResponsesController)
@Mock(ProjectResponses)
class ProjectResponsesControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/projectResponses/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.projectResponsesInstanceList.size() == 0
        assert model.projectResponsesInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.projectResponsesInstance != null
    }

    void testSave() {
        controller.save()

        assert model.projectResponsesInstance != null
        assert view == '/projectResponses/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/projectResponses/show/1'
        assert controller.flash.message != null
        assert ProjectResponses.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/projectResponses/list'

        populateValidParams(params)
        def projectResponses = new ProjectResponses(params)

        assert projectResponses.save() != null

        params.id = projectResponses.id

        def model = controller.show()

        assert model.projectResponsesInstance == projectResponses
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/projectResponses/list'

        populateValidParams(params)
        def projectResponses = new ProjectResponses(params)

        assert projectResponses.save() != null

        params.id = projectResponses.id

        def model = controller.edit()

        assert model.projectResponsesInstance == projectResponses
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/projectResponses/list'

        response.reset()

        populateValidParams(params)
        def projectResponses = new ProjectResponses(params)

        assert projectResponses.save() != null

        // test invalid parameters in update
        params.id = projectResponses.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/projectResponses/edit"
        assert model.projectResponsesInstance != null

        projectResponses.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/projectResponses/show/$projectResponses.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        projectResponses.clearErrors()

        populateValidParams(params)
        params.id = projectResponses.id
        params.version = -1
        controller.update()

        assert view == "/projectResponses/edit"
        assert model.projectResponsesInstance != null
        assert model.projectResponsesInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/projectResponses/list'

        response.reset()

        populateValidParams(params)
        def projectResponses = new ProjectResponses(params)

        assert projectResponses.save() != null
        assert ProjectResponses.count() == 1

        params.id = projectResponses.id

        controller.delete()

        assert ProjectResponses.count() == 0
        assert ProjectResponses.get(projectResponses.id) == null
        assert response.redirectedUrl == '/projectResponses/list'
    }
}
