package ProjectIntegrationManagement.DevelopProjectCharter



import org.junit.*
import grails.test.mixin.*

@TestFor(ExecutiveSummaryController)
@Mock(ExecutiveSummary)
class ExecutiveSummaryControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/executiveSummary/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.executiveSummaryInstanceList.size() == 0
        assert model.executiveSummaryInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.executiveSummaryInstance != null
    }

    void testSave() {
        controller.save()

        assert model.executiveSummaryInstance != null
        assert view == '/executiveSummary/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/executiveSummary/show/1'
        assert controller.flash.message != null
        assert ExecutiveSummary.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/executiveSummary/list'

        populateValidParams(params)
        def executiveSummary = new ExecutiveSummary(params)

        assert executiveSummary.save() != null

        params.id = executiveSummary.id

        def model = controller.show()

        assert model.executiveSummaryInstance == executiveSummary
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/executiveSummary/list'

        populateValidParams(params)
        def executiveSummary = new ExecutiveSummary(params)

        assert executiveSummary.save() != null

        params.id = executiveSummary.id

        def model = controller.edit()

        assert model.executiveSummaryInstance == executiveSummary
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/executiveSummary/list'

        response.reset()

        populateValidParams(params)
        def executiveSummary = new ExecutiveSummary(params)

        assert executiveSummary.save() != null

        // test invalid parameters in update
        params.id = executiveSummary.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/executiveSummary/edit"
        assert model.executiveSummaryInstance != null

        executiveSummary.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/executiveSummary/show/$executiveSummary.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        executiveSummary.clearErrors()

        populateValidParams(params)
        params.id = executiveSummary.id
        params.version = -1
        controller.update()

        assert view == "/executiveSummary/edit"
        assert model.executiveSummaryInstance != null
        assert model.executiveSummaryInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/executiveSummary/list'

        response.reset()

        populateValidParams(params)
        def executiveSummary = new ExecutiveSummary(params)

        assert executiveSummary.save() != null
        assert ExecutiveSummary.count() == 1

        params.id = executiveSummary.id

        controller.delete()

        assert ExecutiveSummary.count() == 0
        assert ExecutiveSummary.get(executiveSummary.id) == null
        assert response.redirectedUrl == '/executiveSummary/list'
    }
}
