import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Cart } from './entities/cart.entity';
import { Repository } from 'typeorm';
import { CartItem } from './entities/item.entity';
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
      relations: {
        product: true,
      },
      where: {
        cart_id: id,
      },
    });

    return items;
  }

  async addToCart(body: CreateCartItemDto) {
    const cartItem: CartItem = new CartItem();
    cartItem.cart_id = body.cart_id;
    cartItem.product_id = body.product_id;

    return this.repositoryItems.save(cartItem);
  }
}
