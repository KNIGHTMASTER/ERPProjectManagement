package ProjectCommunicationManagement.IdentifyStakeholders



import org.junit.*
import grails.test.mixin.*

@TestFor(CommunicationTypeController)
@Mock(CommunicationType)
class CommunicationTypeControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/communicationType/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.communicationTypeInstanceList.size() == 0
        assert model.communicationTypeInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.communicationTypeInstance != null
    }

    void testSave() {
        controller.save()

        assert model.communicationTypeInstance != null
        assert view == '/communicationType/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/communicationType/show/1'
        assert controller.flash.message != null
        assert CommunicationType.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/communicationType/list'

        populateValidParams(params)
        def communicationType = new CommunicationType(params)

        assert communicationType.save() != null

        params.id = communicationType.id

        def model = controller.show()

        assert model.communicationTypeInstance == communicationType
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/communicationType/list'

        populateValidParams(params)
        def communicationType = new CommunicationType(params)

        assert communicationType.save() != null

        params.id = communicationType.id

        def model = controller.edit()

        assert model.communicationTypeInstance == communicationType
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/communicationType/list'

        response.reset()

        populateValidParams(params)
        def communicationType = new CommunicationType(params)

        assert communicationType.save() != null

        // test invalid parameters in update
        params.id = communicationType.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/communicationType/edit"
        assert model.communicationTypeInstance != null

        communicationType.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/communicationType/show/$communicationType.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        communicationType.clearErrors()

        populateValidParams(params)
        params.id = communicationType.id
        params.version = -1
        controller.update()

        assert view == "/communicationType/edit"
        assert model.communicationTypeInstance != null
        assert model.communicationTypeInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/communicationType/list'

        response.reset()

        populateValidParams(params)
        def communicationType = new CommunicationType(params)

        assert communicationType.save() != null
        assert CommunicationType.count() == 1

        params.id = communicationType.id

        controller.delete()

        assert CommunicationType.count() == 0
        assert CommunicationType.get(communicationType.id) == null
        assert response.redirectedUrl == '/communicationType/list'
    }
}
