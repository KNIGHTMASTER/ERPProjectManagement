package ProjectProcurementManagement.ConductProcurements



import org.junit.*
import grails.test.mixin.*

@TestFor(ProcurementNegotiationController)
@Mock(ProcurementNegotiation)
class ProcurementNegotiationControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/procurementNegotiation/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.procurementNegotiationInstanceList.size() == 0
        assert model.procurementNegotiationInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.procurementNegotiationInstance != null
    }

    void testSave() {
        controller.save()

        assert model.procurementNegotiationInstance != null
        assert view == '/procurementNegotiation/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/procurementNegotiation/show/1'
        assert controller.flash.message != null
        assert ProcurementNegotiation.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/procurementNegotiation/list'

        populateValidParams(params)
        def procurementNegotiation = new ProcurementNegotiation(params)

        assert procurementNegotiation.save() != null

        params.id = procurementNegotiation.id

        def model = controller.show()

        assert model.procurementNegotiationInstance == procurementNegotiation
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/procurementNegotiation/list'

        populateValidParams(params)
        def procurementNegotiation = new ProcurementNegotiation(params)

        assert procurementNegotiation.save() != null

        params.id = procurementNegotiation.id

        def model = controller.edit()

        assert model.procurementNegotiationInstance == procurementNegotiation
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/procurementNegotiation/list'

        response.reset()

        populateValidParams(params)
        def procurementNegotiation = new ProcurementNegotiation(params)

        assert procurementNegotiation.save() != null

        // test invalid parameters in update
        params.id = procurementNegotiation.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/procurementNegotiation/edit"
        assert model.procurementNegotiationInstance != null

        procurementNegotiation.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/procurementNegotiation/show/$procurementNegotiation.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        procurementNegotiation.clearErrors()

        populateValidParams(params)
        params.id = procurementNegotiation.id
        params.version = -1
        controller.update()

        assert view == "/procurementNegotiation/edit"
        assert model.procurementNegotiationInstance != null
        assert model.procurementNegotiationInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/procurementNegotiation/list'

        response.reset()

        populateValidParams(params)
        def procurementNegotiation = new ProcurementNegotiation(params)

        assert procurementNegotiation.save() != null
        assert ProcurementNegotiation.count() == 1

        params.id = procurementNegotiation.id

        controller.delete()

        assert ProcurementNegotiation.count() == 0
        assert ProcurementNegotiation.get(procurementNegotiation.id) == null
        assert response.redirectedUrl == '/procurementNegotiation/list'
    }
}
