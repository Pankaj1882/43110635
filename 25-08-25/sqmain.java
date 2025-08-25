import java.util.*;
public class SqMain{
    public static void main(String[] args) {
      Scanner sc=new Scanner(System.in);
      int len = sc.nextInt();  
      int bre = sc.nextInt();
      
      if(len==bre){
        System.out.println("Square");
    }
    else {
        System.out.println("Rectangle");
    }
}
}