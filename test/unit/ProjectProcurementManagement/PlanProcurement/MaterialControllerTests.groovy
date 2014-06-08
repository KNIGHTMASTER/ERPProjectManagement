package ProjectProcurementManagement.PlanProcurement



import org.junit.*
import grails.test.mixin.*

@TestFor(MaterialController)
@Mock(Material)
class MaterialControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/material/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.materialInstanceList.size() == 0
        assert model.materialInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.materialInstance != null
    }

    void testSave() {
        controller.save()

        assert model.materialInstance != null
        assert view == '/material/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/material/show/1'
        assert controller.flash.message != null
        assert Material.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/material/list'

        populateValidParams(params)
        def material = new Material(params)

        assert material.save() != null

        params.id = material.id

        def model = controller.show()

        assert model.materialInstance == material
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/material/list'

        populateValidParams(params)
        def material = new Material(params)

        assert material.save() != null

        params.id = material.id

        def model = controller.edit()

        assert model.materialInstance == material
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/material/list'

        response.reset()

        populateValidParams(params)
        def material = new Material(params)

        assert material.save() != null

        // test invalid parameters in update
        params.id = material.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/material/edit"
        assert model.materialInstance != null

        material.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/material/show/$material.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        material.clearErrors()

        populateValidParams(params)
        params.id = material.id
        params.version = -1
        controller.update()

        assert view == "/material/edit"
        assert model.materialInstance != null
        assert model.materialInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/material/list'

        response.reset()

        populateValidParams(params)
        def material = new Material(params)

        assert material.save() != null
        assert Material.count() == 1

        params.id = material.id

        controller.delete()

        assert Material.count() == 0
        assert Material.get(material.id) == null
        assert response.redirectedUrl == '/material/list'
    }
}
