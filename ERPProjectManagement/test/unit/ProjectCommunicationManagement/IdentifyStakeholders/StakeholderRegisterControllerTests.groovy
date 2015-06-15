package ProjectCommunicationManagement.IdentifyStakeholders



import org.junit.*
import grails.test.mixin.*

@TestFor(StakeholderRegisterController)
@Mock(StakeholderRegister)
class StakeholderRegisterControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/stakeholderRegister/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.stakeholderRegisterInstanceList.size() == 0
        assert model.stakeholderRegisterInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.stakeholderRegisterInstance != null
    }

    void testSave() {
        controller.save()

        assert model.stakeholderRegisterInstance != null
        assert view == '/stakeholderRegister/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/stakeholderRegister/show/1'
        assert controller.flash.message != null
        assert StakeholderRegister.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/stakeholderRegister/list'

        populateValidParams(params)
        def stakeholderRegister = new StakeholderRegister(params)

        assert stakeholderRegister.save() != null

        params.id = stakeholderRegister.id

        def model = controller.show()

        assert model.stakeholderRegisterInstance == stakeholderRegister
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/stakeholderRegister/list'

        populateValidParams(params)
        def stakeholderRegister = new StakeholderRegister(params)

        assert stakeholderRegister.save() != null

        params.id = stakeholderRegister.id

        def model = controller.edit()

        assert model.stakeholderRegisterInstance == stakeholderRegister
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/stakeholderRegister/list'

        response.reset()

        populateValidParams(params)
        def stakeholderRegister = new StakeholderRegister(params)

        assert stakeholderRegister.save() != null

        // test invalid parameters in update
        params.id = stakeholderRegister.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/stakeholderRegister/edit"
        assert model.stakeholderRegisterInstance != null

        stakeholderRegister.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/stakeholderRegister/show/$stakeholderRegister.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        stakeholderRegister.clearErrors()

        populateValidParams(params)
        params.id = stakeholderRegister.id
        params.version = -1
        controller.update()

        assert view == "/stakeholderRegister/edit"
        assert model.stakeholderRegisterInstance != null
        assert model.stakeholderRegisterInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/stakeholderRegister/list'

        response.reset()

        populateValidParams(params)
        def stakeholderRegister = new StakeholderRegister(params)

        assert stakeholderRegister.save() != null
        assert StakeholderRegister.count() == 1

        params.id = stakeholderRegister.id

        controller.delete()

        assert StakeholderRegister.count() == 0
        assert StakeholderRegister.get(stakeholderRegister.id) == null
        assert response.redirectedUrl == '/stakeholderRegister/list'
    }
}
