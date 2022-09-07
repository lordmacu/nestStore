import { ApiProperty } from '@nestjs/swagger';

export class CartDTO {
  @ApiProperty()
  readonly id?: string;

  constructor(id: string) {
    this.id = id;
  }
}
