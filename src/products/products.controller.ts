import { Controller, Get, Post, Body, Patch, Param, Delete, Put, Inject, ParseIntPipe } from '@nestjs/common';
import { ProductsService } from './products.service';
import { CategoriesService } from '../categories/categories.service';
import { ProductDTO } from './product.dto';
import { Product } from './entities/product.entity';

@Controller('products')
export class ProductsController {

    users: ProductDTO[] = [];

    @Inject(ProductsService)
    private readonly serviceProduct: ProductsService;

    @Inject(CategoriesService)
    private readonly serviceCategory: CategoriesService;


    @Get('/generateProducts')
    public async generateDatabase() {
        const entitiesProduct = await this.serviceProduct.findAll();

       
        await this.serviceProduct.remove(entitiesProduct);

        const entitiesCategory = await this.serviceCategory.findAll();

      
        await this.serviceCategory.remove(entitiesCategory);
 
        const categories= [{"id":1,"name":"All","icon":"https://image.flaticon.com/icons/svg/701/701965.svg"},{"id":2,"name":"Pizza","icon":"https://image.flaticon.com/icons/svg/599/599995.svg"},{"id":3,"name":"Asian","icon":"https://image.flaticon.com/icons/svg/1895/1895684.svg"},{"id":4,"name":"Burgers","icon":"https://image.flaticon.com/icons/svg/883/883806.svg"},{"id":5,"name":"Barbecue","icon":"https://image.flaticon.com/icons/svg/933/933310.svg"},{"id":6,"name":"Dessers","icon":"https://image.flaticon.com/icons/svg/174/174394.svg"},{"id":7,"name":"Thai","icon":"https://image.flaticon.com/icons/svg/135/135367.svg"},{"id":8,"name":"Sushi","icon":"https://image.flaticon.com/icons/svg/1900/1900683.svg"}];

        for (const item in categories) {
            await this.serviceCategory.createCategory(categories[item]);
        }

        const products = [{"id":1,"name":"Filete de ternera con salsa","qualification":4.9,"time":"25-30min","category_id":0,"price":14.99,"image":"https://images.pexels.com/photos/675951/pexels-photo-675951.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=226&w=440"},{"id":2,"name":"Desayuno de primer plano lácteos","qualification":4.7,"time":"20-25min","category_id":0,"price":9.99,"image":"https://images.pexels.com/photos/376464/pexels-photo-376464.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=226&w=440"},{"id":3,"name":"Burrito de pollo","qualification":4.6,"time":"25-30min","category_id":0,"price":13.99,"image":"https://images.pexels.com/photos/461198/pexels-photo-461198.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=226&w=440"},{"id":4,"name":"Plato de salmón","qualification":4.5,"time":"25-30min","category_id":0,"price":15.99,"image":"https://images.pexels.com/photos/46239/salmon-dish-food-meal-46239.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=226&w=440"},{"id":5,"name":"Postre","qualification":4.8,"time":"15-20min","category_id":0,"price":6.99,"image":"https://images.pexels.com/photos/1099680/pexels-photo-1099680.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=226&w=440"},{"id":6,"name":"Sándwich servido en la tabla de cortar","qualification":4.7,"time":"10-15min","category_id":0,"price":9.99,"image":"https://images.pexels.com/photos/1600711/pexels-zphoto-1600711.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=226&w=440"},{"id":7,"name":"Plato de aguacate cocido","qualification":4.4,"time":"15-25min","category_id":0,"price":12.99,"image":"https://images.pexels.com/photos/262959/pexels-photo-262959.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=226&w=440"},{"id":8,"name":"Hamburguesa","qualification":4.6,"time":"10-15min","category_id":0,"price":14.99,"image":"https://images.pexels.com/photos/156114/pexels-photo-156114.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=226&w=440"}];
        for (const item in products) {

            const randomCategory= await this.serviceCategory.getRandom();
            products[item].category_id=randomCategory.id;
              
            await this.serviceProduct.createProduct(products[item]);
        }
    }



    @Get()
    public getAll(): Promise<Product[]> {
        return this.serviceProduct.findAll();
    }



    @Post()
    newUser(@Body() user: ProductDTO): ProductDTO {
        const newUser = { ...user, id: '' + (this.users.length) }
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
