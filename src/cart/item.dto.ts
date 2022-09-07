import { IsNotEmpty, IsDefined } from 'class-validator';
import { ApiProperty } from '@nestjs/swagger';
export class ItemDTO {
  @IsDefined()
  @IsNotEmpty()
  @ApiProperty()
  cart_id: string;

  @IsDefined()
  @IsNotEmpty()
  @ApiProperty()
  product_id: number;
}
