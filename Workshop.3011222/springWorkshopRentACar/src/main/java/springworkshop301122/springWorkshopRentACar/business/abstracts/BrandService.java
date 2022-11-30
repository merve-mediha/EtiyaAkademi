package springworkshop301122.springWorkshopRentACar.business.abstracts;

import springworkshop301122.springWorkshopRentACar.entities.concretes.Brand;

import java.util.List;

public interface BrandService {
    List<Brand> getAll();
}
