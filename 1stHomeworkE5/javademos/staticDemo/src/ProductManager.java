public class ProductManager {
    static {
        System.out.println("Static yapici blok calisti.");
    }
    public void add(Product product){

        if(ProductValidator.isValid(product)){
            System.out.println("Eklendi.");
        }else{
            System.out.println("Ürün bilgileri geçersizdir.");
        }

    }
    public static class OtherClass{
        public static void sil(){

        }
    }
}
