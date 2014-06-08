package ProjectTimeManagement.Utility

class Coba {
int ponum
    def beforeInsert() {
    def lastPonum = Book.list([sort: 'ponum', order:'desc', max: 1])
    if(lastPonum)
      ponum = (lastPonum.pop().ponum as int) + 1 as String
    else
      ponum = '0'
  }
    static constraints = {
    }
}
