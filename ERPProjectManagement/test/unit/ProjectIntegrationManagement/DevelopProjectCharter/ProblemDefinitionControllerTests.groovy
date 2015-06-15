package ProjectIntegrationManagement.DevelopProjectCharter



import org.junit.*
import grails.test.mixin.*

@TestFor(ProblemDefinitionController)
@Mock(ProblemDefinition)
class ProblemDefinitionControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/problemDefinition/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.problemDefinitionInstanceList.size() == 0
        assert model.problemDefinitionInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.problemDefinitionInstance != null
    }

    void testSave() {
        controller.save()

        assert model.problemDefinitionInstance != null
        assert view == '/problemDefinition/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/problemDefinition/show/1'
        assert controller.flash.message != null
        assert ProblemDefinition.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/problemDefinition/list'

        populateValidParams(params)
        def problemDefinition = new ProblemDefinition(params)

        assert problemDefinition.save() != null

        params.id = problemDefinition.id

        def model = controller.show()

        assert model.problemDefinitionInstance == problemDefinition
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/problemDefinition/list'

        populateValidParams(params)
        def problemDefinition = new ProblemDefinition(params)

        assert problemDefinition.save() != null

        params.id = problemDefinition.id

        def model = controller.edit()

        assert model.problemDefinitionInstance == problemDefinition
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/problemDefinition/list'

        response.reset()

        populateValidParams(params)
        def problemDefinition = new ProblemDefinition(params)

        assert problemDefinition.save() != null

        // test invalid parameters in update
        params.id = problemDefinition.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/problemDefinition/edit"
        assert model.problemDefinitionInstance != null

        problemDefinition.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/problemDefinition/show/$problemDefinition.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        problemDefinition.clearErrors()

        populateValidParams(params)
        params.id = problemDefinition.id
        params.version = -1
        controller.update()

        assert view == "/problemDefinition/edit"
        assert model.problemDefinitionInstance != null
        assert model.problemDefinitionInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/problemDefinition/list'

        response.reset()

        populateValidParams(params)
        def problemDefinition = new ProblemDefinition(params)

        assert problemDefinition.save() != null
        assert ProblemDefinition.count() == 1

        params.id = problemDefinition.id

        controller.delete()

        assert ProblemDefinition.count() == 0
        assert ProblemDefinition.get(problemDefinition.id) == null
        assert response.redirectedUrl == '/problemDefinition/list'
    }
}
