package ProjectProcurementManagement.PlanProcurement



import org.junit.*
import grails.test.mixin.*

@TestFor(RequirementProcurementController)
@Mock(RequirementProcurement)
class RequirementProcurementControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/requirementProcurement/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.requirementProcurementInstanceList.size() == 0
        assert model.requirementProcurementInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.requirementProcurementInstance != null
    }

    void testSave() {
        controller.save()

        assert model.requirementProcurementInstance != null
        assert view == '/requirementProcurement/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/requirementProcurement/show/1'
        assert controller.flash.message != null
        assert RequirementProcurement.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/requirementProcurement/list'

        populateValidParams(params)
        def requirementProcurement = new RequirementProcurement(params)

        assert requirementProcurement.save() != null

        params.id = requirementProcurement.id

        def model = controller.show()

        assert model.requirementProcurementInstance == requirementProcurement
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/requirementProcurement/list'

        populateValidParams(params)
        def requirementProcurement = new RequirementProcurement(params)

        assert requirementProcurement.save() != null

        params.id = requirementProcurement.id

        def model = controller.edit()

        assert model.requirementProcurementInstance == requirementProcurement
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/requirementProcurement/list'

        response.reset()

        populateValidParams(params)
        def requirementProcurement = new RequirementProcurement(params)

        assert requirementProcurement.save() != null

        // test invalid parameters in update
        params.id = requirementProcurement.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/requirementProcurement/edit"
        assert model.requirementProcurementInstance != null

        requirementProcurement.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/requirementProcurement/show/$requirementProcurement.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        requirementProcurement.clearErrors()

        populateValidParams(params)
        params.id = requirementProcurement.id
        params.version = -1
        controller.update()

        assert view == "/requirementProcurement/edit"
        assert model.requirementProcurementInstance != null
        assert model.requirementProcurementInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/requirementProcurement/list'

        response.reset()

        populateValidParams(params)
        def requirementProcurement = new RequirementProcurement(params)

        assert requirementProcurement.save() != null
        assert RequirementProcurement.count() == 1

        params.id = requirementProcurement.id

        controller.delete()

        assert RequirementProcurement.count() == 0
        assert RequirementProcurement.get(requirementProcurement.id) == null
        assert response.redirectedUrl == '/requirementProcurement/list'
    }
}
