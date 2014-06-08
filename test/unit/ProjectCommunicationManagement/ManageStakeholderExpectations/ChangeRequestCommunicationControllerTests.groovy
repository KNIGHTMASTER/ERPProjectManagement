package ProjectCommunicationManagement.ManageStakeholderExpectations



import org.junit.*
import grails.test.mixin.*

@TestFor(ChangeRequestCommunicationController)
@Mock(ChangeRequestCommunication)
class ChangeRequestCommunicationControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/changeRequestCommunication/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.changeRequestCommunicationInstanceList.size() == 0
        assert model.changeRequestCommunicationInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.changeRequestCommunicationInstance != null
    }

    void testSave() {
        controller.save()

        assert model.changeRequestCommunicationInstance != null
        assert view == '/changeRequestCommunication/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/changeRequestCommunication/show/1'
        assert controller.flash.message != null
        assert ChangeRequestCommunication.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/changeRequestCommunication/list'

        populateValidParams(params)
        def changeRequestCommunication = new ChangeRequestCommunication(params)

        assert changeRequestCommunication.save() != null

        params.id = changeRequestCommunication.id

        def model = controller.show()

        assert model.changeRequestCommunicationInstance == changeRequestCommunication
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/changeRequestCommunication/list'

        populateValidParams(params)
        def changeRequestCommunication = new ChangeRequestCommunication(params)

        assert changeRequestCommunication.save() != null

        params.id = changeRequestCommunication.id

        def model = controller.edit()

        assert model.changeRequestCommunicationInstance == changeRequestCommunication
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/changeRequestCommunication/list'

        response.reset()

        populateValidParams(params)
        def changeRequestCommunication = new ChangeRequestCommunication(params)

        assert changeRequestCommunication.save() != null

        // test invalid parameters in update
        params.id = changeRequestCommunication.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/changeRequestCommunication/edit"
        assert model.changeRequestCommunicationInstance != null

        changeRequestCommunication.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/changeRequestCommunication/show/$changeRequestCommunication.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        changeRequestCommunication.clearErrors()

        populateValidParams(params)
        params.id = changeRequestCommunication.id
        params.version = -1
        controller.update()

        assert view == "/changeRequestCommunication/edit"
        assert model.changeRequestCommunicationInstance != null
        assert model.changeRequestCommunicationInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/changeRequestCommunication/list'

        response.reset()

        populateValidParams(params)
        def changeRequestCommunication = new ChangeRequestCommunication(params)

        assert changeRequestCommunication.save() != null
        assert ChangeRequestCommunication.count() == 1

        params.id = changeRequestCommunication.id

        controller.delete()

        assert ChangeRequestCommunication.count() == 0
        assert ChangeRequestCommunication.get(changeRequestCommunication.id) == null
        assert response.redirectedUrl == '/changeRequestCommunication/list'
    }
}
