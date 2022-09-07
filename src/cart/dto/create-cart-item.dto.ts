import { IsNotEmpty, IsNumber, IsString } from 'class-validator';

export class CreateCartItemDto {
  @IsNumber()
  @IsNotEmpty()
  public product_id: number;

  @IsString()
  @IsNotEmpty()
  public cart_id: string;
}
