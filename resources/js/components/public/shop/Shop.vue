<template>
  <div id="home">
    <section class="pages products-page section-padding-bottom">
      <div class="container">
        <div class="row">
          <div class="col-xs-12 col-sm-4 col-md-3">
            <product-sidebar></product-sidebar>
          </div>
          <div class="col-xs-12 col-sm-8 col-md-9" v-chat-scroll>
            <div class="right-products">
              <div class="row">
                <div class="col-xs-12">
                  <div class="section-title clearfix">
                    <ul>
                      <li>
                        <ul class="nav-view">
                          <li class="active">
                            <a data-toggle="tab" href="#grid">
                              <i class="mdi mdi-view-module"></i>
                            </a>
                          </li>
                          <li>
                            <a data-toggle="tab" href="#list">
                              <i class="mdi mdi-view-list"></i>
                            </a>
                          </li>
                        </ul>
                      </li>
                      <li class="sort-by floatright">
                        Showing 1-9 of 89 Results
                      </li>
                    </ul>
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="tab-content grid-content">
                  <div class="tab-pane fade in active text-center" id="grid">
                    <div
                      class="col-xs-12 col-sm-6 col-md-4"
                      v-for="product in products.data"
                      :key="product.id"
                    >
                      <div class="single-product">
                        <div class="product-img">
                          <div class="pro-type sell">
                            <span>sell</span>
                          </div>
                          <a href="#">
                            <img
                              style="width: 270px; height: 300px"
                              :src="`/uploads/${product.image}`"
                              :alt="product.image"
                            />
                          </a>
                          <div class="actions-btn">
                            <a href="#" @click.prevent="addToCart(product)">
                              <i class="mdi mdi-cart"></i>
                            </a>
                            <a
                              href="#"
                              @click.prevent="singleProductView(product)"
                              data-toggle="modal"
                              data-target="#quick-view"
                            >
                              <i class="mdi mdi-eye"></i>
                            </a>
                            <a href="#" @click.prevent="addToWishList(product)">
                              <i class="mdi mdi-heart"></i>
                            </a>
                          </div>
                        </div>
                        <div class="product-dsc">
                          <p>
                            <a href="#">{{ product.name }}</a>
                          </p>
                          <!-- <div class="ratting">
                            <i class="mdi mdi-star"></i>
                            <i class="mdi mdi-star"></i>
                            <i class="mdi mdi-star"></i>
                            <i class="mdi mdi-star-half"></i>
                            <i class="mdi mdi-star-outline"></i>
                          </div>-->
                          <span>${{ product.price }}</span>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="tab-pane fade in" id="list">
                    <div class="col-xs-12">
                      <div
                        class="single-list-view"
                        v-for="product in products.data"
                        :key="product.id"
                      >
                        <div class="row">
                          <div class="col-xs-12 col-md-4">
                            <div class="list-img">
                              <div class="product-img">
                                <div class="pro-type sell">
                                  <span>sell</span>
                                </div>
                                <a href="#">
                                  <img
                                    width="250"
                                    height="250"
                                    :src="`/uploads/${product.image}`"
                                    :alt="product.name"
                                  />
                                </a>
                              </div>
                            </div>
                          </div>
                          <div class="col-xs-12 col-md-8">
                            <div class="list-text">
                              <h3>{{ product.name }}</h3>

                              <!-- <div class="ratting floatright">
                                <p>( 27 Rating )</p>
                                <i class="mdi mdi-star"></i>
                                <i class="mdi mdi-star"></i>
                                <i class="mdi mdi-star"></i>
                                <i class="mdi mdi-star-half"></i>
                                <i class="mdi mdi-star-outline"></i>
                              </div>-->
                              <template v-if="product.discount_price">
                                <h5>
                                  <del>${{ product.price }}</del>
                                  ${{ product.discount_price }}
                                </h5>
                              </template>

                              <template v-else>${{ product.price }}</template>

                              <p>{{ product.description }}</p>
                              <div class="list-btn">
                                <a href="#" @click.prevent="addToCart(product)"
                                  >add to cart</a
                                >
                                <a
                                  href="#"
                                  @click.prevent="addToWishList(product)"
                                  >wishlist</a
                                >
                                <a
                                  href="#"
                                  @click.prevent="singleProductView(product)"
                                  data-toggle="modal"
                                  data-target="#quick-view"
                                  >zoom</a
                                >
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="pagnation-ul">
                  <template v-if="products.last_page > 1">
                    <pagination-component
                      :pagination="pagination"
                      :offset="3"
                      @paginate="productList()"
                    ></pagination-component>
                  </template>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- product-grid-view content section end -->
    <!-- quick view start -->
    <div
      class="product-details quick-view modal animated zoomInUp"
      id="quick-view"
    >
      <div class="container">
        <div class="row">
          <div class="col-xs-12">
            <div class="d-table">
              <div class="d-tablecell">
                <div class="modal-dialog">
                  <div class="main-view modal-content">
                    <div class="modal-footer" data-dismiss="modal">
                      <span>x</span>
                    </div>
                    <div class="row">
                      <div class="col-xs-12 col-sm-5 col-md-4">
                        <div class="quick-image">
                          <div class="single-quick-image text-center">
                            <div class="list-img">
                              <div class="product-img tab-content">
                                <div
                                  class="simpleLens-container tab-pane fade in"
                                  id="q-sin-1"
                                >
                                  <div class="pro-type">
                                    <span>new</span>
                                  </div>
                                  <a
                                    class="simpleLens-image"
                                    :data-lens-image="`/uploads/${product.image}`"
                                    href="#"
                                  >
                                    <img
                                      :src="`/uploads/${product.image}`"
                                      alt
                                      class="simpleLens-big-image"
                                    />
                                  </a>
                                </div>
                                <div
                                  class="simpleLens-container tab-pane active fade in"
                                  id="q-sin-2"
                                >
                                  <!-- <div class="pro-type sell">
                                    <span>sell</span>
                                  </div>-->
                                  <a
                                    class="simpleLens-image"
                                    :data-lens-image="`/uploads/${product.image}`"
                                    href="#"
                                  >
                                    <img
                                      :src="`/uploads/${product.image}`"
                                      alt
                                      class="simpleLens-big-image"
                                    />
                                  </a>
                                </div>
                                <!-- <div class="simpleLens-container tab-pane fade in" id="q-sin-3">
                                  <div class="pro-type">
                                    <span>-15%</span>
                                  </div>
                                  <a
                                    class="simpleLens-image"
                                    data-lens-image="/assets/public/img/products/z3.jpg"
                                    href="#"
                                  >
                                    <img
                                      src="/assets/public/img/products/z3.jpg"
                                      alt
                                      class="simpleLens-big-image"
                                    />
                                  </a>
                                </div>-->
                                <!-- <div class="simpleLens-container tab-pane fade in" id="q-sin-4">
                                  <div class="pro-type">
                                    <span>new</span>
                                  </div>
                                  <a
                                    class="simpleLens-image"
                                    data-lens-image="/assets/public/img/products/z4.jpg"
                                    href="#"
                                  >
                                    <img
                                      src="/assets/public/img/products/z4.jpg"
                                      alt
                                      class="simpleLens-big-image"
                                    />
                                  </a>
                                </div>-->
                              </div>
                            </div>
                          </div>
                          <!-- <div class="quick-thumb">
                            <ul class="product-slider">
                              <li>
                                <a data-toggle="tab" href="#q-sin-1">
                                  <img src="/assets/public/img/products/s1.jpg" alt="quick view" />
                                </a>
                              </li>
                              <li class="active">
                                <a data-toggle="tab" href="#q-sin-2">
                                  <img src="/assets/public/img/products/s2.jpg" alt="small image" />
                                </a>
                              </li>
                              <li>
                                <a data-toggle="tab" href="#q-sin-3">
                                  <img src="/assets/public/img/products/s3.jpg" alt="small image" />
                                </a>
                              </li>
                              <li>
                                <a data-toggle="tab" href="#q-sin-4">
                                  <img src="/assets/public/img/products/s4.jpg" alt="small image" />
                                </a>
                              </li>
                            </ul>
                          </div>-->
                        </div>
                      </div>
                      <div class="col-xs-12 col-sm-7 col-md-8">
                        <div class="quick-right">
                          <div class="list-text">
                            <h3>{{ product.name }}</h3>
                            <span v-if="product.category">{{
                              product.category.name
                            }}</span>
                            <!-- <div class="ratting floatright">
                              <p>( 27 Rating )</p>
                              <i class="mdi mdi-star"></i>
                              <i class="mdi mdi-star"></i>
                              <i class="mdi mdi-star"></i>
                              <i class="mdi mdi-star-half"></i>
                              <i class="mdi mdi-star-outline"></i>
                            </div>-->
                            <template v-if="product.discount_price">
                              <h5>
                                <del>${{ product.price }}</del>
                                ${{ product.discount_price }}
                              </h5>
                            </template>

                            <template v-else>${{ product.price }}</template>
                            <p>{{ product.description }}</p>
                            <div class="all-choose">
                              <div class="s-shoose">
                                <h5>Color</h5>
                                <div class="size-drop">
                                  <select
                                    class="form-control form-control-sm"
                                    v-model="product_color"
                                  >
                                    <option
                                      :value="color"
                                      v-for="color in product.color"
                                      :key="color"
                                    >
                                      {{ color }}
                                    </option>
                                  </select>
                                </div>
                              </div>
                              <div class="s-shoose">
                                <h5>size</h5>
                                <div class="size-drop">
                                  <select
                                    class="form-control form-control-sm"
                                    v-model="product_size"
                                  >
                                    <option
                                      :value="size"
                                      v-for="size in product.size"
                                      :key="size"
                                    >
                                      {{ size }}
                                    </option>
                                  </select>
                                </div>
                              </div>
                              <div class="s-shoose">
                                <h5>qty</h5>
                                <form action="#" method="POST">
                                  <div class="plus-minus">
                                    <input
                                      type="number"
                                      value="01"
                                      name="qtybutton"
                                      v-model="product_qty"
                                      min="1"
                                    />
                                  </div>
                                </form>
                              </div>
                            </div>
                            <div class="list-btn" data-dismiss="modal">
                              <a
                                href="#"
                                @click.prevent="addCartForModal(product)"
                                >add to cart</a
                              >
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import PaginationComponent from "../inc/PaginationComponent.vue";
import ProductSidebar from "./ProductSidebar";
export default {
  name: "Shop",
  data() {
    return {
      pagination: {
        current_page: 1,
      },
      product: {},
      wishlist: {
        user_id: "",
        product_id: "",
      },
      product_color: "",
      product_size: "",
      product_qty: "1",
    };
  },
  components: {
    ProductSidebar,
    PaginationComponent,
  },
  methods: {
    productList() {
      this.$store.dispatch(
        "product/getFrontendProduct",
        this.pagination.current_page
      );
    },
    singleProductView(product) {
      this.product = product;
      this.product_color = product.color[0];
      this.product_size = product.size[0];
    },
    addToCart(product) {
      axios.post("/cart/cart-product-add", product).then((res) => {
        this.cartProducts();
        this.$message({
          message: "Cart Product Add Successfully",
          type: "success",
          center: false,
        });
      });
    },
    addCartForModal(product) {
      axios
        .post("/cart/cart-product-add-modal", {
          product: product,
          color: this.product_color,
          size: this.product_size,
          qty: this.product_qty,
        })
        .then((res) => {
          this.cartProducts();

          this.$message({
            message: "Cart Product Add Successfully",
            type: "success",
            center: false,
          });
        });
    },
    cartProducts() {
      this.$store.dispatch("cart/productList");
    },
    addToWishList(product) {
      if (Object.keys(this.user).length === 0) {
        this.$router.push({ name: "UserLogin" });
      } else {
        this.wishlist.user_id = this.user.id;
        this.wishlist.product_id = product.id;
        axios
          .post("/user/wishlist", this.wishlist)
          .then(() => {
            this.$message({
              message: "Wishlist Added Successfully",
              type: "success",
              center: false,
            });
          })
          .catch(() => {});
      }
    },
    //handle pagination
    // handleCurrentChange() {
    //   this.$store.dispatch("product/getFrontendProduct", this.currentPage);
    // },
  },
  created() {
    this.productList();
  },
  computed: {
    products() {
      return this.$store.getters["product/productList"];
    },
    meta() {
      return {
        current_page: this.products.current_page,
        last_page: this.products.last_page,
        from: this.products.from,
        to: this.products.to,
        per_page: this.products.per_page,
        total: this.products.total,
        path: this.products.path,
      };
    },
    set() {
      return (this.pagination = this.meta);
    },
    user() {
      return this.$store.getters["user/getUser"];
    },
  },
};
</script>

<style scoped>
.el-pagination {
  background: aqua;
}
.form-control {
  width: 15% !important;
  height: 31px !important;
}
.pagnation-ul {
  padding-bottom: 18px;
}
</style>
