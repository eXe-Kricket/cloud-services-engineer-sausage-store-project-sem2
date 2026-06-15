ALTER TABLE order_product
    ADD CONSTRAINT fk_order_product_order
    FOREIGN KEY (order_id)
    REFERENCES orders (id)
    ON DELETE CASCADE;

ALTER TABLE order_product
    ADD CONSTRAINT fk_order_product_product
    FOREIGN KEY (product_id)
    REFERENCES product (id);

ALTER TABLE product
    ADD CONSTRAINT product_price_non_negative
    CHECK (price IS NULL OR price >= 0);

ALTER TABLE order_product
    ADD CONSTRAINT order_product_quantity_positive
    CHECK (quantity > 0);

