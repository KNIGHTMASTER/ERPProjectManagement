package ProjectCostManagement.DetermineBudget



import org.junit.*
import grails.test.mixin.*

@TestFor(ActivityCostController)
@Mock(ActivityCost)
class ActivityCostControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/activityCost/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.activityCostInstanceList.size() == 0
        assert model.activityCostInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.activityCostInstance != null
    }

    void testSave() {
        controller.save()

        assert model.activityCostInstance != null
        assert view == '/activityCost/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/activityCost/show/1'
        assert controller.flash.message != null
        assert ActivityCost.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/activityCost/list'

        populateValidParams(params)
        def activityCost = new ActivityCost(params)

        assert activityCost.save() != null

        params.id = activityCost.id

        def model = controller.show()

        assert model.activityCostInstance == activityCost
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/activityCost/list'

        populateValidParams(params)
        def activityCost = new ActivityCost(params)

        assert activityCost.save() != null

        params.id = activityCost.id

        def model = controller.edit()

        assert model.activityCostInstance == activityCost
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/activityCost/list'

        response.reset()

        populateValidParams(params)
        def activityCost = new ActivityCost(params)

        assert activityCost.save() != null

        // test invalid parameters in update
        params.id = activityCost.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/activityCost/edit"
        assert model.activityCostInstance != null

        activityCost.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/activityCost/show/$activityCost.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        activityCost.clearErrors()

        populateValidParams(params)
        params.id = activityCost.id
        params.version = -1
        controller.update()

        assert view == "/activityCost/edit"
        assert model.activityCostInstance != null
        assert model.activityCostInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/activityCost/list'

        response.reset()

        populateValidParams(params)
        def activityCost = new ActivityCost(params)

        assert activityCost.save() != null
        assert ActivityCost.count() == 1

        params.id = activityCost.id

        controller.delete()

        assert ActivityCost.count() == 0
        assert ActivityCost.get(activityCost.id) == null
        assert response.redirectedUrl == '/activityCost/list'
    }
}
