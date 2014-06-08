package ProjectProcurementManagement.AdministerProcurements



import org.junit.*
import grails.test.mixin.*

@TestFor(MaterialResourceController)
@Mock(MaterialResource)
class MaterialResourceControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/materialResource/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.materialResourceInstanceList.size() == 0
        assert model.materialResourceInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.materialResourceInstance != null
    }

    void testSave() {
        controller.save()

        assert model.materialResourceInstance != null
        assert view == '/materialResource/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/materialResource/show/1'
        assert controller.flash.message != null
        assert MaterialResource.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/materialResource/list'

        populateValidParams(params)
        def materialResource = new MaterialResource(params)

        assert materialResource.save() != null

        params.id = materialResource.id

        def model = controller.show()

        assert model.materialResourceInstance == materialResource
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/materialResource/list'

        populateValidParams(params)
        def materialResource = new MaterialResource(params)

        assert materialResource.save() != null

        params.id = materialResource.id

        def model = controller.edit()

        assert model.materialResourceInstance == materialResource
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/materialResource/list'

        response.reset()

        populateValidParams(params)
        def materialResource = new MaterialResource(params)

        assert materialResource.save() != null

        // test invalid parameters in update
        params.id = materialResource.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/materialResource/edit"
        assert model.materialResourceInstance != null

        materialResource.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/materialResource/show/$materialResource.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        materialResource.clearErrors()

        populateValidParams(params)
        params.id = materialResource.id
        params.version = -1
        controller.update()

        assert view == "/materialResource/edit"
        assert model.materialResourceInstance != null
        assert model.materialResourceInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/materialResource/list'

        response.reset()

        populateValidParams(params)
        def materialResource = new MaterialResource(params)

        assert materialResource.save() != null
        assert MaterialResource.count() == 1

        params.id = materialResource.id

        controller.delete()

        assert MaterialResource.count() == 0
        assert MaterialResource.get(materialResource.id) == null
        assert response.redirectedUrl == '/materialResource/list'
    }
}
