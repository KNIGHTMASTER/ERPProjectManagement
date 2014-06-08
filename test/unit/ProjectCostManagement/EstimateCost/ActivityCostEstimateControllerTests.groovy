package ProjectCostManagement.estimateCost



import org.junit.*
import grails.test.mixin.*

@TestFor(ActivityCostEstimateController)
@Mock(ActivityCostEstimate)
class ActivityCostEstimateControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/activityCostEstimate/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.activityCostEstimateInstanceList.size() == 0
        assert model.activityCostEstimateInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.activityCostEstimateInstance != null
    }

    void testSave() {
        controller.save()

        assert model.activityCostEstimateInstance != null
        assert view == '/activityCostEstimate/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/activityCostEstimate/show/1'
        assert controller.flash.message != null
        assert ActivityCostEstimate.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/activityCostEstimate/list'

        populateValidParams(params)
        def activityCostEstimate = new ActivityCostEstimate(params)

        assert activityCostEstimate.save() != null

        params.id = activityCostEstimate.id

        def model = controller.show()

        assert model.activityCostEstimateInstance == activityCostEstimate
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/activityCostEstimate/list'

        populateValidParams(params)
        def activityCostEstimate = new ActivityCostEstimate(params)

        assert activityCostEstimate.save() != null

        params.id = activityCostEstimate.id

        def model = controller.edit()

        assert model.activityCostEstimateInstance == activityCostEstimate
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/activityCostEstimate/list'

        response.reset()

        populateValidParams(params)
        def activityCostEstimate = new ActivityCostEstimate(params)

        assert activityCostEstimate.save() != null

        // test invalid parameters in update
        params.id = activityCostEstimate.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/activityCostEstimate/edit"
        assert model.activityCostEstimateInstance != null

        activityCostEstimate.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/activityCostEstimate/show/$activityCostEstimate.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        activityCostEstimate.clearErrors()

        populateValidParams(params)
        params.id = activityCostEstimate.id
        params.version = -1
        controller.update()

        assert view == "/activityCostEstimate/edit"
        assert model.activityCostEstimateInstance != null
        assert model.activityCostEstimateInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/activityCostEstimate/list'

        response.reset()

        populateValidParams(params)
        def activityCostEstimate = new ActivityCostEstimate(params)

        assert activityCostEstimate.save() != null
        assert ActivityCostEstimate.count() == 1

        params.id = activityCostEstimate.id

        controller.delete()

        assert ActivityCostEstimate.count() == 0
        assert ActivityCostEstimate.get(activityCostEstimate.id) == null
        assert response.redirectedUrl == '/activityCostEstimate/list'
    }
}
