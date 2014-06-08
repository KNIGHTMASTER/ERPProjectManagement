package ProjectIntegrationManagement.DevelopProjectCharter



import org.junit.*
import grails.test.mixin.*

@TestFor(BusinessCaseApprovalController)
@Mock(BusinessCaseApproval)
class BusinessCaseApprovalControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/businessCaseApproval/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.businessCaseApprovalInstanceList.size() == 0
        assert model.businessCaseApprovalInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.businessCaseApprovalInstance != null
    }

    void testSave() {
        controller.save()

        assert model.businessCaseApprovalInstance != null
        assert view == '/businessCaseApproval/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/businessCaseApproval/show/1'
        assert controller.flash.message != null
        assert BusinessCaseApproval.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/businessCaseApproval/list'

        populateValidParams(params)
        def businessCaseApproval = new BusinessCaseApproval(params)

        assert businessCaseApproval.save() != null

        params.id = businessCaseApproval.id

        def model = controller.show()

        assert model.businessCaseApprovalInstance == businessCaseApproval
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/businessCaseApproval/list'

        populateValidParams(params)
        def businessCaseApproval = new BusinessCaseApproval(params)

        assert businessCaseApproval.save() != null

        params.id = businessCaseApproval.id

        def model = controller.edit()

        assert model.businessCaseApprovalInstance == businessCaseApproval
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/businessCaseApproval/list'

        response.reset()

        populateValidParams(params)
        def businessCaseApproval = new BusinessCaseApproval(params)

        assert businessCaseApproval.save() != null

        // test invalid parameters in update
        params.id = businessCaseApproval.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/businessCaseApproval/edit"
        assert model.businessCaseApprovalInstance != null

        businessCaseApproval.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/businessCaseApproval/show/$businessCaseApproval.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        businessCaseApproval.clearErrors()

        populateValidParams(params)
        params.id = businessCaseApproval.id
        params.version = -1
        controller.update()

        assert view == "/businessCaseApproval/edit"
        assert model.businessCaseApprovalInstance != null
        assert model.businessCaseApprovalInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/businessCaseApproval/list'

        response.reset()

        populateValidParams(params)
        def businessCaseApproval = new BusinessCaseApproval(params)

        assert businessCaseApproval.save() != null
        assert BusinessCaseApproval.count() == 1

        params.id = businessCaseApproval.id

        controller.delete()

        assert BusinessCaseApproval.count() == 0
        assert BusinessCaseApproval.get(businessCaseApproval.id) == null
        assert response.redirectedUrl == '/businessCaseApproval/list'
    }
}
