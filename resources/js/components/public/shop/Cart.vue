<template>
  <section class="pages cart-page section-padding">
    <div class="container">
      <div class="row">
        <div class="col-xs-12">
          <div class="table-responsive padding60">
            <table class="wishlist-table text-center">
              <thead>
                <tr>
                  <th>Product</th>
                  <th>Price</th>
                  <th>quantity</th>
                  <th>Total Price</th>
                  <th>Remove</th>
                </tr>
              </thead>
              <tbody>
                <tr v-for="product in products.carts" :key="product.id">
                  <td class="td-img text-left">
                    <a href="#"
                      ><img
                        :src="`/uploads/${product.attributes.image}`"
                        alt="Add Product"
                    /></a>
                    <div class="items-dsc">
                      <h5>
                        <a href="#">{{ product.name }}</a>
                      </h5>
                      <p class="itemcolor">
                        Color : <span>{{ product.attributes.color }}</span>
                      </p>
                      <p class="itemcolor">
                        Size : <span>{{ product.attributes.size }}</span>
                      </p>
                    </div>
                  </td>
                  <td>${{ product.price }}</td>
                  <td>
                    <form action="#" method="POST">
                      <div class="plus-minus">
                        <a class="dec qtybutton">-</a>
                        <input
                          title="Press Enter To Update Quantity"
                          type="text"
                          @keypress.enter.prevent="
                            updateCart(product.id, product.quantity)
                          "
                          v-model="product.quantity"
                          name="qtybutton"
                          class="plus-minus-box"
                        />
                        <a class="inc qtybutton">+</a>
                      </div>
                    </form>
                  </td>
                  <td>
                    <strong>${{ product.price * product.quantity }}</strong>
                  </td>
                  <td>
                    <i
                      @click.prevent="removeCart(product.id)"
                      class="mdi mdi-close"
                      title="Remove this product"
                    ></i>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
      <div class="row margin-top">
        <div class="col-sm-3"></div>
        <div class="col-sm-6">
          <div class="single-cart-form padding60">
            <div class="log-title">
              <h3><strong>payment details</strong></h3>
            </div>
            <div class="cart-form-text pay-details table-responsive">
              <table>
                <!-- <tbody>
                  <tr>
                    <th>Cart Subtotal</th>
                    <td>$155.00</td>
                  </tr>
                  <tr>
                    <th>Shipping and Handing</th>
                    <td>$15.00</td>
                  </tr>
                  <tr>
                    <th>Vat</th>
                    <td>$00.00</td>
                  </tr>
                </tbody> -->
                <tfoot>
                  <tr>
                    <th class="tfoot-padd">Order total</th>
                    <td class="tfoot-padd">${{ products.total }}</td>
                  </tr>
                </tfoot>
              </table>
            </div>
          </div>
        </div>
        <div class="col-sm-3"></div>
      </div>
    </div>
  </section>
</template>

<script>
export default {
  name: "Cart",

  data() {
    return {
      product: {
        quantity: 1,
      },
    };
  },

  methods: {
    productList() {
      this.$store.dispatch("cart/productList");
    },
    removeCart(id) {
      axios
        .get("/cart/remove-cart/" + id)
        .then((result) => {
          this.productList();
          this.$message({
            message: "Cart Product Remove Successfully",
            type: "success",
            center: false,
          });
        })
        .catch((err) => {
          console.log(err);
        });
    },
    updateCart(id, qty) {
      axios
        .post("/cart/cart-update", { id: id, qty: qty })
        .then((result) => {
          this.productList();
          this.$message({
            message: "Cart Product Update Successfully",
            type: "success",
            center: false,
          });
        })
        .catch((err) => {});
    },
  },
  created() {
    this.productList();
  },
  computed: {
    products() {
      return this.$store.getters["cart/productList"];
    },
  },
};
</script>

<style scoped>
</style>
