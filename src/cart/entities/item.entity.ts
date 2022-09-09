import {
  Entity,
  PrimaryGeneratedColumn,
  Column,
  CreateDateColumn,
  UpdateDateColumn,
  JoinColumn,
  ManyToOne,
  OneToOne,
} from 'typeorm';

import { Cart } from './cart.entity';
import { Product } from '../../products/entities/product.entity';

@Entity()
export class CartItem {
  @PrimaryGeneratedColumn()
  public id!: number;

  @Column({ type: 'integer', default: 0 })
  public product_id: number;

  @Column({ type: 'varchar' })
  public cart_id: string;

  /*
   * Create and Update Date Columns
   */

  @CreateDateColumn({ type: 'timestamp', select: false })
  public createdAt!: Date;

  @UpdateDateColumn({ type: 'timestamp', select: false })
  public updatedAt!: Date;

  @ManyToOne(() => Cart, (cart) => cart.items)
  cart: Cart;

   
}
