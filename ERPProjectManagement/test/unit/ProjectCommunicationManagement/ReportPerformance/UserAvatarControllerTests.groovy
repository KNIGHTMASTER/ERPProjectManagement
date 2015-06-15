package ProjectCommunicationManagement.ReportPerformance



import org.junit.*
import grails.test.mixin.*

@TestFor(UserAvatarController)
@Mock(UserAvatar)
class UserAvatarControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/userAvatar/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.userAvatarInstanceList.size() == 0
        assert model.userAvatarInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.userAvatarInstance != null
    }

    void testSave() {
        controller.save()

        assert model.userAvatarInstance != null
        assert view == '/userAvatar/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/userAvatar/show/1'
        assert controller.flash.message != null
        assert UserAvatar.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/userAvatar/list'

        populateValidParams(params)
        def userAvatar = new UserAvatar(params)

        assert userAvatar.save() != null

        params.id = userAvatar.id

        def model = controller.show()

        assert model.userAvatarInstance == userAvatar
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/userAvatar/list'

        populateValidParams(params)
        def userAvatar = new UserAvatar(params)

        assert userAvatar.save() != null

        params.id = userAvatar.id

        def model = controller.edit()

        assert model.userAvatarInstance == userAvatar
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/userAvatar/list'

        response.reset()

        populateValidParams(params)
        def userAvatar = new UserAvatar(params)

        assert userAvatar.save() != null

        // test invalid parameters in update
        params.id = userAvatar.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/userAvatar/edit"
        assert model.userAvatarInstance != null

        userAvatar.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/userAvatar/show/$userAvatar.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        userAvatar.clearErrors()

        populateValidParams(params)
        params.id = userAvatar.id
        params.version = -1
        controller.update()

        assert view == "/userAvatar/edit"
        assert model.userAvatarInstance != null
        assert model.userAvatarInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/userAvatar/list'

        response.reset()

        populateValidParams(params)
        def userAvatar = new UserAvatar(params)

        assert userAvatar.save() != null
        assert UserAvatar.count() == 1

        params.id = userAvatar.id

        controller.delete()

        assert UserAvatar.count() == 0
        assert UserAvatar.get(userAvatar.id) == null
        assert response.redirectedUrl == '/userAvatar/list'
    }
}
