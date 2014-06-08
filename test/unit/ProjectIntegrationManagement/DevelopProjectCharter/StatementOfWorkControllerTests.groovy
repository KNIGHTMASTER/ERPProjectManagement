package ProjectIntegrationManagement.DevelopProjectCharter



import org.junit.*
import grails.test.mixin.*

@TestFor(StatementOfWorkController)
@Mock(StatementOfWork)
class StatementOfWorkControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/statementOfWork/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.statementOfWorkInstanceList.size() == 0
        assert model.statementOfWorkInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.statementOfWorkInstance != null
    }

    void testSave() {
        controller.save()

        assert model.statementOfWorkInstance != null
        assert view == '/statementOfWork/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/statementOfWork/show/1'
        assert controller.flash.message != null
        assert StatementOfWork.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/statementOfWork/list'

        populateValidParams(params)
        def statementOfWork = new StatementOfWork(params)

        assert statementOfWork.save() != null

        params.id = statementOfWork.id

        def model = controller.show()

        assert model.statementOfWorkInstance == statementOfWork
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/statementOfWork/list'

        populateValidParams(params)
        def statementOfWork = new StatementOfWork(params)

        assert statementOfWork.save() != null

        params.id = statementOfWork.id

        def model = controller.edit()

        assert model.statementOfWorkInstance == statementOfWork
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/statementOfWork/list'

        response.reset()

        populateValidParams(params)
        def statementOfWork = new StatementOfWork(params)

        assert statementOfWork.save() != null

        // test invalid parameters in update
        params.id = statementOfWork.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/statementOfWork/edit"
        assert model.statementOfWorkInstance != null

        statementOfWork.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/statementOfWork/show/$statementOfWork.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        statementOfWork.clearErrors()

        populateValidParams(params)
        params.id = statementOfWork.id
        params.version = -1
        controller.update()

        assert view == "/statementOfWork/edit"
        assert model.statementOfWorkInstance != null
        assert model.statementOfWorkInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/statementOfWork/list'

        response.reset()

        populateValidParams(params)
        def statementOfWork = new StatementOfWork(params)

        assert statementOfWork.save() != null
        assert StatementOfWork.count() == 1

        params.id = statementOfWork.id

        controller.delete()

        assert StatementOfWork.count() == 0
        assert StatementOfWork.get(statementOfWork.id) == null
        assert response.redirectedUrl == '/statementOfWork/list'
    }
}
