public class Main {
    public static void main(String[] args) {
        CustomerManager customerManager = new CustomerManager();
        customerManager.databaseManager=new OracleDatabaseManager();
       // customerManager.databaseManager=new SqlServertabaseManager();
        customerManager.getCustomers();

       //open-close principle
    }
}