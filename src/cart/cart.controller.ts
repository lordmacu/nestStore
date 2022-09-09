import { Controller, Get, Inject, Param, Body, Post } from '@nestjs/common';
import { CartService } from '../cart/cart.service';
import { ItemDTO } from './item.dto';

@Controller('cart')
export class CartController {
  @Inject(CartService)
  private readonly serviceCart: CartService;

  @Get('/getCartId')
  public async getCartId() {
    const responseCart = await this.serviceCart.createCart();
    return responseCart;
  }

  @Post('addToCart')
  public async addToCart(@Body() cart: ItemDTO) {

    const checkProductInCart = await this.serviceCart.checkProductInCart(cart.cart_id, cart.product_id);

    if (checkProductInCart.length > 0) {
      return { 'response': 'Product is already added' }
    }

    await this.serviceCart.addToCart(cart);
    
    return { 'response': 'Product is added with success' }
  }

  @Get(':id')
  public async getCart(@Param('id') id: string) {
    const responseCart = await this.serviceCart.getItemsFromCartId(id);
    return responseCart;
  }
}
