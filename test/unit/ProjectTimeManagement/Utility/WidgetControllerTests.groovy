package ProjectTimeManagement.Utility



import org.junit.*
import grails.test.mixin.*

@TestFor(WidgetController)
@Mock(Widget)
class WidgetControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/widget/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.widgetInstanceList.size() == 0
        assert model.widgetInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.widgetInstance != null
    }

    void testSave() {
        controller.save()

        assert model.widgetInstance != null
        assert view == '/widget/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/widget/show/1'
        assert controller.flash.message != null
        assert Widget.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/widget/list'

        populateValidParams(params)
        def widget = new Widget(params)

        assert widget.save() != null

        params.id = widget.id

        def model = controller.show()

        assert model.widgetInstance == widget
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/widget/list'

        populateValidParams(params)
        def widget = new Widget(params)

        assert widget.save() != null

        params.id = widget.id

        def model = controller.edit()

        assert model.widgetInstance == widget
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/widget/list'

        response.reset()

        populateValidParams(params)
        def widget = new Widget(params)

        assert widget.save() != null

        // test invalid parameters in update
        params.id = widget.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/widget/edit"
        assert model.widgetInstance != null

        widget.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/widget/show/$widget.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        widget.clearErrors()

        populateValidParams(params)
        params.id = widget.id
        params.version = -1
        controller.update()

        assert view == "/widget/edit"
        assert model.widgetInstance != null
        assert model.widgetInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/widget/list'

        response.reset()

        populateValidParams(params)
        def widget = new Widget(params)

        assert widget.save() != null
        assert Widget.count() == 1

        params.id = widget.id

        controller.delete()

        assert Widget.count() == 0
        assert Widget.get(widget.id) == null
        assert response.redirectedUrl == '/widget/list'
    }
}
