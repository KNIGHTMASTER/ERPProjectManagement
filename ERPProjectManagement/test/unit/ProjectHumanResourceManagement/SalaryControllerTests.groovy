package ProjectHumanResourceManagement



import org.junit.*
import grails.test.mixin.*

@TestFor(SalaryController)
@Mock(Salary)
class SalaryControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/salary/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.salaryInstanceList.size() == 0
        assert model.salaryInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.salaryInstance != null
    }

    void testSave() {
        controller.save()

        assert model.salaryInstance != null
        assert view == '/salary/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/salary/show/1'
        assert controller.flash.message != null
        assert Salary.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/salary/list'

        populateValidParams(params)
        def salary = new Salary(params)

        assert salary.save() != null

        params.id = salary.id

        def model = controller.show()

        assert model.salaryInstance == salary
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/salary/list'

        populateValidParams(params)
        def salary = new Salary(params)

        assert salary.save() != null

        params.id = salary.id

        def model = controller.edit()

        assert model.salaryInstance == salary
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/salary/list'

        response.reset()

        populateValidParams(params)
        def salary = new Salary(params)

        assert salary.save() != null

        // test invalid parameters in update
        params.id = salary.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/salary/edit"
        assert model.salaryInstance != null

        salary.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/salary/show/$salary.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        salary.clearErrors()

        populateValidParams(params)
        params.id = salary.id
        params.version = -1
        controller.update()

        assert view == "/salary/edit"
        assert model.salaryInstance != null
        assert model.salaryInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/salary/list'

        response.reset()

        populateValidParams(params)
        def salary = new Salary(params)

        assert salary.save() != null
        assert Salary.count() == 1

        params.id = salary.id

        controller.delete()

        assert Salary.count() == 0
        assert Salary.get(salary.id) == null
        assert response.redirectedUrl == '/salary/list'
    }
}
