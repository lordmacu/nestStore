import { IsEmail, IsNotEmpty, IsNumber, IsString } from 'class-validator';

export class CreateProductDto {

    @IsNotEmpty()
    public id: number;

    @IsNotEmpty()
    public category_id: number;

    @IsNotEmpty()
    public name: string;

    @IsNotEmpty()
    public qualification: number;

    @IsNotEmpty()
    public time: string;

    @IsNotEmpty()
    public price: number;


    @IsNotEmpty()
    public image: string;
}
