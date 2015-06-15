package ProjectTimeManagement.Utility



import org.junit.*
import grails.test.mixin.*

@TestFor(PixController)
@Mock(Pix)
class PixControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/pix/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.pixInstanceList.size() == 0
        assert model.pixInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.pixInstance != null
    }

    void testSave() {
        controller.save()

        assert model.pixInstance != null
        assert view == '/pix/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/pix/show/1'
        assert controller.flash.message != null
        assert Pix.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/pix/list'

        populateValidParams(params)
        def pix = new Pix(params)

        assert pix.save() != null

        params.id = pix.id

        def model = controller.show()

        assert model.pixInstance == pix
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/pix/list'

        populateValidParams(params)
        def pix = new Pix(params)

        assert pix.save() != null

        params.id = pix.id

        def model = controller.edit()

        assert model.pixInstance == pix
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/pix/list'

        response.reset()

        populateValidParams(params)
        def pix = new Pix(params)

        assert pix.save() != null

        // test invalid parameters in update
        params.id = pix.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/pix/edit"
        assert model.pixInstance != null

        pix.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/pix/show/$pix.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        pix.clearErrors()

        populateValidParams(params)
        params.id = pix.id
        params.version = -1
        controller.update()

        assert view == "/pix/edit"
        assert model.pixInstance != null
        assert model.pixInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/pix/list'

        response.reset()

        populateValidParams(params)
        def pix = new Pix(params)

        assert pix.save() != null
        assert Pix.count() == 1

        params.id = pix.id

        controller.delete()

        assert Pix.count() == 0
        assert Pix.get(pix.id) == null
        assert response.redirectedUrl == '/pix/list'
    }
}
