import {
  Entity,
  PrimaryGeneratedColumn,
  Column,
  CreateDateColumn,
  UpdateDateColumn,
  OneToOne,
  ManyToOne,
} from 'typeorm';
import { Category } from '../../categories/entities/category.entity';
import { CartItem } from '../../cart/entities/item.entity';

@Entity()
export class Product {
  @PrimaryGeneratedColumn()
  public id!: number;

  @Column({ type: 'integer', default: 0, select: false })
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

  @Column({ type: 'integer', default: 0, select: false })
  public categoryId: number;

  /*
   * Create and Update Date Columns
   */

  @CreateDateColumn({ type: 'timestamp', select: false })
  public createdAt!: Date;

  @UpdateDateColumn({ type: 'timestamp', select: false })
  public updatedAt!: Date;

  @ManyToOne(() => Category, (product) => product.products)
  category: Category;

  @OneToOne(() => CartItem, (cartItem) => cartItem.product)
  item: CartItem;
}
