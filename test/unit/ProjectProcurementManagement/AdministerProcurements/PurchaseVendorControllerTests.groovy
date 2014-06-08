package ProjectProcurementManagement.AdministerProcurements



import org.junit.*
import grails.test.mixin.*

@TestFor(PurchaseVendorController)
@Mock(PurchaseVendor)
class PurchaseVendorControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/purchaseVendor/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.purchaseVendorInstanceList.size() == 0
        assert model.purchaseVendorInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.purchaseVendorInstance != null
    }

    void testSave() {
        controller.save()

        assert model.purchaseVendorInstance != null
        assert view == '/purchaseVendor/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/purchaseVendor/show/1'
        assert controller.flash.message != null
        assert PurchaseVendor.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/purchaseVendor/list'

        populateValidParams(params)
        def purchaseVendor = new PurchaseVendor(params)

        assert purchaseVendor.save() != null

        params.id = purchaseVendor.id

        def model = controller.show()

        assert model.purchaseVendorInstance == purchaseVendor
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/purchaseVendor/list'

        populateValidParams(params)
        def purchaseVendor = new PurchaseVendor(params)

        assert purchaseVendor.save() != null

        params.id = purchaseVendor.id

        def model = controller.edit()

        assert model.purchaseVendorInstance == purchaseVendor
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/purchaseVendor/list'

        response.reset()

        populateValidParams(params)
        def purchaseVendor = new PurchaseVendor(params)

        assert purchaseVendor.save() != null

        // test invalid parameters in update
        params.id = purchaseVendor.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/purchaseVendor/edit"
        assert model.purchaseVendorInstance != null

        purchaseVendor.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/purchaseVendor/show/$purchaseVendor.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        purchaseVendor.clearErrors()

        populateValidParams(params)
        params.id = purchaseVendor.id
        params.version = -1
        controller.update()

        assert view == "/purchaseVendor/edit"
        assert model.purchaseVendorInstance != null
        assert model.purchaseVendorInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/purchaseVendor/list'

        response.reset()

        populateValidParams(params)
        def purchaseVendor = new PurchaseVendor(params)

        assert purchaseVendor.save() != null
        assert PurchaseVendor.count() == 1

        params.id = purchaseVendor.id

        controller.delete()

        assert PurchaseVendor.count() == 0
        assert PurchaseVendor.get(purchaseVendor.id) == null
        assert response.redirectedUrl == '/purchaseVendor/list'
    }
}
