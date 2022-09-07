import { Controller, Get, Post, Body, Patch, Param, Delete, Put} from '@nestjs/common';
import { ProductsService } from './products.service';
import { CreateProductDto } from './dto/create-product.dto';
import { UpdateProductDto } from './dto/update-product.dto';
import { ProductDTO } from './product.dto';

@Controller('products')
export class ProductsController {
 
  users: ProductDTO[] = [];

  @Get()
  getAllUsers(): ProductDTO[] {
      return this.users;
  }

  @Get(':id')
  getUserById(@Param('id') id: string): ProductDTO {
      const user = this.users.find(user => user.id == id);
      return user;
  }

  @Post()
  newUser(@Body() user: ProductDTO): ProductDTO {
      const newUser = {...user, id: ''+(this.users.length)}
      this.users = [...this.users, newUser];
      return newUser;
  }

  @Put(':id')
  updateUser(@Param('id') id: string, @Body() user: ProductDTO): ProductDTO {
      this.users = this.users.filter(user => user.id !== id);
      this.users = [...this.users, this.newUser(user)];
      return user;
  }

  @Delete(':id')
  deleteUser(@Param('id') id: string) {
      this.users = this.users.filter(user => user.id !== id);
  }
}
