import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Cart } from './entities/cart.entity';
import { Repository } from 'typeorm';
import { CartItem } from './entities/item.entity';
import { Product } from '../products/entities/product.entity';
import { CreateCartItemDto } from './dto/create-cart-item.dto';
import { uuid } from 'uuidv4';

@Injectable()
export class CartService {
  @InjectRepository(Cart)
  private readonly repositoryCart: Repository<Cart>;

  @InjectRepository(CartItem)
  private readonly repositoryItems: Repository<CartItem>;

  createCart(): Promise<Cart> {
    const cart: Cart = new Cart();

    cart.token_cart = uuid();

    return this.repositoryCart.save(cart);
  }

  async getItemsFromCartId(id: string): Promise<CartItem[]> {
    const items = await this.repositoryItems.find({
     /* relations: {
        product: true,
      },*/
      where: {
        cart_id: id,
      },
    });

   // return items;

    const array = await this.repositoryItems
    .createQueryBuilder('cart_item')
     .innerJoinAndSelect(Product, 'p1', 'cart_item.product_id = p1.product_id') 
     .where('cart_item.cart_id = :id', {id: id})
 
    .getRawMany();

    return array;
  }
  
  async checkProductInCart(cart: string, product): Promise<CartItem[]> {
    

    const array = await this.repositoryItems
    .createQueryBuilder('cart_item')
     .innerJoinAndSelect(Product, 'p1', 'cart_item.product_id = p1.product_id') 
     .where('cart_item.cart_id = :id', {id: cart})
     .andWhere('cart_item.product_id = :sid', { sid: product })

    .getRawMany();

    return array;
  }

  async addToCart(body: CreateCartItemDto) {
    const cartItem: CartItem = new CartItem();
    cartItem.cart_id = body.cart_id;
    cartItem.product_id = body.product_id;

    return this.repositoryItems.save(cartItem);
  }
}
