package ProjectIntegrationManagement.DevelopProjectCharter



import org.junit.*
import grails.test.mixin.*

@TestFor(ProjectCharterController)
@Mock(ProjectCharter)
class ProjectCharterControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/projectCharter/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.projectCharterInstanceList.size() == 0
        assert model.projectCharterInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.projectCharterInstance != null
    }

    void testSave() {
        controller.save()

        assert model.projectCharterInstance != null
        assert view == '/projectCharter/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/projectCharter/show/1'
        assert controller.flash.message != null
        assert ProjectCharter.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/projectCharter/list'

        populateValidParams(params)
        def projectCharter = new ProjectCharter(params)

        assert projectCharter.save() != null

        params.id = projectCharter.id

        def model = controller.show()

        assert model.projectCharterInstance == projectCharter
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/projectCharter/list'

        populateValidParams(params)
        def projectCharter = new ProjectCharter(params)

        assert projectCharter.save() != null

        params.id = projectCharter.id

        def model = controller.edit()

        assert model.projectCharterInstance == projectCharter
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/projectCharter/list'

        response.reset()

        populateValidParams(params)
        def projectCharter = new ProjectCharter(params)

        assert projectCharter.save() != null

        // test invalid parameters in update
        params.id = projectCharter.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/projectCharter/edit"
        assert model.projectCharterInstance != null

        projectCharter.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/projectCharter/show/$projectCharter.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        projectCharter.clearErrors()

        populateValidParams(params)
        params.id = projectCharter.id
        params.version = -1
        controller.update()

        assert view == "/projectCharter/edit"
        assert model.projectCharterInstance != null
        assert model.projectCharterInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/projectCharter/list'

        response.reset()

        populateValidParams(params)
        def projectCharter = new ProjectCharter(params)

        assert projectCharter.save() != null
        assert ProjectCharter.count() == 1

        params.id = projectCharter.id

        controller.delete()

        assert ProjectCharter.count() == 0
        assert ProjectCharter.get(projectCharter.id) == null
        assert response.redirectedUrl == '/projectCharter/list'
    }
}
