package ProjectTimeManagement.DefineActivity



import org.junit.*
import grails.test.mixin.*

@TestFor(ProjectCalendarController)
@Mock(ProjectCalendar)
class ProjectCalendarControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/projectCalendar/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.projectCalendarInstanceList.size() == 0
        assert model.projectCalendarInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.projectCalendarInstance != null
    }

    void testSave() {
        controller.save()

        assert model.projectCalendarInstance != null
        assert view == '/projectCalendar/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/projectCalendar/show/1'
        assert controller.flash.message != null
        assert ProjectCalendar.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/projectCalendar/list'

        populateValidParams(params)
        def projectCalendar = new ProjectCalendar(params)

        assert projectCalendar.save() != null

        params.id = projectCalendar.id

        def model = controller.show()

        assert model.projectCalendarInstance == projectCalendar
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/projectCalendar/list'

        populateValidParams(params)
        def projectCalendar = new ProjectCalendar(params)

        assert projectCalendar.save() != null

        params.id = projectCalendar.id

        def model = controller.edit()

        assert model.projectCalendarInstance == projectCalendar
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/projectCalendar/list'

        response.reset()

        populateValidParams(params)
        def projectCalendar = new ProjectCalendar(params)

        assert projectCalendar.save() != null

        // test invalid parameters in update
        params.id = projectCalendar.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/projectCalendar/edit"
        assert model.projectCalendarInstance != null

        projectCalendar.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/projectCalendar/show/$projectCalendar.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        projectCalendar.clearErrors()

        populateValidParams(params)
        params.id = projectCalendar.id
        params.version = -1
        controller.update()

        assert view == "/projectCalendar/edit"
        assert model.projectCalendarInstance != null
        assert model.projectCalendarInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/projectCalendar/list'

        response.reset()

        populateValidParams(params)
        def projectCalendar = new ProjectCalendar(params)

        assert projectCalendar.save() != null
        assert ProjectCalendar.count() == 1

        params.id = projectCalendar.id

        controller.delete()

        assert ProjectCalendar.count() == 0
        assert ProjectCalendar.get(projectCalendar.id) == null
        assert response.redirectedUrl == '/projectCalendar/list'
    }
}
