package Fuzzy
/**
 * Created by FAUZI on 12/28/13.
 */
class CostRange {

    private double COST;

    public void setCOST(double COST) {
        this.COST = COST;
    }

    public double getCOST() {
        return COST;
    }

    private double [] abcVL=[-0.5, 0, 0.5];
    private double [] abcL=[0, 0.75, 1.5];
    private double [] abcM=[1, 1.75, 2.5];
    private double [] abcH=[2, 2.75, 3.5];
    private double [] abcVH=[3, 3.5, 4];
    private double getA_Mf(double [] MF){
        return MF[0];
    }

    private double getB_Mf(double [] MF){
        return MF[1];
    }

    private double getC_Mf(double [] MF){
        return MF[2];
    }

    private double VL(){
        double A=getA_Mf(abcVL);
        double B=getB_Mf(abcVL);
        double C=getC_Mf(abcVL);

        double hasil=0;

        if((COST>=0) && (COST<=0.5)) {
            hasil=(C-COST)/(C-B);
        }
        else{
            hasil=0;
        }
        return hasil;
    }

    public double L(){
        double A=getA_Mf(abcL);
        double B=getB_Mf(abcL);
        double C=getC_Mf(abcL);

        double hasil=0;

        if((COST>=0) && (COST<=0.75)) {
            hasil=(COST-A)/(B-A);
        }else if ((COST>=0.75) && (COST<=1.5)){
            hasil=(C-COST)/(C-B);
        }
        else{
            hasil=0;
        }
        return hasil;
    }

    public double M(){
        double A=getA_Mf(abcM);
        double B=getB_Mf(abcM);
        double C=getC_Mf(abcM);

        double hasil=0;

        if((COST>=1) && (COST<=1.75)) {
            hasil=(COST-A)/(B-A);
        }else if ((COST>=1.75) && (COST<=2.5)){
            hasil=(C-COST)/(C-B);
        }
        else{
            hasil=0;
        }
        return hasil;
    }

    public double H(){
        double A=getA_Mf(abcH);
        double B=getB_Mf(abcH);
        double C=getC_Mf(abcH);

        double hasil=0;

        if((COST>=2) && (COST<=2.75)) {
            hasil=(COST-A)/(B-A);
        }else if ((COST>=2.75) && (COST<=3.5)){
            hasil=(C-COST)/(C-B);
        }
        else{
            hasil=0;
        }
        return hasil;
}

    public double VH(){
        double A=getA_Mf(abcVH);
        double B=getB_Mf(abcVH);
        double C=getC_Mf(abcVH);

        double hasil=0;

        if((COST>=3) && (COST<=3.5)) {
            hasil=(COST-A)/(B-A);
        }else if ((COST>=3.5) && (COST<=4)){
            hasil=(C-COST)/(C-B);
        }
        else{
            hasil=0;
        }
        return hasil;
    }
}