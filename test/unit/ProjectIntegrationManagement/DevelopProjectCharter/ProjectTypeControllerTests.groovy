package ProjectIntegrationManagement.DevelopProjectCharter



import org.junit.*
import grails.test.mixin.*

@TestFor(ProjectTypeController)
@Mock(ProjectType)
class ProjectTypeControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/projectType/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.projectTypeInstanceList.size() == 0
        assert model.projectTypeInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.projectTypeInstance != null
    }

    void testSave() {
        controller.save()

        assert model.projectTypeInstance != null
        assert view == '/projectType/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/projectType/show/1'
        assert controller.flash.message != null
        assert ProjectType.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/projectType/list'

        populateValidParams(params)
        def projectType = new ProjectType(params)

        assert projectType.save() != null

        params.id = projectType.id

        def model = controller.show()

        assert model.projectTypeInstance == projectType
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/projectType/list'

        populateValidParams(params)
        def projectType = new ProjectType(params)

        assert projectType.save() != null

        params.id = projectType.id

        def model = controller.edit()

        assert model.projectTypeInstance == projectType
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/projectType/list'

        response.reset()

        populateValidParams(params)
        def projectType = new ProjectType(params)

        assert projectType.save() != null

        // test invalid parameters in update
        params.id = projectType.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/projectType/edit"
        assert model.projectTypeInstance != null

        projectType.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/projectType/show/$projectType.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        projectType.clearErrors()

        populateValidParams(params)
        params.id = projectType.id
        params.version = -1
        controller.update()

        assert view == "/projectType/edit"
        assert model.projectTypeInstance != null
        assert model.projectTypeInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/projectType/list'

        response.reset()

        populateValidParams(params)
        def projectType = new ProjectType(params)

        assert projectType.save() != null
        assert ProjectType.count() == 1

        params.id = projectType.id

        controller.delete()

        assert ProjectType.count() == 0
        assert ProjectType.get(projectType.id) == null
        assert response.redirectedUrl == '/projectType/list'
    }
}
