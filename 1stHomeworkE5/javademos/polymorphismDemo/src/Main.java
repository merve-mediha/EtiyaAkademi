public class Main {
    public static void main(String[] args) {
        BaseLogger[] loggers= new BaseLogger[]{
                new EmailLogger(),new ConsoleLogger(),new DatabaseLogger(),new FileLogger()
        }; //plug&play

        for(BaseLogger logger: loggers){
            logger.log("Log mesajı");

        }
        System.out.println("-------------------------------");

        CustomerManager customerManager = new CustomerManager(new FileLogger());
        customerManager.add();



    }
}