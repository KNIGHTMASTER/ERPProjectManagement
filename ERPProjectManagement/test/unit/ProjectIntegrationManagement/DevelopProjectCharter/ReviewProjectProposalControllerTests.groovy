package ProjectIntegrationManagement.DevelopProjectCharter



import org.junit.*
import grails.test.mixin.*

@TestFor(ReviewProjectProposalController)
@Mock(ReviewProjectProposal)
class ReviewProjectProposalControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/reviewProjectProposal/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.reviewProjectProposalInstanceList.size() == 0
        assert model.reviewProjectProposalInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.reviewProjectProposalInstance != null
    }

    void testSave() {
        controller.save()

        assert model.reviewProjectProposalInstance != null
        assert view == '/reviewProjectProposal/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/reviewProjectProposal/show/1'
        assert controller.flash.message != null
        assert ReviewProjectProposal.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/reviewProjectProposal/list'

        populateValidParams(params)
        def reviewProjectProposal = new ReviewProjectProposal(params)

        assert reviewProjectProposal.save() != null

        params.id = reviewProjectProposal.id

        def model = controller.show()

        assert model.reviewProjectProposalInstance == reviewProjectProposal
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/reviewProjectProposal/list'

        populateValidParams(params)
        def reviewProjectProposal = new ReviewProjectProposal(params)

        assert reviewProjectProposal.save() != null

        params.id = reviewProjectProposal.id

        def model = controller.edit()

        assert model.reviewProjectProposalInstance == reviewProjectProposal
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/reviewProjectProposal/list'

        response.reset()

        populateValidParams(params)
        def reviewProjectProposal = new ReviewProjectProposal(params)

        assert reviewProjectProposal.save() != null

        // test invalid parameters in update
        params.id = reviewProjectProposal.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/reviewProjectProposal/edit"
        assert model.reviewProjectProposalInstance != null

        reviewProjectProposal.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/reviewProjectProposal/show/$reviewProjectProposal.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        reviewProjectProposal.clearErrors()

        populateValidParams(params)
        params.id = reviewProjectProposal.id
        params.version = -1
        controller.update()

        assert view == "/reviewProjectProposal/edit"
        assert model.reviewProjectProposalInstance != null
        assert model.reviewProjectProposalInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/reviewProjectProposal/list'

        response.reset()

        populateValidParams(params)
        def reviewProjectProposal = new ReviewProjectProposal(params)

        assert reviewProjectProposal.save() != null
        assert ReviewProjectProposal.count() == 1

        params.id = reviewProjectProposal.id

        controller.delete()

        assert ReviewProjectProposal.count() == 0
        assert ReviewProjectProposal.get(reviewProjectProposal.id) == null
        assert response.redirectedUrl == '/reviewProjectProposal/list'
    }
}
