package ProjectHumanResourceManagement



import org.junit.*
import grails.test.mixin.*

@TestFor(EmployeeTypeController)
@Mock(EmployeeType)
class EmployeeTypeControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/employeeType/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.employeeTypeInstanceList.size() == 0
        assert model.employeeTypeInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.employeeTypeInstance != null
    }

    void testSave() {
        controller.save()

        assert model.employeeTypeInstance != null
        assert view == '/employeeType/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/employeeType/show/1'
        assert controller.flash.message != null
        assert EmployeeType.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/employeeType/list'

        populateValidParams(params)
        def employeeType = new EmployeeType(params)

        assert employeeType.save() != null

        params.id = employeeType.id

        def model = controller.show()

        assert model.employeeTypeInstance == employeeType
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/employeeType/list'

        populateValidParams(params)
        def employeeType = new EmployeeType(params)

        assert employeeType.save() != null

        params.id = employeeType.id

        def model = controller.edit()

        assert model.employeeTypeInstance == employeeType
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/employeeType/list'

        response.reset()

        populateValidParams(params)
        def employeeType = new EmployeeType(params)

        assert employeeType.save() != null

        // test invalid parameters in update
        params.id = employeeType.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/employeeType/edit"
        assert model.employeeTypeInstance != null

        employeeType.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/employeeType/show/$employeeType.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        employeeType.clearErrors()

        populateValidParams(params)
        params.id = employeeType.id
        params.version = -1
        controller.update()

        assert view == "/employeeType/edit"
        assert model.employeeTypeInstance != null
        assert model.employeeTypeInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/employeeType/list'

        response.reset()

        populateValidParams(params)
        def employeeType = new EmployeeType(params)

        assert employeeType.save() != null
        assert EmployeeType.count() == 1

        params.id = employeeType.id

        controller.delete()

        assert EmployeeType.count() == 0
        assert EmployeeType.get(employeeType.id) == null
        assert response.redirectedUrl == '/employeeType/list'
    }
}
