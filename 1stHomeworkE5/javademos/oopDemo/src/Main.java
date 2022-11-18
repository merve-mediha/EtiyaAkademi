public class Main {
    public static void main(String[] args) {
        Product product = new Product();
        product.setName("Laptop");
        product.setId(1);
        product.setDescription("Asus Laptop");
        product.setPrice(5000);
        product.setStockAmount(3);
        product.setColor("");


        Product product1 = new Product(3,"Laptop","Lenovo",15,7000,"siyah");


        product.getId();
        ProductManager productManager = new ProductManager();

        productManager.add(product1);
        productManager.add(product);

        System.out.println(product1.getName()+" "+ product1.getDescription());

        System.out.println(product.getKod());




    }
}