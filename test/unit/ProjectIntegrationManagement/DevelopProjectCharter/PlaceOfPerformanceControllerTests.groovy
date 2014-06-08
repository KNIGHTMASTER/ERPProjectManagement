package ProjectIntegrationManagement.DevelopProjectCharter



import org.junit.*
import grails.test.mixin.*

@TestFor(PlaceOfPerformanceController)
@Mock(PlaceOfPerformance)
class PlaceOfPerformanceControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/placeOfPerformance/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.placeOfPerformanceInstanceList.size() == 0
        assert model.placeOfPerformanceInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.placeOfPerformanceInstance != null
    }

    void testSave() {
        controller.save()

        assert model.placeOfPerformanceInstance != null
        assert view == '/placeOfPerformance/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/placeOfPerformance/show/1'
        assert controller.flash.message != null
        assert PlaceOfPerformance.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/placeOfPerformance/list'

        populateValidParams(params)
        def placeOfPerformance = new PlaceOfPerformance(params)

        assert placeOfPerformance.save() != null

        params.id = placeOfPerformance.id

        def model = controller.show()

        assert model.placeOfPerformanceInstance == placeOfPerformance
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/placeOfPerformance/list'

        populateValidParams(params)
        def placeOfPerformance = new PlaceOfPerformance(params)

        assert placeOfPerformance.save() != null

        params.id = placeOfPerformance.id

        def model = controller.edit()

        assert model.placeOfPerformanceInstance == placeOfPerformance
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/placeOfPerformance/list'

        response.reset()

        populateValidParams(params)
        def placeOfPerformance = new PlaceOfPerformance(params)

        assert placeOfPerformance.save() != null

        // test invalid parameters in update
        params.id = placeOfPerformance.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/placeOfPerformance/edit"
        assert model.placeOfPerformanceInstance != null

        placeOfPerformance.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/placeOfPerformance/show/$placeOfPerformance.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        placeOfPerformance.clearErrors()

        populateValidParams(params)
        params.id = placeOfPerformance.id
        params.version = -1
        controller.update()

        assert view == "/placeOfPerformance/edit"
        assert model.placeOfPerformanceInstance != null
        assert model.placeOfPerformanceInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/placeOfPerformance/list'

        response.reset()

        populateValidParams(params)
        def placeOfPerformance = new PlaceOfPerformance(params)

        assert placeOfPerformance.save() != null
        assert PlaceOfPerformance.count() == 1

        params.id = placeOfPerformance.id

        controller.delete()

        assert PlaceOfPerformance.count() == 0
        assert PlaceOfPerformance.get(placeOfPerformance.id) == null
        assert response.redirectedUrl == '/placeOfPerformance/list'
    }
}
