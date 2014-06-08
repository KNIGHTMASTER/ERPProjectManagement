package ProjectTimeManagement.DevelopSchedule



import org.junit.*
import grails.test.mixin.*

@TestFor(TimeApprovalController)
@Mock(TimeApproval)
class TimeApprovalControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/timeApproval/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.timeApprovalInstanceList.size() == 0
        assert model.timeApprovalInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.timeApprovalInstance != null
    }

    void testSave() {
        controller.save()

        assert model.timeApprovalInstance != null
        assert view == '/timeApproval/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/timeApproval/show/1'
        assert controller.flash.message != null
        assert TimeApproval.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/timeApproval/list'

        populateValidParams(params)
        def timeApproval = new TimeApproval(params)

        assert timeApproval.save() != null

        params.id = timeApproval.id

        def model = controller.show()

        assert model.timeApprovalInstance == timeApproval
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/timeApproval/list'

        populateValidParams(params)
        def timeApproval = new TimeApproval(params)

        assert timeApproval.save() != null

        params.id = timeApproval.id

        def model = controller.edit()

        assert model.timeApprovalInstance == timeApproval
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/timeApproval/list'

        response.reset()

        populateValidParams(params)
        def timeApproval = new TimeApproval(params)

        assert timeApproval.save() != null

        // test invalid parameters in update
        params.id = timeApproval.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/timeApproval/edit"
        assert model.timeApprovalInstance != null

        timeApproval.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/timeApproval/show/$timeApproval.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        timeApproval.clearErrors()

        populateValidParams(params)
        params.id = timeApproval.id
        params.version = -1
        controller.update()

        assert view == "/timeApproval/edit"
        assert model.timeApprovalInstance != null
        assert model.timeApprovalInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/timeApproval/list'

        response.reset()

        populateValidParams(params)
        def timeApproval = new TimeApproval(params)

        assert timeApproval.save() != null
        assert TimeApproval.count() == 1

        params.id = timeApproval.id

        controller.delete()

        assert TimeApproval.count() == 0
        assert TimeApproval.get(timeApproval.id) == null
        assert response.redirectedUrl == '/timeApproval/list'
    }
}
