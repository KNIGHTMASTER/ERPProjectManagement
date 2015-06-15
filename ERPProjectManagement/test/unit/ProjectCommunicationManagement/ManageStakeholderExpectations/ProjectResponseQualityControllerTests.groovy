package ProjectCommunicationManagement.ManageStakeholderExpectations



import org.junit.*
import grails.test.mixin.*

@TestFor(ProjectResponseQualityController)
@Mock(ProjectResponseQuality)
class ProjectResponseQualityControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/projectResponseQuality/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.projectResponseQualityInstanceList.size() == 0
        assert model.projectResponseQualityInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.projectResponseQualityInstance != null
    }

    void testSave() {
        controller.save()

        assert model.projectResponseQualityInstance != null
        assert view == '/projectResponseQuality/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/projectResponseQuality/show/1'
        assert controller.flash.message != null
        assert ProjectResponseQuality.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/projectResponseQuality/list'

        populateValidParams(params)
        def projectResponseQuality = new ProjectResponseQuality(params)

        assert projectResponseQuality.save() != null

        params.id = projectResponseQuality.id

        def model = controller.show()

        assert model.projectResponseQualityInstance == projectResponseQuality
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/projectResponseQuality/list'

        populateValidParams(params)
        def projectResponseQuality = new ProjectResponseQuality(params)

        assert projectResponseQuality.save() != null

        params.id = projectResponseQuality.id

        def model = controller.edit()

        assert model.projectResponseQualityInstance == projectResponseQuality
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/projectResponseQuality/list'

        response.reset()

        populateValidParams(params)
        def projectResponseQuality = new ProjectResponseQuality(params)

        assert projectResponseQuality.save() != null

        // test invalid parameters in update
        params.id = projectResponseQuality.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/projectResponseQuality/edit"
        assert model.projectResponseQualityInstance != null

        projectResponseQuality.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/projectResponseQuality/show/$projectResponseQuality.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        projectResponseQuality.clearErrors()

        populateValidParams(params)
        params.id = projectResponseQuality.id
        params.version = -1
        controller.update()

        assert view == "/projectResponseQuality/edit"
        assert model.projectResponseQualityInstance != null
        assert model.projectResponseQualityInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/projectResponseQuality/list'

        response.reset()

        populateValidParams(params)
        def projectResponseQuality = new ProjectResponseQuality(params)

        assert projectResponseQuality.save() != null
        assert ProjectResponseQuality.count() == 1

        params.id = projectResponseQuality.id

        controller.delete()

        assert ProjectResponseQuality.count() == 0
        assert ProjectResponseQuality.get(projectResponseQuality.id) == null
        assert response.redirectedUrl == '/projectResponseQuality/list'
    }
}
