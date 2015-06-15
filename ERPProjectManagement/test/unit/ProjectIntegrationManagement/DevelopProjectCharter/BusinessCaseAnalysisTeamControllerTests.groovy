package ProjectIntegrationManagement.DevelopProjectCharter



import org.junit.*
import grails.test.mixin.*

@TestFor(BusinessCaseAnalysisTeamController)
@Mock(BusinessCaseAnalysisTeam)
class BusinessCaseAnalysisTeamControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/businessCaseAnalysisTeam/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.businessCaseAnalysisTeamInstanceList.size() == 0
        assert model.businessCaseAnalysisTeamInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.businessCaseAnalysisTeamInstance != null
    }

    void testSave() {
        controller.save()

        assert model.businessCaseAnalysisTeamInstance != null
        assert view == '/businessCaseAnalysisTeam/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/businessCaseAnalysisTeam/show/1'
        assert controller.flash.message != null
        assert BusinessCaseAnalysisTeam.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/businessCaseAnalysisTeam/list'

        populateValidParams(params)
        def businessCaseAnalysisTeam = new BusinessCaseAnalysisTeam(params)

        assert businessCaseAnalysisTeam.save() != null

        params.id = businessCaseAnalysisTeam.id

        def model = controller.show()

        assert model.businessCaseAnalysisTeamInstance == businessCaseAnalysisTeam
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/businessCaseAnalysisTeam/list'

        populateValidParams(params)
        def businessCaseAnalysisTeam = new BusinessCaseAnalysisTeam(params)

        assert businessCaseAnalysisTeam.save() != null

        params.id = businessCaseAnalysisTeam.id

        def model = controller.edit()

        assert model.businessCaseAnalysisTeamInstance == businessCaseAnalysisTeam
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/businessCaseAnalysisTeam/list'

        response.reset()

        populateValidParams(params)
        def businessCaseAnalysisTeam = new BusinessCaseAnalysisTeam(params)

        assert businessCaseAnalysisTeam.save() != null

        // test invalid parameters in update
        params.id = businessCaseAnalysisTeam.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/businessCaseAnalysisTeam/edit"
        assert model.businessCaseAnalysisTeamInstance != null

        businessCaseAnalysisTeam.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/businessCaseAnalysisTeam/show/$businessCaseAnalysisTeam.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        businessCaseAnalysisTeam.clearErrors()

        populateValidParams(params)
        params.id = businessCaseAnalysisTeam.id
        params.version = -1
        controller.update()

        assert view == "/businessCaseAnalysisTeam/edit"
        assert model.businessCaseAnalysisTeamInstance != null
        assert model.businessCaseAnalysisTeamInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/businessCaseAnalysisTeam/list'

        response.reset()

        populateValidParams(params)
        def businessCaseAnalysisTeam = new BusinessCaseAnalysisTeam(params)

        assert businessCaseAnalysisTeam.save() != null
        assert BusinessCaseAnalysisTeam.count() == 1

        params.id = businessCaseAnalysisTeam.id

        controller.delete()

        assert BusinessCaseAnalysisTeam.count() == 0
        assert BusinessCaseAnalysisTeam.get(businessCaseAnalysisTeam.id) == null
        assert response.redirectedUrl == '/businessCaseAnalysisTeam/list'
    }
}
