package Fuzzy
/**
 * Created by FAUZI on 12/28/13.
 */
class TimeRange {
    private double TIME;

    public void setTIME(double TIME) {
        this.TIME = TIME;
    }

    public double getTIME() {
        return TIME;
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

        if((TIME>=0) && (TIME<=0.5)) {
            hasil=(C-TIME)/(C-B);
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

        if((TIME>=0) && (TIME<=0.75)) {
            hasil=(TIME-A)/(B-A);
        }else if ((TIME>=0.75) && (TIME<=1.5)){
            hasil=(C-TIME)/(C-B);
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

        if((TIME>=1) && (TIME<=1.75)) {
            hasil=(TIME-A)/(B-A);
        }else if ((TIME>=1.75) && (TIME<=2.5)){
            hasil=(C-TIME)/(C-B);
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

        if((TIME>=2) && (TIME<=2.75)) {
            hasil=(TIME-A)/(B-A);
        }else if ((TIME>=2.75) && (TIME<=3.5)){
            hasil=(C-TIME)/(C-B);
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

        if((TIME>=3) && (TIME<=3.5)) {
            hasil=(TIME-A)/(B-A);
        }else if ((TIME>=3.5) && (TIME<=4)){
            hasil=(C-TIME)/(C-B);
        }
        else{
            hasil=0;
        }
        return hasil;
    }
}
