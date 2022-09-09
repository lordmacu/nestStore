import { Injectable } from '@nestjs/common';
import { CreateProductDto } from './dto/create-product.dto';
import { InjectRepository } from '@nestjs/typeorm';
import { Product } from './entities/product.entity';
import { Repository } from 'typeorm';

@Injectable()
export class ProductsService {
  @InjectRepository(Product)
  private readonly repository: Repository<Product>;

  findAll() {
    return this.repository.find({
      relations: {
        category: true,
      },
    });
  }

  findOne(id: number): Promise<Product> {
    return this.repository.findOneBy({ id: id });
  }

  remove(product: Product[]) {
    return this.repository.remove(product);
  }

  findAllByCategory(category_id) {
    return this.repository.find({
      where:{
        categoryId:category_id
      },
      relations: {
        category: true,
      },
    });
  }

  createProduct(body: CreateProductDto): Promise<Product> {
    const product: Product = new Product();

    product.product_id = body.id;
    product.categoryId = body.category_id;
    product.name = body.name;
    product.qualification = body.qualification;
    product.time = body.time;
    product.price = body.price;
    product.image = body.image;

    return this.repository.save(product);
  }
}
