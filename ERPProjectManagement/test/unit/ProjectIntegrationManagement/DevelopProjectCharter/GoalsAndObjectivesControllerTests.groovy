package ProjectIntegrationManagement.DevelopProjectCharter



import org.junit.*
import grails.test.mixin.*

@TestFor(GoalsAndObjectivesController)
@Mock(GoalsAndObjectives)
class GoalsAndObjectivesControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/goalsAndObjectives/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.goalsAndObjectivesInstanceList.size() == 0
        assert model.goalsAndObjectivesInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.goalsAndObjectivesInstance != null
    }

    void testSave() {
        controller.save()

        assert model.goalsAndObjectivesInstance != null
        assert view == '/goalsAndObjectives/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/goalsAndObjectives/show/1'
        assert controller.flash.message != null
        assert GoalsAndObjectives.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/goalsAndObjectives/list'

        populateValidParams(params)
        def goalsAndObjectives = new GoalsAndObjectives(params)

        assert goalsAndObjectives.save() != null

        params.id = goalsAndObjectives.id

        def model = controller.show()

        assert model.goalsAndObjectivesInstance == goalsAndObjectives
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/goalsAndObjectives/list'

        populateValidParams(params)
        def goalsAndObjectives = new GoalsAndObjectives(params)

        assert goalsAndObjectives.save() != null

        params.id = goalsAndObjectives.id

        def model = controller.edit()

        assert model.goalsAndObjectivesInstance == goalsAndObjectives
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/goalsAndObjectives/list'

        response.reset()

        populateValidParams(params)
        def goalsAndObjectives = new GoalsAndObjectives(params)

        assert goalsAndObjectives.save() != null

        // test invalid parameters in update
        params.id = goalsAndObjectives.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/goalsAndObjectives/edit"
        assert model.goalsAndObjectivesInstance != null

        goalsAndObjectives.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/goalsAndObjectives/show/$goalsAndObjectives.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        goalsAndObjectives.clearErrors()

        populateValidParams(params)
        params.id = goalsAndObjectives.id
        params.version = -1
        controller.update()

        assert view == "/goalsAndObjectives/edit"
        assert model.goalsAndObjectivesInstance != null
        assert model.goalsAndObjectivesInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/goalsAndObjectives/list'

        response.reset()

        populateValidParams(params)
        def goalsAndObjectives = new GoalsAndObjectives(params)

        assert goalsAndObjectives.save() != null
        assert GoalsAndObjectives.count() == 1

        params.id = goalsAndObjectives.id

        controller.delete()

        assert GoalsAndObjectives.count() == 0
        assert GoalsAndObjectives.get(goalsAndObjectives.id) == null
        assert response.redirectedUrl == '/goalsAndObjectives/list'
    }
}
