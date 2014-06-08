package ProjectTimeManagement.Utility



import org.junit.*
import grails.test.mixin.*

@TestFor(ActivityChangeRequestController)
@Mock(ActivityChangeRequest)
class ActivityChangeRequestControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/activityChangeRequest/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.activityChangeRequestInstanceList.size() == 0
        assert model.activityChangeRequestInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.activityChangeRequestInstance != null
    }

    void testSave() {
        controller.save()

        assert model.activityChangeRequestInstance != null
        assert view == '/activityChangeRequest/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/activityChangeRequest/show/1'
        assert controller.flash.message != null
        assert ActivityChangeRequest.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/activityChangeRequest/list'

        populateValidParams(params)
        def activityChangeRequest = new ActivityChangeRequest(params)

        assert activityChangeRequest.save() != null

        params.id = activityChangeRequest.id

        def model = controller.show()

        assert model.activityChangeRequestInstance == activityChangeRequest
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/activityChangeRequest/list'

        populateValidParams(params)
        def activityChangeRequest = new ActivityChangeRequest(params)

        assert activityChangeRequest.save() != null

        params.id = activityChangeRequest.id

        def model = controller.edit()

        assert model.activityChangeRequestInstance == activityChangeRequest
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/activityChangeRequest/list'

        response.reset()

        populateValidParams(params)
        def activityChangeRequest = new ActivityChangeRequest(params)

        assert activityChangeRequest.save() != null

        // test invalid parameters in update
        params.id = activityChangeRequest.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/activityChangeRequest/edit"
        assert model.activityChangeRequestInstance != null

        activityChangeRequest.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/activityChangeRequest/show/$activityChangeRequest.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        activityChangeRequest.clearErrors()

        populateValidParams(params)
        params.id = activityChangeRequest.id
        params.version = -1
        controller.update()

        assert view == "/activityChangeRequest/edit"
        assert model.activityChangeRequestInstance != null
        assert model.activityChangeRequestInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/activityChangeRequest/list'

        response.reset()

        populateValidParams(params)
        def activityChangeRequest = new ActivityChangeRequest(params)

        assert activityChangeRequest.save() != null
        assert ActivityChangeRequest.count() == 1

        params.id = activityChangeRequest.id

        controller.delete()

        assert ActivityChangeRequest.count() == 0
        assert ActivityChangeRequest.get(activityChangeRequest.id) == null
        assert response.redirectedUrl == '/activityChangeRequest/list'
    }
}
