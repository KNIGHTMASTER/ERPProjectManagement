package ProjectCommunicationManagement.IdentifyStakeholders



import org.junit.*
import grails.test.mixin.*

@TestFor(StakeholderRolesController)
@Mock(StakeholderRoles)
class StakeholderRolesControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/stakeholderRoles/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.stakeholderRolesInstanceList.size() == 0
        assert model.stakeholderRolesInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.stakeholderRolesInstance != null
    }

    void testSave() {
        controller.save()

        assert model.stakeholderRolesInstance != null
        assert view == '/stakeholderRoles/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/stakeholderRoles/show/1'
        assert controller.flash.message != null
        assert StakeholderRoles.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/stakeholderRoles/list'

        populateValidParams(params)
        def stakeholderRoles = new StakeholderRoles(params)

        assert stakeholderRoles.save() != null

        params.id = stakeholderRoles.id

        def model = controller.show()

        assert model.stakeholderRolesInstance == stakeholderRoles
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/stakeholderRoles/list'

        populateValidParams(params)
        def stakeholderRoles = new StakeholderRoles(params)

        assert stakeholderRoles.save() != null

        params.id = stakeholderRoles.id

        def model = controller.edit()

        assert model.stakeholderRolesInstance == stakeholderRoles
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/stakeholderRoles/list'

        response.reset()

        populateValidParams(params)
        def stakeholderRoles = new StakeholderRoles(params)

        assert stakeholderRoles.save() != null

        // test invalid parameters in update
        params.id = stakeholderRoles.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/stakeholderRoles/edit"
        assert model.stakeholderRolesInstance != null

        stakeholderRoles.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/stakeholderRoles/show/$stakeholderRoles.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        stakeholderRoles.clearErrors()

        populateValidParams(params)
        params.id = stakeholderRoles.id
        params.version = -1
        controller.update()

        assert view == "/stakeholderRoles/edit"
        assert model.stakeholderRolesInstance != null
        assert model.stakeholderRolesInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/stakeholderRoles/list'

        response.reset()

        populateValidParams(params)
        def stakeholderRoles = new StakeholderRoles(params)

        assert stakeholderRoles.save() != null
        assert StakeholderRoles.count() == 1

        params.id = stakeholderRoles.id

        controller.delete()

        assert StakeholderRoles.count() == 0
        assert StakeholderRoles.get(stakeholderRoles.id) == null
        assert response.redirectedUrl == '/stakeholderRoles/list'
    }
}
