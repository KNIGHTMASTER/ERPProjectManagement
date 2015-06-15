package ProjectIntegrationManagement.DevelopProjectCharter



import org.junit.*
import grails.test.mixin.*

@TestFor(MilestoneTypeController)
@Mock(MilestoneType)
class MilestoneTypeControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/milestoneType/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.milestoneTypeInstanceList.size() == 0
        assert model.milestoneTypeInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.milestoneTypeInstance != null
    }

    void testSave() {
        controller.save()

        assert model.milestoneTypeInstance != null
        assert view == '/milestoneType/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/milestoneType/show/1'
        assert controller.flash.message != null
        assert MilestoneType.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/milestoneType/list'

        populateValidParams(params)
        def milestoneType = new MilestoneType(params)

        assert milestoneType.save() != null

        params.id = milestoneType.id

        def model = controller.show()

        assert model.milestoneTypeInstance == milestoneType
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/milestoneType/list'

        populateValidParams(params)
        def milestoneType = new MilestoneType(params)

        assert milestoneType.save() != null

        params.id = milestoneType.id

        def model = controller.edit()

        assert model.milestoneTypeInstance == milestoneType
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/milestoneType/list'

        response.reset()

        populateValidParams(params)
        def milestoneType = new MilestoneType(params)

        assert milestoneType.save() != null

        // test invalid parameters in update
        params.id = milestoneType.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/milestoneType/edit"
        assert model.milestoneTypeInstance != null

        milestoneType.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/milestoneType/show/$milestoneType.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        milestoneType.clearErrors()

        populateValidParams(params)
        params.id = milestoneType.id
        params.version = -1
        controller.update()

        assert view == "/milestoneType/edit"
        assert model.milestoneTypeInstance != null
        assert model.milestoneTypeInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/milestoneType/list'

        response.reset()

        populateValidParams(params)
        def milestoneType = new MilestoneType(params)

        assert milestoneType.save() != null
        assert MilestoneType.count() == 1

        params.id = milestoneType.id

        controller.delete()

        assert MilestoneType.count() == 0
        assert MilestoneType.get(milestoneType.id) == null
        assert response.redirectedUrl == '/milestoneType/list'
    }
}
