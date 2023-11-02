import java.util.Scanner;

public class Main {

    public static Scanner scan = new Scanner(System.in);
    public static void main(String[] args)
    {
        intro();


        


        
    }

    public static void intro()
    {
        System.out.println("Main Menu\n"
                + "(1) Get letter grade\n"
                + "(2) Exit Program\n\n"
                + "Enter '1' or '2' for your selection:");
        userInput();
    }


    public static void userInput()
    {
        int input = scan.nextInt();
        switch(input)
        {
            case 1:
                getGrade();
            case 2:
                System.exit(0);
            default:
                System.out.println("invalid input, please input '1' or '2'.");
                userInput();

        }
    }
    public static void getGrade()
    {  
        System.out.println("Please enter a score as an integer value: ");
        int input = scan.nextInt();
        String score = "";
        if(input >= 90 && input <= 100)
        {
            score = "A";
        }
        else if(input >= 80 )
        {
            score = "B";
        }
        else if (input >= 70)
        {
            score = "C";
        }
        else if(input >= 60)
        {
            score = "D";
        }
        else
        {
            score = "F";
        }
        System.out.println("The grade is: " + score + "\n---------------------------------------\n\n");
        System.out.println("Would you like to enter a new score?\n"
        + "(Y) Yes   (N) No");
        scan.nextLine();
        String choice = scan.nextLine();
        if(choice == "Y")
        {
            getGrade();
        }
        else if(choice == "N")
        {
            intro();
        }



    }

}
