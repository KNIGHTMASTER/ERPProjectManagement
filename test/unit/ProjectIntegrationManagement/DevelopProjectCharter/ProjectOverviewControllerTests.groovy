package ProjectIntegrationManagement.DevelopProjectCharter



import org.junit.*
import grails.test.mixin.*

@TestFor(ProjectOverviewController)
@Mock(ProjectOverview)
class ProjectOverviewControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/projectOverview/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.projectOverviewInstanceList.size() == 0
        assert model.projectOverviewInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.projectOverviewInstance != null
    }

    void testSave() {
        controller.save()

        assert model.projectOverviewInstance != null
        assert view == '/projectOverview/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/projectOverview/show/1'
        assert controller.flash.message != null
        assert ProjectOverview.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/projectOverview/list'

        populateValidParams(params)
        def projectOverview = new ProjectOverview(params)

        assert projectOverview.save() != null

        params.id = projectOverview.id

        def model = controller.show()

        assert model.projectOverviewInstance == projectOverview
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/projectOverview/list'

        populateValidParams(params)
        def projectOverview = new ProjectOverview(params)

        assert projectOverview.save() != null

        params.id = projectOverview.id

        def model = controller.edit()

        assert model.projectOverviewInstance == projectOverview
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/projectOverview/list'

        response.reset()

        populateValidParams(params)
        def projectOverview = new ProjectOverview(params)

        assert projectOverview.save() != null

        // test invalid parameters in update
        params.id = projectOverview.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/projectOverview/edit"
        assert model.projectOverviewInstance != null

        projectOverview.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/projectOverview/show/$projectOverview.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        projectOverview.clearErrors()

        populateValidParams(params)
        params.id = projectOverview.id
        params.version = -1
        controller.update()

        assert view == "/projectOverview/edit"
        assert model.projectOverviewInstance != null
        assert model.projectOverviewInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/projectOverview/list'

        response.reset()

        populateValidParams(params)
        def projectOverview = new ProjectOverview(params)

        assert projectOverview.save() != null
        assert ProjectOverview.count() == 1

        params.id = projectOverview.id

        controller.delete()

        assert ProjectOverview.count() == 0
        assert ProjectOverview.get(projectOverview.id) == null
        assert response.redirectedUrl == '/projectOverview/list'
    }
}
