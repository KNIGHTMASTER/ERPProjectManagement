package ProjectIntegrationManagement.DevelopProjectManagementPlan



import org.junit.*
import grails.test.mixin.*

@TestFor(RequestProjectManagementPlanController)
@Mock(RequestProjectManagementPlan)
class RequestProjectManagementPlanControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/requestProjectManagementPlan/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.requestProjectManagementPlanInstanceList.size() == 0
        assert model.requestProjectManagementPlanInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.requestProjectManagementPlanInstance != null
    }

    void testSave() {
        controller.save()

        assert model.requestProjectManagementPlanInstance != null
        assert view == '/requestProjectManagementPlan/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/requestProjectManagementPlan/show/1'
        assert controller.flash.message != null
        assert RequestProjectManagementPlan.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/requestProjectManagementPlan/list'

        populateValidParams(params)
        def requestProjectManagementPlan = new RequestProjectManagementPlan(params)

        assert requestProjectManagementPlan.save() != null

        params.id = requestProjectManagementPlan.id

        def model = controller.show()

        assert model.requestProjectManagementPlanInstance == requestProjectManagementPlan
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/requestProjectManagementPlan/list'

        populateValidParams(params)
        def requestProjectManagementPlan = new RequestProjectManagementPlan(params)

        assert requestProjectManagementPlan.save() != null

        params.id = requestProjectManagementPlan.id

        def model = controller.edit()

        assert model.requestProjectManagementPlanInstance == requestProjectManagementPlan
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/requestProjectManagementPlan/list'

        response.reset()

        populateValidParams(params)
        def requestProjectManagementPlan = new RequestProjectManagementPlan(params)

        assert requestProjectManagementPlan.save() != null

        // test invalid parameters in update
        params.id = requestProjectManagementPlan.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/requestProjectManagementPlan/edit"
        assert model.requestProjectManagementPlanInstance != null

        requestProjectManagementPlan.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/requestProjectManagementPlan/show/$requestProjectManagementPlan.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        requestProjectManagementPlan.clearErrors()

        populateValidParams(params)
        params.id = requestProjectManagementPlan.id
        params.version = -1
        controller.update()

        assert view == "/requestProjectManagementPlan/edit"
        assert model.requestProjectManagementPlanInstance != null
        assert model.requestProjectManagementPlanInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/requestProjectManagementPlan/list'

        response.reset()

        populateValidParams(params)
        def requestProjectManagementPlan = new RequestProjectManagementPlan(params)

        assert requestProjectManagementPlan.save() != null
        assert RequestProjectManagementPlan.count() == 1

        params.id = requestProjectManagementPlan.id

        controller.delete()

        assert RequestProjectManagementPlan.count() == 0
        assert RequestProjectManagementPlan.get(requestProjectManagementPlan.id) == null
        assert response.redirectedUrl == '/requestProjectManagementPlan/list'
    }
}
