package ProjectTimeManagement.Utility



import org.junit.*
import grails.test.mixin.*

@TestFor(LagiController)
@Mock(Lagi)
class LagiControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/lagi/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.lagiInstanceList.size() == 0
        assert model.lagiInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.lagiInstance != null
    }

    void testSave() {
        controller.save()

        assert model.lagiInstance != null
        assert view == '/lagi/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/lagi/show/1'
        assert controller.flash.message != null
        assert Lagi.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/lagi/list'

        populateValidParams(params)
        def lagi = new Lagi(params)

        assert lagi.save() != null

        params.id = lagi.id

        def model = controller.show()

        assert model.lagiInstance == lagi
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/lagi/list'

        populateValidParams(params)
        def lagi = new Lagi(params)

        assert lagi.save() != null

        params.id = lagi.id

        def model = controller.edit()

        assert model.lagiInstance == lagi
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/lagi/list'

        response.reset()

        populateValidParams(params)
        def lagi = new Lagi(params)

        assert lagi.save() != null

        // test invalid parameters in update
        params.id = lagi.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/lagi/edit"
        assert model.lagiInstance != null

        lagi.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/lagi/show/$lagi.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        lagi.clearErrors()

        populateValidParams(params)
        params.id = lagi.id
        params.version = -1
        controller.update()

        assert view == "/lagi/edit"
        assert model.lagiInstance != null
        assert model.lagiInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/lagi/list'

        response.reset()

        populateValidParams(params)
        def lagi = new Lagi(params)

        assert lagi.save() != null
        assert Lagi.count() == 1

        params.id = lagi.id

        controller.delete()

        assert Lagi.count() == 0
        assert Lagi.get(lagi.id) == null
        assert response.redirectedUrl == '/lagi/list'
    }
}
