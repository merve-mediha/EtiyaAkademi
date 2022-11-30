package springworkshop301122.springWorkshopRentACar.dataAccess.concretes;

import org.springframework.stereotype.Repository;
import springworkshop301122.springWorkshopRentACar.dataAccess.abstracts.BrandRepository;
import springworkshop301122.springWorkshopRentACar.entities.concretes.Brand;

import java.util.ArrayList;
import java.util.List;

@Repository
public class InMemoryBrandRepository implements BrandRepository {
    List<Brand> brands;

    public InMemoryBrandRepository() {
        brands = new ArrayList<Brand>();
        brands.add(new Brand(1,"BMW"));
        brands.add(new Brand(2,"Mercedes"));
        brands.add(new Brand(3,"Audi"));
        brands.add(new Brand(4,"Fiat"));
        brands.add(new Brand(5,"Renault"));
    }
    @Override
    public List<Brand> getAll() {
        return brands;
    }
}
