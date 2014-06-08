package ProjectTimeManagement.Utility

class Pix {
static belongsTo = [widget: Widget]
static namedQueries = {
        selectMaxDisplayOrderForWidget { widgetInstance ->
            eq('widget', widgetInstance)
            projections {
                max('displayOrder')
            }
            uniqueResult = true
        }
    }
    
String mile
    static constraints = {
        widget()
        mile(blank:false)
    }
    String toString(){
        return mile
    }
}
