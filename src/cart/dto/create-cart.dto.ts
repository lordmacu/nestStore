import { IsNotEmpty } from 'class-validator';

export class CreateCartDto {
  @IsNotEmpty()
  public id: number;

  @IsNotEmpty()
  public name: string;

  @IsNotEmpty()
  public icon: string;
}
