package ProjectIntegrationManagement.DevelopProjectCharter



import org.junit.*
import grails.test.mixin.*

@TestFor(ProjectInformationController)
@Mock(ProjectInformation)
class ProjectInformationControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/projectInformation/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.projectInformationInstanceList.size() == 0
        assert model.projectInformationInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.projectInformationInstance != null
    }

    void testSave() {
        controller.save()

        assert model.projectInformationInstance != null
        assert view == '/projectInformation/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/projectInformation/show/1'
        assert controller.flash.message != null
        assert ProjectInformation.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/projectInformation/list'

        populateValidParams(params)
        def projectInformation = new ProjectInformation(params)

        assert projectInformation.save() != null

        params.id = projectInformation.id

        def model = controller.show()

        assert model.projectInformationInstance == projectInformation
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/projectInformation/list'

        populateValidParams(params)
        def projectInformation = new ProjectInformation(params)

        assert projectInformation.save() != null

        params.id = projectInformation.id

        def model = controller.edit()

        assert model.projectInformationInstance == projectInformation
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/projectInformation/list'

        response.reset()

        populateValidParams(params)
        def projectInformation = new ProjectInformation(params)

        assert projectInformation.save() != null

        // test invalid parameters in update
        params.id = projectInformation.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/projectInformation/edit"
        assert model.projectInformationInstance != null

        projectInformation.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/projectInformation/show/$projectInformation.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        projectInformation.clearErrors()

        populateValidParams(params)
        params.id = projectInformation.id
        params.version = -1
        controller.update()

        assert view == "/projectInformation/edit"
        assert model.projectInformationInstance != null
        assert model.projectInformationInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/projectInformation/list'

        response.reset()

        populateValidParams(params)
        def projectInformation = new ProjectInformation(params)

        assert projectInformation.save() != null
        assert ProjectInformation.count() == 1

        params.id = projectInformation.id

        controller.delete()

        assert ProjectInformation.count() == 0
        assert ProjectInformation.get(projectInformation.id) == null
        assert response.redirectedUrl == '/projectInformation/list'
    }
}
