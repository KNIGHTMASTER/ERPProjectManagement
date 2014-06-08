package WebPage



import org.junit.*
import grails.test.mixin.*

@TestFor(ProcurementController)
@Mock(Procurement)
class ProcurementControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/procurement/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.procurementInstanceList.size() == 0
        assert model.procurementInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.procurementInstance != null
    }

    void testSave() {
        controller.save()

        assert model.procurementInstance != null
        assert view == '/procurement/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/procurement/show/1'
        assert controller.flash.message != null
        assert Procurement.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/procurement/list'

        populateValidParams(params)
        def procurement = new Procurement(params)

        assert procurement.save() != null

        params.id = procurement.id

        def model = controller.show()

        assert model.procurementInstance == procurement
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/procurement/list'

        populateValidParams(params)
        def procurement = new Procurement(params)

        assert procurement.save() != null

        params.id = procurement.id

        def model = controller.edit()

        assert model.procurementInstance == procurement
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/procurement/list'

        response.reset()

        populateValidParams(params)
        def procurement = new Procurement(params)

        assert procurement.save() != null

        // test invalid parameters in update
        params.id = procurement.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/procurement/edit"
        assert model.procurementInstance != null

        procurement.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/procurement/show/$procurement.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        procurement.clearErrors()

        populateValidParams(params)
        params.id = procurement.id
        params.version = -1
        controller.update()

        assert view == "/procurement/edit"
        assert model.procurementInstance != null
        assert model.procurementInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/procurement/list'

        response.reset()

        populateValidParams(params)
        def procurement = new Procurement(params)

        assert procurement.save() != null
        assert Procurement.count() == 1

        params.id = procurement.id

        controller.delete()

        assert Procurement.count() == 0
        assert Procurement.get(procurement.id) == null
        assert response.redirectedUrl == '/procurement/list'
    }
}
