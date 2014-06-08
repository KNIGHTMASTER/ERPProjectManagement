package ProjectCommunicationManagement.IdentifyStakeholders



import org.junit.*
import grails.test.mixin.*

@TestFor(StakeholderManagementStrategyController)
@Mock(StakeholderManagementStrategy)
class StakeholderManagementStrategyControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/stakeholderManagementStrategy/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.stakeholderManagementStrategyInstanceList.size() == 0
        assert model.stakeholderManagementStrategyInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.stakeholderManagementStrategyInstance != null
    }

    void testSave() {
        controller.save()

        assert model.stakeholderManagementStrategyInstance != null
        assert view == '/stakeholderManagementStrategy/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/stakeholderManagementStrategy/show/1'
        assert controller.flash.message != null
        assert StakeholderManagementStrategy.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/stakeholderManagementStrategy/list'

        populateValidParams(params)
        def stakeholderManagementStrategy = new StakeholderManagementStrategy(params)

        assert stakeholderManagementStrategy.save() != null

        params.id = stakeholderManagementStrategy.id

        def model = controller.show()

        assert model.stakeholderManagementStrategyInstance == stakeholderManagementStrategy
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/stakeholderManagementStrategy/list'

        populateValidParams(params)
        def stakeholderManagementStrategy = new StakeholderManagementStrategy(params)

        assert stakeholderManagementStrategy.save() != null

        params.id = stakeholderManagementStrategy.id

        def model = controller.edit()

        assert model.stakeholderManagementStrategyInstance == stakeholderManagementStrategy
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/stakeholderManagementStrategy/list'

        response.reset()

        populateValidParams(params)
        def stakeholderManagementStrategy = new StakeholderManagementStrategy(params)

        assert stakeholderManagementStrategy.save() != null

        // test invalid parameters in update
        params.id = stakeholderManagementStrategy.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/stakeholderManagementStrategy/edit"
        assert model.stakeholderManagementStrategyInstance != null

        stakeholderManagementStrategy.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/stakeholderManagementStrategy/show/$stakeholderManagementStrategy.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        stakeholderManagementStrategy.clearErrors()

        populateValidParams(params)
        params.id = stakeholderManagementStrategy.id
        params.version = -1
        controller.update()

        assert view == "/stakeholderManagementStrategy/edit"
        assert model.stakeholderManagementStrategyInstance != null
        assert model.stakeholderManagementStrategyInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/stakeholderManagementStrategy/list'

        response.reset()

        populateValidParams(params)
        def stakeholderManagementStrategy = new StakeholderManagementStrategy(params)

        assert stakeholderManagementStrategy.save() != null
        assert StakeholderManagementStrategy.count() == 1

        params.id = stakeholderManagementStrategy.id

        controller.delete()

        assert StakeholderManagementStrategy.count() == 0
        assert StakeholderManagementStrategy.get(stakeholderManagementStrategy.id) == null
        assert response.redirectedUrl == '/stakeholderManagementStrategy/list'
    }
}
