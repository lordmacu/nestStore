import { Entity, PrimaryGeneratedColumn, Column, CreateDateColumn, UpdateDateColumn,OneToMany,JoinColumn,  JoinTable } from 'typeorm';

import { Product } from "../../products/entities/product.entity"


@Entity()
export class Category {
  @PrimaryGeneratedColumn()
  public id!: number;

  @Column({ type: 'integer', default: 0})
  public category_id: number;

  @Column({ type: 'varchar', length: 120 })
  public name: string;

  @Column({ type: 'varchar', length: 120 })
  public icon: string;

  /*
   * Create and Update Date Columns
   */

  @CreateDateColumn({ type: 'timestamp' })
  public createdAt!: Date;

  @UpdateDateColumn({ type: 'timestamp' })
  public updatedAt!: Date;

 
  @OneToMany(() => Product, (photo) => photo.category)
  products: Product[]
}