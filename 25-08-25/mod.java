import java.util.Scanner;
public class mod {
    public static void main(String[] args){
      Scanner sc = new Scanner(System.in);
        System.out.print("Enter a number: ");
        int input = sc.nextInt();
        int output = Math.abs(input);
        System.out.println("Positive value: " + output);
        sc.close();
}
}
