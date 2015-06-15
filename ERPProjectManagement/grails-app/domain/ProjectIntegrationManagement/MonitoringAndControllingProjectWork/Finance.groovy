package ProjectIntegrationManagement.MonitoringAndControllingProjectWork

class Finance {
    int ev=1;
    int ac=1;
    int income=1;
    int evTotal=1;
    int netIncome=1;
    int sales=1;
    int shareHolderQuality=1;
    int totalAssets=1;
    int pv=1;
    
    static transcient = 
    [
        'Cpi', 'Tato', 'Roe', 'Roa', 'Spi', 'XCpi', 'XTato', 'XRoe', 'XRoa', 'XSpi'
    ]
    
    double getCpi(){
        return (ev/ac);
    }
    
    double getTato(){
        return income/evTotal;
    }
    
    double getRoe(){
        return netIncome/shareHolderQuality;
    }
    
    double getRoa(){
        return netIncome/totalAssets;
    }
    
    double getSpi(){
        return ev/pv;
    }
    
    double getXCpi(){
        return getCpi()/5;
    }
    
    /*double getXTato(){
        return getTato()/5;
    }
    
    
    double getXRoe(){
        return getRoe()/5;
    }
    
    double getXRoa(){
        return getRoa()/5;
    }
    
    double getXSpi(){
        return getSpi/5;
    }*/

    static constraints = {
    }
}
