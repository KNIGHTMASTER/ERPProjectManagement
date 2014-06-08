package ProjectProcurementManagement.ConductProcurements



import org.junit.*
import grails.test.mixin.*

@TestFor(VendorRegisterController)
@Mock(VendorRegister)
class VendorRegisterControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/vendorRegister/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.vendorRegisterInstanceList.size() == 0
        assert model.vendorRegisterInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.vendorRegisterInstance != null
    }

    void testSave() {
        controller.save()

        assert model.vendorRegisterInstance != null
        assert view == '/vendorRegister/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/vendorRegister/show/1'
        assert controller.flash.message != null
        assert VendorRegister.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/vendorRegister/list'

        populateValidParams(params)
        def vendorRegister = new VendorRegister(params)

        assert vendorRegister.save() != null

        params.id = vendorRegister.id

        def model = controller.show()

        assert model.vendorRegisterInstance == vendorRegister
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/vendorRegister/list'

        populateValidParams(params)
        def vendorRegister = new VendorRegister(params)

        assert vendorRegister.save() != null

        params.id = vendorRegister.id

        def model = controller.edit()

        assert model.vendorRegisterInstance == vendorRegister
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/vendorRegister/list'

        response.reset()

        populateValidParams(params)
        def vendorRegister = new VendorRegister(params)

        assert vendorRegister.save() != null

        // test invalid parameters in update
        params.id = vendorRegister.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/vendorRegister/edit"
        assert model.vendorRegisterInstance != null

        vendorRegister.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/vendorRegister/show/$vendorRegister.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        vendorRegister.clearErrors()

        populateValidParams(params)
        params.id = vendorRegister.id
        params.version = -1
        controller.update()

        assert view == "/vendorRegister/edit"
        assert model.vendorRegisterInstance != null
        assert model.vendorRegisterInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/vendorRegister/list'

        response.reset()

        populateValidParams(params)
        def vendorRegister = new VendorRegister(params)

        assert vendorRegister.save() != null
        assert VendorRegister.count() == 1

        params.id = vendorRegister.id

        controller.delete()

        assert VendorRegister.count() == 0
        assert VendorRegister.get(vendorRegister.id) == null
        assert response.redirectedUrl == '/vendorRegister/list'
    }
}
