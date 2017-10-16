// SSNFormatChecker.java
// Input: string of form "123-45-6789"

import java.util.Scanner;

public class SSNFormatChecker {

    public static void main(String[] args){
        Scanner SSN = new Scanner(System.in);
        String s = null;
        boolean valid = false;

        System.out.println("Enter a Social Security Number");

        while (valid == false){
          try{
            s = SSN.nextLine();
            valid = true;
          } catch(Exception e){
            System.out.println("No input! Enter a Social Security Number");
          }
        }

        String result = (validSSN(s) ? " is a valid SSN" : " is not a valid SSN");
        System.out.println(s + result);

    }

    public static boolean validSSN(String str){
      //check length first
      if (str.length() != 11)
        return false;

      String arr[] = str.split("-");

      if (arr.length != 3)
        return false;


      for (int j = 0; j < 3; j++)
      {
        try {
          Integer.parseInt(arr[j]);
        } catch (NumberFormatException nfe) {
          return false;
        }
      }

      if (arr[0].length() != 3 || arr[1].length() != 2 || arr[2].length() != 4)
         return false;
 
      //return true if it didn't error out
      return true;
    }

}
