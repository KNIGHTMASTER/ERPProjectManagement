package ProjectTimeManagement.EstimateResourceActivity



import org.junit.*
import grails.test.mixin.*

@TestFor(ResourcesCalendarController)
@Mock(ResourcesCalendar)
class ResourcesCalendarControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/resourcesCalendar/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.resourcesCalendarInstanceList.size() == 0
        assert model.resourcesCalendarInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.resourcesCalendarInstance != null
    }

    void testSave() {
        controller.save()

        assert model.resourcesCalendarInstance != null
        assert view == '/resourcesCalendar/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/resourcesCalendar/show/1'
        assert controller.flash.message != null
        assert ResourcesCalendar.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/resourcesCalendar/list'

        populateValidParams(params)
        def resourcesCalendar = new ResourcesCalendar(params)

        assert resourcesCalendar.save() != null

        params.id = resourcesCalendar.id

        def model = controller.show()

        assert model.resourcesCalendarInstance == resourcesCalendar
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/resourcesCalendar/list'

        populateValidParams(params)
        def resourcesCalendar = new ResourcesCalendar(params)

        assert resourcesCalendar.save() != null

        params.id = resourcesCalendar.id

        def model = controller.edit()

        assert model.resourcesCalendarInstance == resourcesCalendar
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/resourcesCalendar/list'

        response.reset()

        populateValidParams(params)
        def resourcesCalendar = new ResourcesCalendar(params)

        assert resourcesCalendar.save() != null

        // test invalid parameters in update
        params.id = resourcesCalendar.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/resourcesCalendar/edit"
        assert model.resourcesCalendarInstance != null

        resourcesCalendar.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/resourcesCalendar/show/$resourcesCalendar.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        resourcesCalendar.clearErrors()

        populateValidParams(params)
        params.id = resourcesCalendar.id
        params.version = -1
        controller.update()

        assert view == "/resourcesCalendar/edit"
        assert model.resourcesCalendarInstance != null
        assert model.resourcesCalendarInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/resourcesCalendar/list'

        response.reset()

        populateValidParams(params)
        def resourcesCalendar = new ResourcesCalendar(params)

        assert resourcesCalendar.save() != null
        assert ResourcesCalendar.count() == 1

        params.id = resourcesCalendar.id

        controller.delete()

        assert ResourcesCalendar.count() == 0
        assert ResourcesCalendar.get(resourcesCalendar.id) == null
        assert response.redirectedUrl == '/resourcesCalendar/list'
    }
}
