package ProjectHumanResourceManagement



import org.junit.*
import grails.test.mixin.*

@TestFor(TeamDevelopmentController)
@Mock(TeamDevelopment)
class TeamDevelopmentControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/teamDevelopment/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.teamDevelopmentInstanceList.size() == 0
        assert model.teamDevelopmentInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.teamDevelopmentInstance != null
    }

    void testSave() {
        controller.save()

        assert model.teamDevelopmentInstance != null
        assert view == '/teamDevelopment/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/teamDevelopment/show/1'
        assert controller.flash.message != null
        assert TeamDevelopment.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/teamDevelopment/list'

        populateValidParams(params)
        def teamDevelopment = new TeamDevelopment(params)

        assert teamDevelopment.save() != null

        params.id = teamDevelopment.id

        def model = controller.show()

        assert model.teamDevelopmentInstance == teamDevelopment
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/teamDevelopment/list'

        populateValidParams(params)
        def teamDevelopment = new TeamDevelopment(params)

        assert teamDevelopment.save() != null

        params.id = teamDevelopment.id

        def model = controller.edit()

        assert model.teamDevelopmentInstance == teamDevelopment
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/teamDevelopment/list'

        response.reset()

        populateValidParams(params)
        def teamDevelopment = new TeamDevelopment(params)

        assert teamDevelopment.save() != null

        // test invalid parameters in update
        params.id = teamDevelopment.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/teamDevelopment/edit"
        assert model.teamDevelopmentInstance != null

        teamDevelopment.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/teamDevelopment/show/$teamDevelopment.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        teamDevelopment.clearErrors()

        populateValidParams(params)
        params.id = teamDevelopment.id
        params.version = -1
        controller.update()

        assert view == "/teamDevelopment/edit"
        assert model.teamDevelopmentInstance != null
        assert model.teamDevelopmentInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/teamDevelopment/list'

        response.reset()

        populateValidParams(params)
        def teamDevelopment = new TeamDevelopment(params)

        assert teamDevelopment.save() != null
        assert TeamDevelopment.count() == 1

        params.id = teamDevelopment.id

        controller.delete()

        assert TeamDevelopment.count() == 0
        assert TeamDevelopment.get(teamDevelopment.id) == null
        assert response.redirectedUrl == '/teamDevelopment/list'
    }
}
