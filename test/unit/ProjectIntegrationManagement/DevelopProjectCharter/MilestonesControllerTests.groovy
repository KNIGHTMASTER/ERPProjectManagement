package ProjectIntegrationManagement.DevelopProjectCharter



import org.junit.*
import grails.test.mixin.*

@TestFor(MilestonesController)
@Mock(Milestones)
class MilestonesControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/milestones/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.milestonesInstanceList.size() == 0
        assert model.milestonesInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.milestonesInstance != null
    }

    void testSave() {
        controller.save()

        assert model.milestonesInstance != null
        assert view == '/milestones/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/milestones/show/1'
        assert controller.flash.message != null
        assert Milestones.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/milestones/list'

        populateValidParams(params)
        def milestones = new Milestones(params)

        assert milestones.save() != null

        params.id = milestones.id

        def model = controller.show()

        assert model.milestonesInstance == milestones
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/milestones/list'

        populateValidParams(params)
        def milestones = new Milestones(params)

        assert milestones.save() != null

        params.id = milestones.id

        def model = controller.edit()

        assert model.milestonesInstance == milestones
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/milestones/list'

        response.reset()

        populateValidParams(params)
        def milestones = new Milestones(params)

        assert milestones.save() != null

        // test invalid parameters in update
        params.id = milestones.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/milestones/edit"
        assert model.milestonesInstance != null

        milestones.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/milestones/show/$milestones.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        milestones.clearErrors()

        populateValidParams(params)
        params.id = milestones.id
        params.version = -1
        controller.update()

        assert view == "/milestones/edit"
        assert model.milestonesInstance != null
        assert model.milestonesInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/milestones/list'

        response.reset()

        populateValidParams(params)
        def milestones = new Milestones(params)

        assert milestones.save() != null
        assert Milestones.count() == 1

        params.id = milestones.id

        controller.delete()

        assert Milestones.count() == 0
        assert Milestones.get(milestones.id) == null
        assert response.redirectedUrl == '/milestones/list'
    }
}
