package ProjectIntegrationManagement.DevelopProjectManagementPlan



import org.junit.*
import grails.test.mixin.*

@TestFor(DevelopProjectManagementPlanController)
@Mock(DevelopProjectManagementPlan)
class DevelopProjectManagementPlanControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/developProjectManagementPlan/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.developProjectManagementPlanInstanceList.size() == 0
        assert model.developProjectManagementPlanInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.developProjectManagementPlanInstance != null
    }

    void testSave() {
        controller.save()

        assert model.developProjectManagementPlanInstance != null
        assert view == '/developProjectManagementPlan/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/developProjectManagementPlan/show/1'
        assert controller.flash.message != null
        assert DevelopProjectManagementPlan.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/developProjectManagementPlan/list'

        populateValidParams(params)
        def developProjectManagementPlan = new DevelopProjectManagementPlan(params)

        assert developProjectManagementPlan.save() != null

        params.id = developProjectManagementPlan.id

        def model = controller.show()

        assert model.developProjectManagementPlanInstance == developProjectManagementPlan
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/developProjectManagementPlan/list'

        populateValidParams(params)
        def developProjectManagementPlan = new DevelopProjectManagementPlan(params)

        assert developProjectManagementPlan.save() != null

        params.id = developProjectManagementPlan.id

        def model = controller.edit()

        assert model.developProjectManagementPlanInstance == developProjectManagementPlan
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/developProjectManagementPlan/list'

        response.reset()

        populateValidParams(params)
        def developProjectManagementPlan = new DevelopProjectManagementPlan(params)

        assert developProjectManagementPlan.save() != null

        // test invalid parameters in update
        params.id = developProjectManagementPlan.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/developProjectManagementPlan/edit"
        assert model.developProjectManagementPlanInstance != null

        developProjectManagementPlan.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/developProjectManagementPlan/show/$developProjectManagementPlan.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        developProjectManagementPlan.clearErrors()

        populateValidParams(params)
        params.id = developProjectManagementPlan.id
        params.version = -1
        controller.update()

        assert view == "/developProjectManagementPlan/edit"
        assert model.developProjectManagementPlanInstance != null
        assert model.developProjectManagementPlanInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/developProjectManagementPlan/list'

        response.reset()

        populateValidParams(params)
        def developProjectManagementPlan = new DevelopProjectManagementPlan(params)

        assert developProjectManagementPlan.save() != null
        assert DevelopProjectManagementPlan.count() == 1

        params.id = developProjectManagementPlan.id

        controller.delete()

        assert DevelopProjectManagementPlan.count() == 0
        assert DevelopProjectManagementPlan.get(developProjectManagementPlan.id) == null
        assert response.redirectedUrl == '/developProjectManagementPlan/list'
    }
}
