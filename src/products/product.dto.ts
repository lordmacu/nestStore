import { ApiProperty } from "@nestjs/swagger";

export class ProductDTO {
    @ApiProperty()
    readonly id?: string;

    @ApiProperty()
    readonly name: string;

    constructor(id: string, name: string) {
        this.id = id;
        this.name = name;
    }
}