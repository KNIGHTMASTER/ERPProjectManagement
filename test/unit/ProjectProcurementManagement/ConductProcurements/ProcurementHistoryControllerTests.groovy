package ProjectProcurementManagement.ConductProcurements



import org.junit.*
import grails.test.mixin.*

@TestFor(ProcurementHistoryController)
@Mock(ProcurementHistory)
class ProcurementHistoryControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/procurementHistory/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.procurementHistoryInstanceList.size() == 0
        assert model.procurementHistoryInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.procurementHistoryInstance != null
    }

    void testSave() {
        controller.save()

        assert model.procurementHistoryInstance != null
        assert view == '/procurementHistory/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/procurementHistory/show/1'
        assert controller.flash.message != null
        assert ProcurementHistory.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/procurementHistory/list'

        populateValidParams(params)
        def procurementHistory = new ProcurementHistory(params)

        assert procurementHistory.save() != null

        params.id = procurementHistory.id

        def model = controller.show()

        assert model.procurementHistoryInstance == procurementHistory
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/procurementHistory/list'

        populateValidParams(params)
        def procurementHistory = new ProcurementHistory(params)

        assert procurementHistory.save() != null

        params.id = procurementHistory.id

        def model = controller.edit()

        assert model.procurementHistoryInstance == procurementHistory
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/procurementHistory/list'

        response.reset()

        populateValidParams(params)
        def procurementHistory = new ProcurementHistory(params)

        assert procurementHistory.save() != null

        // test invalid parameters in update
        params.id = procurementHistory.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/procurementHistory/edit"
        assert model.procurementHistoryInstance != null

        procurementHistory.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/procurementHistory/show/$procurementHistory.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        procurementHistory.clearErrors()

        populateValidParams(params)
        params.id = procurementHistory.id
        params.version = -1
        controller.update()

        assert view == "/procurementHistory/edit"
        assert model.procurementHistoryInstance != null
        assert model.procurementHistoryInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/procurementHistory/list'

        response.reset()

        populateValidParams(params)
        def procurementHistory = new ProcurementHistory(params)

        assert procurementHistory.save() != null
        assert ProcurementHistory.count() == 1

        params.id = procurementHistory.id

        controller.delete()

        assert ProcurementHistory.count() == 0
        assert ProcurementHistory.get(procurementHistory.id) == null
        assert response.redirectedUrl == '/procurementHistory/list'
    }
}
