package ProjectCommunicationManagement.PlanCommunications



import org.junit.*
import grails.test.mixin.*

@TestFor(CommunicationManagementPlanController)
@Mock(CommunicationManagementPlan)
class CommunicationManagementPlanControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/communicationManagementPlan/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.communicationManagementPlanInstanceList.size() == 0
        assert model.communicationManagementPlanInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.communicationManagementPlanInstance != null
    }

    void testSave() {
        controller.save()

        assert model.communicationManagementPlanInstance != null
        assert view == '/communicationManagementPlan/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/communicationManagementPlan/show/1'
        assert controller.flash.message != null
        assert CommunicationManagementPlan.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/communicationManagementPlan/list'

        populateValidParams(params)
        def communicationManagementPlan = new CommunicationManagementPlan(params)

        assert communicationManagementPlan.save() != null

        params.id = communicationManagementPlan.id

        def model = controller.show()

        assert model.communicationManagementPlanInstance == communicationManagementPlan
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/communicationManagementPlan/list'

        populateValidParams(params)
        def communicationManagementPlan = new CommunicationManagementPlan(params)

        assert communicationManagementPlan.save() != null

        params.id = communicationManagementPlan.id

        def model = controller.edit()

        assert model.communicationManagementPlanInstance == communicationManagementPlan
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/communicationManagementPlan/list'

        response.reset()

        populateValidParams(params)
        def communicationManagementPlan = new CommunicationManagementPlan(params)

        assert communicationManagementPlan.save() != null

        // test invalid parameters in update
        params.id = communicationManagementPlan.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/communicationManagementPlan/edit"
        assert model.communicationManagementPlanInstance != null

        communicationManagementPlan.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/communicationManagementPlan/show/$communicationManagementPlan.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        communicationManagementPlan.clearErrors()

        populateValidParams(params)
        params.id = communicationManagementPlan.id
        params.version = -1
        controller.update()

        assert view == "/communicationManagementPlan/edit"
        assert model.communicationManagementPlanInstance != null
        assert model.communicationManagementPlanInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/communicationManagementPlan/list'

        response.reset()

        populateValidParams(params)
        def communicationManagementPlan = new CommunicationManagementPlan(params)

        assert communicationManagementPlan.save() != null
        assert CommunicationManagementPlan.count() == 1

        params.id = communicationManagementPlan.id

        controller.delete()

        assert CommunicationManagementPlan.count() == 0
        assert CommunicationManagementPlan.get(communicationManagementPlan.id) == null
        assert response.redirectedUrl == '/communicationManagementPlan/list'
    }
}
