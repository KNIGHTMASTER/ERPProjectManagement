package WebPage



import org.junit.*
import grails.test.mixin.*

@TestFor(CommunicationDashboardController)
@Mock(CommunicationDashboard)
class CommunicationDashboardControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/communicationDashboard/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.communicationDashboardInstanceList.size() == 0
        assert model.communicationDashboardInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.communicationDashboardInstance != null
    }

    void testSave() {
        controller.save()

        assert model.communicationDashboardInstance != null
        assert view == '/communicationDashboard/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/communicationDashboard/show/1'
        assert controller.flash.message != null
        assert CommunicationDashboard.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/communicationDashboard/list'

        populateValidParams(params)
        def communicationDashboard = new CommunicationDashboard(params)

        assert communicationDashboard.save() != null

        params.id = communicationDashboard.id

        def model = controller.show()

        assert model.communicationDashboardInstance == communicationDashboard
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/communicationDashboard/list'

        populateValidParams(params)
        def communicationDashboard = new CommunicationDashboard(params)

        assert communicationDashboard.save() != null

        params.id = communicationDashboard.id

        def model = controller.edit()

        assert model.communicationDashboardInstance == communicationDashboard
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/communicationDashboard/list'

        response.reset()

        populateValidParams(params)
        def communicationDashboard = new CommunicationDashboard(params)

        assert communicationDashboard.save() != null

        // test invalid parameters in update
        params.id = communicationDashboard.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/communicationDashboard/edit"
        assert model.communicationDashboardInstance != null

        communicationDashboard.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/communicationDashboard/show/$communicationDashboard.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        communicationDashboard.clearErrors()

        populateValidParams(params)
        params.id = communicationDashboard.id
        params.version = -1
        controller.update()

        assert view == "/communicationDashboard/edit"
        assert model.communicationDashboardInstance != null
        assert model.communicationDashboardInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/communicationDashboard/list'

        response.reset()

        populateValidParams(params)
        def communicationDashboard = new CommunicationDashboard(params)

        assert communicationDashboard.save() != null
        assert CommunicationDashboard.count() == 1

        params.id = communicationDashboard.id

        controller.delete()

        assert CommunicationDashboard.count() == 0
        assert CommunicationDashboard.get(communicationDashboard.id) == null
        assert response.redirectedUrl == '/communicationDashboard/list'
    }
}
