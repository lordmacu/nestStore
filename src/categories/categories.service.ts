import { Injectable } from '@nestjs/common';
import { CreateCategoryDto } from './dto/create-category.dto';
import { InjectRepository } from '@nestjs/typeorm';
import { Category } from './entities/category.entity';
import { Repository } from 'typeorm';
import { getRepository } from "typeorm";

@Injectable()
export class CategoriesService {
  @InjectRepository(Category)
  private readonly repository: Repository<Category>;


  createCategory(body: CreateCategoryDto): Promise<Category> {
    const category: Category = new Category();


    category.category_id = body.id;
    category.name = body.name;
    category.icon = body.icon;

    return this.repository.save(category);
  }

  remove(category: Category[]) {
    return this.repository.remove(category);
  }

  findAll() {
    return this.repository.find();
  }

  async getRandom() {
    const array = await this.repository.createQueryBuilder()
      .select('*')
      .from(Category, 'categories')
      .orderBy('RANDOM()')
      .limit(1)
      .execute();
    return array[0];
  }
}
