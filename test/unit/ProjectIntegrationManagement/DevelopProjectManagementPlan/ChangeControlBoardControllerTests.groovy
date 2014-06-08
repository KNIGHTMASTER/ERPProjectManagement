package ProjectIntegrationManagement.DevelopProjectManagementPlan



import org.junit.*
import grails.test.mixin.*

@TestFor(ChangeControlBoardController)
@Mock(ChangeControlBoard)
class ChangeControlBoardControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/changeControlBoard/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.changeControlBoardInstanceList.size() == 0
        assert model.changeControlBoardInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.changeControlBoardInstance != null
    }

    void testSave() {
        controller.save()

        assert model.changeControlBoardInstance != null
        assert view == '/changeControlBoard/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/changeControlBoard/show/1'
        assert controller.flash.message != null
        assert ChangeControlBoard.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/changeControlBoard/list'

        populateValidParams(params)
        def changeControlBoard = new ChangeControlBoard(params)

        assert changeControlBoard.save() != null

        params.id = changeControlBoard.id

        def model = controller.show()

        assert model.changeControlBoardInstance == changeControlBoard
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/changeControlBoard/list'

        populateValidParams(params)
        def changeControlBoard = new ChangeControlBoard(params)

        assert changeControlBoard.save() != null

        params.id = changeControlBoard.id

        def model = controller.edit()

        assert model.changeControlBoardInstance == changeControlBoard
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/changeControlBoard/list'

        response.reset()

        populateValidParams(params)
        def changeControlBoard = new ChangeControlBoard(params)

        assert changeControlBoard.save() != null

        // test invalid parameters in update
        params.id = changeControlBoard.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/changeControlBoard/edit"
        assert model.changeControlBoardInstance != null

        changeControlBoard.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/changeControlBoard/show/$changeControlBoard.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        changeControlBoard.clearErrors()

        populateValidParams(params)
        params.id = changeControlBoard.id
        params.version = -1
        controller.update()

        assert view == "/changeControlBoard/edit"
        assert model.changeControlBoardInstance != null
        assert model.changeControlBoardInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/changeControlBoard/list'

        response.reset()

        populateValidParams(params)
        def changeControlBoard = new ChangeControlBoard(params)

        assert changeControlBoard.save() != null
        assert ChangeControlBoard.count() == 1

        params.id = changeControlBoard.id

        controller.delete()

        assert ChangeControlBoard.count() == 0
        assert ChangeControlBoard.get(changeControlBoard.id) == null
        assert response.redirectedUrl == '/changeControlBoard/list'
    }
}
