package ProjectIntegrationManagement.DevelopProjectManagementPlan



import org.junit.*
import grails.test.mixin.*

@TestFor(DefinitionsOfChangeController)
@Mock(DefinitionsOfChange)
class DefinitionsOfChangeControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/definitionsOfChange/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.definitionsOfChangeInstanceList.size() == 0
        assert model.definitionsOfChangeInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.definitionsOfChangeInstance != null
    }

    void testSave() {
        controller.save()

        assert model.definitionsOfChangeInstance != null
        assert view == '/definitionsOfChange/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/definitionsOfChange/show/1'
        assert controller.flash.message != null
        assert DefinitionsOfChange.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/definitionsOfChange/list'

        populateValidParams(params)
        def definitionsOfChange = new DefinitionsOfChange(params)

        assert definitionsOfChange.save() != null

        params.id = definitionsOfChange.id

        def model = controller.show()

        assert model.definitionsOfChangeInstance == definitionsOfChange
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/definitionsOfChange/list'

        populateValidParams(params)
        def definitionsOfChange = new DefinitionsOfChange(params)

        assert definitionsOfChange.save() != null

        params.id = definitionsOfChange.id

        def model = controller.edit()

        assert model.definitionsOfChangeInstance == definitionsOfChange
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/definitionsOfChange/list'

        response.reset()

        populateValidParams(params)
        def definitionsOfChange = new DefinitionsOfChange(params)

        assert definitionsOfChange.save() != null

        // test invalid parameters in update
        params.id = definitionsOfChange.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/definitionsOfChange/edit"
        assert model.definitionsOfChangeInstance != null

        definitionsOfChange.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/definitionsOfChange/show/$definitionsOfChange.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        definitionsOfChange.clearErrors()

        populateValidParams(params)
        params.id = definitionsOfChange.id
        params.version = -1
        controller.update()

        assert view == "/definitionsOfChange/edit"
        assert model.definitionsOfChangeInstance != null
        assert model.definitionsOfChangeInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/definitionsOfChange/list'

        response.reset()

        populateValidParams(params)
        def definitionsOfChange = new DefinitionsOfChange(params)

        assert definitionsOfChange.save() != null
        assert DefinitionsOfChange.count() == 1

        params.id = definitionsOfChange.id

        controller.delete()

        assert DefinitionsOfChange.count() == 0
        assert DefinitionsOfChange.get(definitionsOfChange.id) == null
        assert response.redirectedUrl == '/definitionsOfChange/list'
    }
}
