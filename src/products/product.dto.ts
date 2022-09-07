import { ApiProperty } from '@nestjs/swagger';

export class ProductDTO {
  @ApiProperty()
  readonly id?: string;

  constructor(id: string) {
    this.id = id;
  }
}
