package ProjectProcurementManagement.PlanProcurement



import org.junit.*
import grails.test.mixin.*

@TestFor(ApprovalController)
@Mock(Approval)
class ApprovalControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/approval/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.approvalInstanceList.size() == 0
        assert model.approvalInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.approvalInstance != null
    }

    void testSave() {
        controller.save()

        assert model.approvalInstance != null
        assert view == '/approval/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/approval/show/1'
        assert controller.flash.message != null
        assert Approval.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/approval/list'

        populateValidParams(params)
        def approval = new Approval(params)

        assert approval.save() != null

        params.id = approval.id

        def model = controller.show()

        assert model.approvalInstance == approval
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/approval/list'

        populateValidParams(params)
        def approval = new Approval(params)

        assert approval.save() != null

        params.id = approval.id

        def model = controller.edit()

        assert model.approvalInstance == approval
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/approval/list'

        response.reset()

        populateValidParams(params)
        def approval = new Approval(params)

        assert approval.save() != null

        // test invalid parameters in update
        params.id = approval.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/approval/edit"
        assert model.approvalInstance != null

        approval.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/approval/show/$approval.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        approval.clearErrors()

        populateValidParams(params)
        params.id = approval.id
        params.version = -1
        controller.update()

        assert view == "/approval/edit"
        assert model.approvalInstance != null
        assert model.approvalInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/approval/list'

        response.reset()

        populateValidParams(params)
        def approval = new Approval(params)

        assert approval.save() != null
        assert Approval.count() == 1

        params.id = approval.id

        controller.delete()

        assert Approval.count() == 0
        assert Approval.get(approval.id) == null
        assert response.redirectedUrl == '/approval/list'
    }
}
