package ProjectProcurementManagement.AdministerProcurements



import org.junit.*
import grails.test.mixin.*

@TestFor(PerformanceVendorController)
@Mock(PerformanceVendor)
class PerformanceVendorControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/performanceVendor/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.performanceVendorInstanceList.size() == 0
        assert model.performanceVendorInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.performanceVendorInstance != null
    }

    void testSave() {
        controller.save()

        assert model.performanceVendorInstance != null
        assert view == '/performanceVendor/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/performanceVendor/show/1'
        assert controller.flash.message != null
        assert PerformanceVendor.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/performanceVendor/list'

        populateValidParams(params)
        def performanceVendor = new PerformanceVendor(params)

        assert performanceVendor.save() != null

        params.id = performanceVendor.id

        def model = controller.show()

        assert model.performanceVendorInstance == performanceVendor
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/performanceVendor/list'

        populateValidParams(params)
        def performanceVendor = new PerformanceVendor(params)

        assert performanceVendor.save() != null

        params.id = performanceVendor.id

        def model = controller.edit()

        assert model.performanceVendorInstance == performanceVendor
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/performanceVendor/list'

        response.reset()

        populateValidParams(params)
        def performanceVendor = new PerformanceVendor(params)

        assert performanceVendor.save() != null

        // test invalid parameters in update
        params.id = performanceVendor.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/performanceVendor/edit"
        assert model.performanceVendorInstance != null

        performanceVendor.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/performanceVendor/show/$performanceVendor.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        performanceVendor.clearErrors()

        populateValidParams(params)
        params.id = performanceVendor.id
        params.version = -1
        controller.update()

        assert view == "/performanceVendor/edit"
        assert model.performanceVendorInstance != null
        assert model.performanceVendorInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/performanceVendor/list'

        response.reset()

        populateValidParams(params)
        def performanceVendor = new PerformanceVendor(params)

        assert performanceVendor.save() != null
        assert PerformanceVendor.count() == 1

        params.id = performanceVendor.id

        controller.delete()

        assert PerformanceVendor.count() == 0
        assert PerformanceVendor.get(performanceVendor.id) == null
        assert response.redirectedUrl == '/performanceVendor/list'
    }
}
