package ProjectTimeManagement.Utility

class Widget {
String project
static hasMany = [pixes: Pix]
    static constraints = {
        project(blank:false)
        pixes()
    }
    String toString(){
        return project
    }
}
