package Fuzzy
/**
 * Created by FAUZI on 12/28/13.
 */
class Output {
    private int output;

    public Output() {

    }

    private int[] abcE=[-10, 10, 20];
    private int[] abcD=[10, 25, 40];
    private int[] abcC=[30, 45, 60];
    private int[] abcB=[50, 65, 80];
    private int[] abcA=[70, 80, 90];

    private int getA(int [] output){
        return output[0];
    }

    private int getB(int [] output){
        return output[1];
    }

    private int getC(int [] output){
        return output[2];
    }

    private int [] nilaiTengahOutput=[getB(abcE), getB(abcD), getB(abcC), getB(abcB), getB(abcA)];
    public int [] getNilaiTengahOutput(){
        return nilaiTengahOutput;
    }
}
