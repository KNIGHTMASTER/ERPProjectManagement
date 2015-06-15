package ProjectProcurementManagement.CloseProcurements



import org.junit.*
import grails.test.mixin.*

@TestFor(CloseProcurementController)
@Mock(CloseProcurement)
class CloseProcurementControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/closeProcurement/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.closeProcurementInstanceList.size() == 0
        assert model.closeProcurementInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.closeProcurementInstance != null
    }

    void testSave() {
        controller.save()

        assert model.closeProcurementInstance != null
        assert view == '/closeProcurement/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/closeProcurement/show/1'
        assert controller.flash.message != null
        assert CloseProcurement.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/closeProcurement/list'

        populateValidParams(params)
        def closeProcurement = new CloseProcurement(params)

        assert closeProcurement.save() != null

        params.id = closeProcurement.id

        def model = controller.show()

        assert model.closeProcurementInstance == closeProcurement
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/closeProcurement/list'

        populateValidParams(params)
        def closeProcurement = new CloseProcurement(params)

        assert closeProcurement.save() != null

        params.id = closeProcurement.id

        def model = controller.edit()

        assert model.closeProcurementInstance == closeProcurement
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/closeProcurement/list'

        response.reset()

        populateValidParams(params)
        def closeProcurement = new CloseProcurement(params)

        assert closeProcurement.save() != null

        // test invalid parameters in update
        params.id = closeProcurement.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/closeProcurement/edit"
        assert model.closeProcurementInstance != null

        closeProcurement.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/closeProcurement/show/$closeProcurement.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        closeProcurement.clearErrors()

        populateValidParams(params)
        params.id = closeProcurement.id
        params.version = -1
        controller.update()

        assert view == "/closeProcurement/edit"
        assert model.closeProcurementInstance != null
        assert model.closeProcurementInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/closeProcurement/list'

        response.reset()

        populateValidParams(params)
        def closeProcurement = new CloseProcurement(params)

        assert closeProcurement.save() != null
        assert CloseProcurement.count() == 1

        params.id = closeProcurement.id

        controller.delete()

        assert CloseProcurement.count() == 0
        assert CloseProcurement.get(closeProcurement.id) == null
        assert response.redirectedUrl == '/closeProcurement/list'
    }
}
