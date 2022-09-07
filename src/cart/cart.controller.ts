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
    const responseCart = await this.serviceCart.addToCart(cart);
    return responseCart;
  }

  @Get(':id')
  public async getCart(@Param('id') id: string) {
    const responseCart = await this.serviceCart.getItemsFromCartId(id);
    return responseCart;
  }
}
