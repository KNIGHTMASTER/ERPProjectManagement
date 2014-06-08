package ProjectTimeManagement.EstimateResourceActivity



import org.junit.*
import grails.test.mixin.*

@TestFor(ActivityMandayController)
@Mock(ActivityManday)
class ActivityMandayControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/activityManday/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.activityMandayInstanceList.size() == 0
        assert model.activityMandayInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.activityMandayInstance != null
    }

    void testSave() {
        controller.save()

        assert model.activityMandayInstance != null
        assert view == '/activityManday/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/activityManday/show/1'
        assert controller.flash.message != null
        assert ActivityManday.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/activityManday/list'

        populateValidParams(params)
        def activityManday = new ActivityManday(params)

        assert activityManday.save() != null

        params.id = activityManday.id

        def model = controller.show()

        assert model.activityMandayInstance == activityManday
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/activityManday/list'

        populateValidParams(params)
        def activityManday = new ActivityManday(params)

        assert activityManday.save() != null

        params.id = activityManday.id

        def model = controller.edit()

        assert model.activityMandayInstance == activityManday
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/activityManday/list'

        response.reset()

        populateValidParams(params)
        def activityManday = new ActivityManday(params)

        assert activityManday.save() != null

        // test invalid parameters in update
        params.id = activityManday.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/activityManday/edit"
        assert model.activityMandayInstance != null

        activityManday.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/activityManday/show/$activityManday.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        activityManday.clearErrors()

        populateValidParams(params)
        params.id = activityManday.id
        params.version = -1
        controller.update()

        assert view == "/activityManday/edit"
        assert model.activityMandayInstance != null
        assert model.activityMandayInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/activityManday/list'

        response.reset()

        populateValidParams(params)
        def activityManday = new ActivityManday(params)

        assert activityManday.save() != null
        assert ActivityManday.count() == 1

        params.id = activityManday.id

        controller.delete()

        assert ActivityManday.count() == 0
        assert ActivityManday.get(activityManday.id) == null
        assert response.redirectedUrl == '/activityManday/list'
    }
}
