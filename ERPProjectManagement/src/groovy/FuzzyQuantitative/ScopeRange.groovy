package FuzzyQuantitative
/**
 * Created by FAUZI on 12/28/13.
 */
class ScopeRange {
    private double SCOPE;

    public void setSCOPE(double SCOPE) {
        this.SCOPE = SCOPE;
    }

    public double getSCOPE() {
        return SCOPE;
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

        if((SCOPE>=0) && (SCOPE<=0.5)) {
            hasil=(C-SCOPE)/(C-B);
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

        if((SCOPE>=0) && (SCOPE<=0.75)) {
            hasil=(SCOPE-A)/(B-A);
        }else if ((SCOPE>=0.75) && (SCOPE<=1.5)){
            hasil=(C-SCOPE)/(C-B);
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

        if((SCOPE>=1) && (SCOPE<=1.75)) {
            hasil=(SCOPE-A)/(B-A);
        }else if ((SCOPE>=1.75) && (SCOPE<=2.5)){
            hasil=(C-SCOPE)/(C-B);
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

        if((SCOPE>=2) && (SCOPE<=2.75)) {
            hasil=(SCOPE-A)/(B-A);
        }else if ((SCOPE>=2.75) && (SCOPE<=3.5)){
            hasil=(C-SCOPE)/(C-B);
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

        if((SCOPE>=3) && (SCOPE<=3.5)) {
            hasil=(SCOPE-A)/(B-A);
        }else if ((SCOPE>=3.5) && (SCOPE<=4)){
            hasil=(C-SCOPE)/(C-B);
        }
        else{
            hasil=0;
        }
        return hasil;
    }
}
