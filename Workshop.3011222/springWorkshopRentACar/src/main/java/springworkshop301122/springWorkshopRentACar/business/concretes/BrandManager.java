package springworkshop301122.springWorkshopRentACar.business.concretes;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import springworkshop301122.springWorkshopRentACar.business.abstracts.BrandService;
import springworkshop301122.springWorkshopRentACar.dataAccess.abstracts.BrandRepository;
import springworkshop301122.springWorkshopRentACar.entities.concretes.Brand;

import java.util.List;

@Service
public class BrandManager implements BrandService {


    private BrandRepository brandRepository;

    @Autowired
    public BrandManager(BrandRepository brandRepository) {
        this.brandRepository = brandRepository;
    }

    @Override
    public List<Brand> getAll() {
        //iş kuralları
        return brandRepository.getAll();
    }
}
