import { IsEmail, IsNotEmpty, IsNumber, IsString } from 'class-validator';

export class CreateCategoryDto {

    @IsNotEmpty()
    public id: number;

    @IsNotEmpty()
    public name: string;

    @IsNotEmpty()
    public icon: string;
}
