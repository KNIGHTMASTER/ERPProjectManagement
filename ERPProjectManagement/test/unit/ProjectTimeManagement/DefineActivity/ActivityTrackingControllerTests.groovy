package ProjectTimeManagement.DefineActivity



import org.junit.*
import grails.test.mixin.*

@TestFor(ActivityTrackingController)
@Mock(ActivityTracking)
class ActivityTrackingControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/activityTracking/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.activityTrackingInstanceList.size() == 0
        assert model.activityTrackingInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.activityTrackingInstance != null
    }

    void testSave() {
        controller.save()

        assert model.activityTrackingInstance != null
        assert view == '/activityTracking/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/activityTracking/show/1'
        assert controller.flash.message != null
        assert ActivityTracking.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/activityTracking/list'

        populateValidParams(params)
        def activityTracking = new ActivityTracking(params)

        assert activityTracking.save() != null

        params.id = activityTracking.id

        def model = controller.show()

        assert model.activityTrackingInstance == activityTracking
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/activityTracking/list'

        populateValidParams(params)
        def activityTracking = new ActivityTracking(params)

        assert activityTracking.save() != null

        params.id = activityTracking.id

        def model = controller.edit()

        assert model.activityTrackingInstance == activityTracking
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/activityTracking/list'

        response.reset()

        populateValidParams(params)
        def activityTracking = new ActivityTracking(params)

        assert activityTracking.save() != null

        // test invalid parameters in update
        params.id = activityTracking.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/activityTracking/edit"
        assert model.activityTrackingInstance != null

        activityTracking.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/activityTracking/show/$activityTracking.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        activityTracking.clearErrors()

        populateValidParams(params)
        params.id = activityTracking.id
        params.version = -1
        controller.update()

        assert view == "/activityTracking/edit"
        assert model.activityTrackingInstance != null
        assert model.activityTrackingInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/activityTracking/list'

        response.reset()

        populateValidParams(params)
        def activityTracking = new ActivityTracking(params)

        assert activityTracking.save() != null
        assert ActivityTracking.count() == 1

        params.id = activityTracking.id

        controller.delete()

        assert ActivityTracking.count() == 0
        assert ActivityTracking.get(activityTracking.id) == null
        assert response.redirectedUrl == '/activityTracking/list'
    }
}
