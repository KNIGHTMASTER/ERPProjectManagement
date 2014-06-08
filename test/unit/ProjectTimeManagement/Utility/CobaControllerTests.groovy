package ProjectTimeManagement.Utility



import org.junit.*
import grails.test.mixin.*

@TestFor(CobaController)
@Mock(Coba)
class CobaControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/coba/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.cobaInstanceList.size() == 0
        assert model.cobaInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.cobaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.cobaInstance != null
        assert view == '/coba/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/coba/show/1'
        assert controller.flash.message != null
        assert Coba.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/coba/list'

        populateValidParams(params)
        def coba = new Coba(params)

        assert coba.save() != null

        params.id = coba.id

        def model = controller.show()

        assert model.cobaInstance == coba
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/coba/list'

        populateValidParams(params)
        def coba = new Coba(params)

        assert coba.save() != null

        params.id = coba.id

        def model = controller.edit()

        assert model.cobaInstance == coba
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/coba/list'

        response.reset()

        populateValidParams(params)
        def coba = new Coba(params)

        assert coba.save() != null

        // test invalid parameters in update
        params.id = coba.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/coba/edit"
        assert model.cobaInstance != null

        coba.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/coba/show/$coba.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        coba.clearErrors()

        populateValidParams(params)
        params.id = coba.id
        params.version = -1
        controller.update()

        assert view == "/coba/edit"
        assert model.cobaInstance != null
        assert model.cobaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/coba/list'

        response.reset()

        populateValidParams(params)
        def coba = new Coba(params)

        assert coba.save() != null
        assert Coba.count() == 1

        params.id = coba.id

        controller.delete()

        assert Coba.count() == 0
        assert Coba.get(coba.id) == null
        assert response.redirectedUrl == '/coba/list'
    }
}
