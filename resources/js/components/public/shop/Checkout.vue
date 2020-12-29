<template>
  <section class="pages checkout section-padding">
    <div class="container">
      <div class="row">
        <div class="col-sm-6">
          <div class="main-input single-cart-form padding60">
            <div class="log-title">
              <h3><strong>billing details</strong></h3>
            </div>
            <div class="custom-input">
              <form method="post">
                <input
                  type="text"
                  v-model="form.name"
                  placeholder="Name here.."
                  readonly
                />
                <small style="color: red" v-if="errors['name']">{{
                  errors["name"][0]
                }}</small>
                <input
                  type="email"
                  v-model="form.email"
                  placeholder="Email Address.."
                  readonly
                />
                <small style="color: red" v-if="errors['email']">{{
                  errors["email"][0]
                }}</small>
                <input
                  type="number"
                  v-model="form.phone"
                  placeholder="Phone Number.."
                  readonly
                />
                <small style="color: red" v-if="errors['phone']">{{
                  errors["phone"][0]
                }}</small>
                <input
                  type="text"
                  v-model="form.address"
                  placeholder="Address.."
                  readonly
                />
                <small style="color: red" v-if="errors['address']">{{
                  errors["address"][0]
                }}</small>

                <input type="checkbox" v-model="shippingDisplay" />
                Ship Different Address
              </form>
            </div>
          </div>
        </div>
        <div class="col-sm-6" v-if="shippingDisplay">
          <div class="main-input single-cart-form padding60">
            <div class="log-title">
              <h3><strong>ship to different address</strong></h3>
            </div>
            <div class="custom-input">
              <form method="post">
                <input
                  type="text"
                  v-model="shipping.name"
                  placeholder="Name here.."
                />
                <small style="color: red" v-if="errors['name']">{{
                  errors["name"][0]
                }}</small>
                <input
                  type="email"
                  v-model="shipping.email"
                  placeholder="Email Address.."
                />
                <small style="color: red" v-if="errors['email']">{{
                  errors["email"][0]
                }}</small>
                <input
                  type="number"
                  v-model="shipping.phone"
                  placeholder="Phone Number.."
                />
                <small style="color: red" v-if="errors['phone']">{{
                  errors["phone"][0]
                }}</small>
                <input
                  type="text"
                  v-model="shipping.address"
                  placeholder="Address.."
                />
                <small style="color: red" v-if="errors['address']">{{
                  errors["address"][0]
                }}</small>
              </form>
            </div>
          </div>
        </div>
      </div>
      <div class="row margin-top">
        <div class="col-xs-12 col-sm-6">
          <div class="padding60">
            <div class="log-title">
              <h3><strong>Our order</strong></h3>
            </div>
            <div class="cart-form-text pay-details table-responsive">
              <table>
                <thead>
                  <tr>
                    <th>Product</th>
                    <td>Total</td>
                  </tr>
                </thead>
                <tbody>
                  <tr v-for="product in products.carts" :key="product.id">
                    <th>{{ product.name }} x {{ product.quantity }}</th>
                    <td>${{ product.price }}</td>
                  </tr>

                  <!-- <tr>
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
                  </tr> -->
                </tbody>
                <tfoot>
                  <tr>
                    <th>Order total</th>
                    <td>${{ products.total }}</td>
                  </tr>
                </tfoot>
              </table>
            </div>
          </div>
        </div>
        <div class="col-xs-12 col-sm-6">
          <div class="padding60">
            <div class="log-title">
              <h3><strong>Payment method</strong></h3>
            </div>
            <div class="categories">
              <ul id="accordion" class="panel-group clearfix">
                <li class="panel">
                  <select class="form-control" v-model="payment_type">
                    <option value="cash_on_delivery">Cash On Delivary</option>
                    <option value="card_payment">Card Payment</option>
                  </select>
                </li>
              </ul>
              <div class="submit-text" v-if="products.total > 0">
                <a href="#" @click.prevent="placeOrder">place order</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
export default {
  name: "Checkout",
  data() {
    return {
      form: {},
      errors: {},
      shipping: {},
      shippingDisplay: false,
      payment_type: "cash_on_delivery",
    };
  },
  methods: {
    productList() {
      this.$store.dispatch("cart/productList");
    },
    getUser() {
      this.$store.dispatch("user/getUser");
    },
    placeOrder() {
      axios
        .post("checkout", {
          shipping: this.shipping,
          shippind_address: this.shippingDisplay,
          payment_type: this.payment_type,
        })
        .then((result) => {})
        .catch((err) => {});
    },
  },
  created() {
    this.productList();
    this.getUser();
  },
  computed: {
    products() {
      return this.$store.getters["cart/productList"];
    },
    user() {
      return this.$store.getters["user/getUser"];
    },
  },
  watch: {
    user: {
      handler: function (newVal, oldVal) {
        this.form = newVal;
      },
      deep: true,
    },
  },
};
</script>

<style scoped>
</style>
