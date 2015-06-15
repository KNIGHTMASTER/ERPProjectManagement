package ProjectCostManagement.ControlCost

class ManagementFcController {

    def index() {
        def forecasting = ProjectCostManagement.ControlCost.ManagementForecasting.list()
        List p = []
        forecasting.each{
            p.add(it.periode)
        }
        List ac =[]
        forecasting.each{
            ac.add(it.actualCost)
        }
        List f =[]
        forecasting.each{
            f.add(it.forecasting)
        }
        List lx = []
        lx.add(ac[0])
        lx.addAll(f)
        def fc = """
        <script>

		var lineChartData = {
			labels : """
                        fc+=p
                        fc+=""",
			datasets : [
				{
                                        fillColor : "rgba(151,187,205,0.5)",
					strokeColor : "rgba(151,187,205,1)",
					pointColor : "rgba(151,187,205,1)",
					pointStrokeColor : "#fff",
					data : """ 
                                                fc+=ac
                                                fc+="""
				},
				{
					fillColor : "rgba(250,250,250,0.5)",
					strokeColor : "rgba(220,220,220,1)",
					pointColor : "rgba(220,220,220,1)",
					pointStrokeColor : "#fff",
					data : """ 
                                                fc+=lx
                                                fc+="""
				}
			]
			
		}

	var myLine = new Chart(document.getElementById("canvas").getContext("2d")).Line(lineChartData);
	
	</script>
        """
        [data3:fc]
    }
}
