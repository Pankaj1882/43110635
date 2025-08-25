import java.util.Scanner;
public class grade {
    public static void main(String[] args) {
        Scanner scan = new Scanner (System.in);
        int score = scan.nextInt();
        char grade;
        if (score > 80) {
            grade = 'A';
        } else if (score >= 60 && score <=80) {
            grade = 'B';
        } else if (score >= 50 && score <60) {
            grade = 'C';
        } else if (score >= 45 && score <50) {
            grade = 'D';}
          else if (score <=45) {
            grade = 'E';  
        } else {
            grade = 'F';
        }

        System.out.println("The grade is: " + grade);
    }
}
