import { Entity, PrimaryGeneratedColumn, Column, CreateDateColumn, UpdateDateColumn, JoinColumn, ManyToOne } from 'typeorm';
import { Category } from "../../categories/entities/category.entity"
@Entity()
export class Product {
  @PrimaryGeneratedColumn()
  public id!: number;

  @Column({ type: 'integer', default: 0})
  public product_id: number;

  @Column({ type: 'varchar', length: 120 })
  public name: string;

  @Column({ type: 'varchar', length: 120 })
  public time: string;

  @Column({ type: 'decimal', default: 0 })
  public qualification: number;


  @Column({ type: 'decimal', default: 0 })
  public price: number;

  @Column({ type: 'varchar', length: 120 })
  public image: string;

  @Column({ type: 'integer', default: 0 })
  public categoryId: number;

  /*
   * Create and Update Date Columns
   */

  @CreateDateColumn({ type: 'timestamp' })
  public createdAt!: Date;

  @UpdateDateColumn({ type: 'timestamp' })
  public updatedAt!: Date;


  @ManyToOne(() => Category, (user) => user.products)
  category: Category
}