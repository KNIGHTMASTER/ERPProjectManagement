package ProjectIntegrationManagement.DevelopProjectCharter



import org.junit.*
import grails.test.mixin.*

@TestFor(CostBenefitAnalysisController)
@Mock(CostBenefitAnalysis)
class CostBenefitAnalysisControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/costBenefitAnalysis/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.costBenefitAnalysisInstanceList.size() == 0
        assert model.costBenefitAnalysisInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.costBenefitAnalysisInstance != null
    }

    void testSave() {
        controller.save()

        assert model.costBenefitAnalysisInstance != null
        assert view == '/costBenefitAnalysis/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/costBenefitAnalysis/show/1'
        assert controller.flash.message != null
        assert CostBenefitAnalysis.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/costBenefitAnalysis/list'

        populateValidParams(params)
        def costBenefitAnalysis = new CostBenefitAnalysis(params)

        assert costBenefitAnalysis.save() != null

        params.id = costBenefitAnalysis.id

        def model = controller.show()

        assert model.costBenefitAnalysisInstance == costBenefitAnalysis
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/costBenefitAnalysis/list'

        populateValidParams(params)
        def costBenefitAnalysis = new CostBenefitAnalysis(params)

        assert costBenefitAnalysis.save() != null

        params.id = costBenefitAnalysis.id

        def model = controller.edit()

        assert model.costBenefitAnalysisInstance == costBenefitAnalysis
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/costBenefitAnalysis/list'

        response.reset()

        populateValidParams(params)
        def costBenefitAnalysis = new CostBenefitAnalysis(params)

        assert costBenefitAnalysis.save() != null

        // test invalid parameters in update
        params.id = costBenefitAnalysis.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/costBenefitAnalysis/edit"
        assert model.costBenefitAnalysisInstance != null

        costBenefitAnalysis.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/costBenefitAnalysis/show/$costBenefitAnalysis.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        costBenefitAnalysis.clearErrors()

        populateValidParams(params)
        params.id = costBenefitAnalysis.id
        params.version = -1
        controller.update()

        assert view == "/costBenefitAnalysis/edit"
        assert model.costBenefitAnalysisInstance != null
        assert model.costBenefitAnalysisInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/costBenefitAnalysis/list'

        response.reset()

        populateValidParams(params)
        def costBenefitAnalysis = new CostBenefitAnalysis(params)

        assert costBenefitAnalysis.save() != null
        assert CostBenefitAnalysis.count() == 1

        params.id = costBenefitAnalysis.id

        controller.delete()

        assert CostBenefitAnalysis.count() == 0
        assert CostBenefitAnalysis.get(costBenefitAnalysis.id) == null
        assert response.redirectedUrl == '/costBenefitAnalysis/list'
    }
}
