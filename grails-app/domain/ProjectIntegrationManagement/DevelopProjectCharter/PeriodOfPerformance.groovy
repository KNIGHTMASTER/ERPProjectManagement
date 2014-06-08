package ProjectIntegrationManagement.DevelopProjectCharter
import groovy.time.*

class PeriodOfPerformance {
    Date startDate
    Date endDate

  int getDifference() {
    if (startDate == null || endDate == null)
      return 0

    use(TimeCategory) {      
      def diff = endDate - startDate
      Math.abs(diff.days)
    }
  }
  
    static belongsTo = 
    [
        StatementOfWork
    ]

    StatementOfWork projectName
    static transients = ['difference']
    
    String toString(){
        return getDifference()+" day"+"\n"+"start date = "+startDate+"\n"+"end date = "+endDate
    }
    
    def static reportable = [
        title: 'Period Of Performance',
        fileName: 'PeriodOfPerformance',
        columns: ['timePeriod', 'startDate', 'endDate']
    ]

    
    static constraints = {
        projectName()
        startDate()
        endDate()
    }
}
