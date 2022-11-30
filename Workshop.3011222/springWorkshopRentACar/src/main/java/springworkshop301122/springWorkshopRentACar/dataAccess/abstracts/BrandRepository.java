package springworkshop301122.springWorkshopRentACar.dataAccess.abstracts;

import org.springframework.stereotype.Repository;
import springworkshop301122.springWorkshopRentACar.entities.concretes.Brand;

import java.util.List;

public interface BrandRepository {
    List<Brand> getAll();
}
