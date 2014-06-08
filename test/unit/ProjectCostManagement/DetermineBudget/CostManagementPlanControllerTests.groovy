package ProjectCostManagement.DetermineBudget



import org.junit.*
import grails.test.mixin.*

@TestFor(CostManagementPlanController)
@Mock(CostManagementPlan)
class CostManagementPlanControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/costManagementPlan/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.costManagementPlanInstanceList.size() == 0
        assert model.costManagementPlanInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.costManagementPlanInstance != null
    }

    void testSave() {
        controller.save()

        assert model.costManagementPlanInstance != null
        assert view == '/costManagementPlan/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/costManagementPlan/show/1'
        assert controller.flash.message != null
        assert CostManagementPlan.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/costManagementPlan/list'

        populateValidParams(params)
        def costManagementPlan = new CostManagementPlan(params)

        assert costManagementPlan.save() != null

        params.id = costManagementPlan.id

        def model = controller.show()

        assert model.costManagementPlanInstance == costManagementPlan
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/costManagementPlan/list'

        populateValidParams(params)
        def costManagementPlan = new CostManagementPlan(params)

        assert costManagementPlan.save() != null

        params.id = costManagementPlan.id

        def model = controller.edit()

        assert model.costManagementPlanInstance == costManagementPlan
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/costManagementPlan/list'

        response.reset()

        populateValidParams(params)
        def costManagementPlan = new CostManagementPlan(params)

        assert costManagementPlan.save() != null

        // test invalid parameters in update
        params.id = costManagementPlan.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/costManagementPlan/edit"
        assert model.costManagementPlanInstance != null

        costManagementPlan.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/costManagementPlan/show/$costManagementPlan.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        costManagementPlan.clearErrors()

        populateValidParams(params)
        params.id = costManagementPlan.id
        params.version = -1
        controller.update()

        assert view == "/costManagementPlan/edit"
        assert model.costManagementPlanInstance != null
        assert model.costManagementPlanInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/costManagementPlan/list'

        response.reset()

        populateValidParams(params)
        def costManagementPlan = new CostManagementPlan(params)

        assert costManagementPlan.save() != null
        assert CostManagementPlan.count() == 1

        params.id = costManagementPlan.id

        controller.delete()

        assert CostManagementPlan.count() == 0
        assert CostManagementPlan.get(costManagementPlan.id) == null
        assert response.redirectedUrl == '/costManagementPlan/list'
    }
}
