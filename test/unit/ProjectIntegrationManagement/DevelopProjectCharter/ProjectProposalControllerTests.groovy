package ProjectIntegrationManagement.DevelopProjectCharter



import org.junit.*
import grails.test.mixin.*

@TestFor(ProjectProposalController)
@Mock(ProjectProposal)
class ProjectProposalControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/projectProposal/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.projectProposalInstanceList.size() == 0
        assert model.projectProposalInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.projectProposalInstance != null
    }

    void testSave() {
        controller.save()

        assert model.projectProposalInstance != null
        assert view == '/projectProposal/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/projectProposal/show/1'
        assert controller.flash.message != null
        assert ProjectProposal.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/projectProposal/list'

        populateValidParams(params)
        def projectProposal = new ProjectProposal(params)

        assert projectProposal.save() != null

        params.id = projectProposal.id

        def model = controller.show()

        assert model.projectProposalInstance == projectProposal
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/projectProposal/list'

        populateValidParams(params)
        def projectProposal = new ProjectProposal(params)

        assert projectProposal.save() != null

        params.id = projectProposal.id

        def model = controller.edit()

        assert model.projectProposalInstance == projectProposal
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/projectProposal/list'

        response.reset()

        populateValidParams(params)
        def projectProposal = new ProjectProposal(params)

        assert projectProposal.save() != null

        // test invalid parameters in update
        params.id = projectProposal.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/projectProposal/edit"
        assert model.projectProposalInstance != null

        projectProposal.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/projectProposal/show/$projectProposal.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        projectProposal.clearErrors()

        populateValidParams(params)
        params.id = projectProposal.id
        params.version = -1
        controller.update()

        assert view == "/projectProposal/edit"
        assert model.projectProposalInstance != null
        assert model.projectProposalInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/projectProposal/list'

        response.reset()

        populateValidParams(params)
        def projectProposal = new ProjectProposal(params)

        assert projectProposal.save() != null
        assert ProjectProposal.count() == 1

        params.id = projectProposal.id

        controller.delete()

        assert ProjectProposal.count() == 0
        assert ProjectProposal.get(projectProposal.id) == null
        assert response.redirectedUrl == '/projectProposal/list'
    }
}
