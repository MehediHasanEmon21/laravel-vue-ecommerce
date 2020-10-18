<template>
  <div id="home">
    <section class="pages products-page section-padding-bottom">
      <div class="container">
        <div class="row">
          <div class="col-xs-12 col-sm-4 col-md-3">
            <product-sidebar></product-sidebar>
          </div>
          <div class="col-xs-12 col-sm-8 col-md-9">
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
                          <span>{{ currency }}{{ product.price }}</span>
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
                                  {{ currency }}{{ product.discount_price }}
                                </h5>
                              </template>

                              <template v-else
                                >{{ currency }}{{ product.price }}</template
                              >

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
                <div class="col-sm-12">
                  <!-- <div class="pagnation-ul">
                    <ul class="clearfix">
                      <li>
                        <a href="#">
                          <i class="mdi mdi-menu-left"></i>
                        </a>
                      </li>
                      <li>
                        <a href="#">1</a>
                      </li>
                      <li>
                        <a href="#">2</a>
                      </li>
                      <li>
                        <a href="#">3</a>
                      </li>
                      <li>
                        <a href="#">4</a>
                      </li>
                      <li>
                        <a href="#">5</a>
                      </li>
                      <li>
                        <a href="#">...</a>
                      </li>
                      <li>
                        <a href="#">10</a>
                      </li>
                      <li>
                        <a href="#">
                          <i class="mdi mdi-menu-right"></i>
                        </a>
                      </li>
                    </ul>
                  </div>-->
                  <el-pagination
                    class="text-center"
                    background
                    layout="prev, pager, next"
                    @current-change="handleCurrentChange"
                    :current-page.sync="currentPage"
                    :page-size="products.per_page"
                    :total="products.total"
                  ></el-pagination>
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
                                {{ currency }}{{ product.discount_price }}
                              </h5>
                            </template>

                            <template v-else
                              >{{ currency }}{{ product.price }}</template
                            >
                            <p>{{ product.description }}</p>
                            <div class="all-choose">
                              <!-- <div class="s-shoose">
                                <h5>Color</h5>
                                <div class="color-select clearfix">
                                  <span></span>
                                  <span class="outline"></span>
                                  <span></span>
                                  <span></span>
                                </div>
                              </div>-->
                              <div class="s-shoose">
                                <h5>Color</h5>
                                <div class="size-drop">
                                  <div class="btn-group">
                                    <button type="button" class="btn">
                                      Red
                                    </button>
                                    <button
                                      type="button"
                                      class="btn dropdown-toggle"
                                      data-toggle="dropdown"
                                      aria-haspopup="true"
                                      aria-expanded="false"
                                    >
                                      <span class>
                                        <i class="mdi mdi-chevron-down"></i>
                                      </span>
                                    </button>
                                    <ul class="dropdown-menu">
                                      <li
                                        v-for="color in product.color"
                                        :key="color"
                                      >
                                        <input type="color" :value="color" />
                                      </li>
                                    </ul>
                                  </div>
                                </div>
                              </div>
                              <div class="s-shoose">
                                <h5>size</h5>
                                <div class="size-drop">
                                  <div class="btn-group">
                                    <button type="button" class="btn">
                                      XL
                                    </button>
                                    <button
                                      type="button"
                                      class="btn dropdown-toggle"
                                      data-toggle="dropdown"
                                      aria-haspopup="true"
                                      aria-expanded="false"
                                    >
                                      <span class>
                                        <i class="mdi mdi-chevron-down"></i>
                                      </span>
                                    </button>
                                    <ul class="dropdown-menu">
                                      <li
                                        v-for="size in product.size"
                                        :key="size"
                                      >
                                        <a href="#">{{ size }}</a>
                                      </li>
                                    </ul>
                                  </div>
                                </div>
                              </div>
                              <div class="s-shoose">
                                <h5>qty</h5>
                                <form action="#" method="POST">
                                  <div class="plus-minus">
                                    <a class="dec qtybutton">-</a>
                                    <input
                                      type="text"
                                      value="02"
                                      name="qtybutton"
                                      class="plus-minus-box"
                                    />
                                    <a class="inc qtybutton">+</a>
                                  </div>
                                </form>
                              </div>
                            </div>
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
                            <div class="share-tag clearfix">
                              <ul class="blog-share floatleft">
                                <li>
                                  <h5>share</h5>
                                </li>
                                <li>
                                  <a href="#">
                                    <i class="mdi mdi-facebook"></i>
                                  </a>
                                </li>
                                <li>
                                  <a href="#">
                                    <i class="mdi mdi-twitter"></i>
                                  </a>
                                </li>
                                <li>
                                  <a href="#">
                                    <i class="mdi mdi-linkedin"></i>
                                  </a>
                                </li>
                                <li>
                                  <a href="#">
                                    <i class="mdi mdi-vimeo"></i>
                                  </a>
                                </li>
                                <li>
                                  <a href="#">
                                    <i class="mdi mdi-dribbble"></i>
                                  </a>
                                </li>
                                <li>
                                  <a href="#">
                                    <i class="mdi mdi-instagram"></i>
                                  </a>
                                </li>
                              </ul>
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
import ProductSidebar from "./ProductSidebar";
export default {
  name: "Shop",
  data() {
    return {
      currentPage: 1,
      currency: process.env.MIX_APP_CURRENCY,
      product: {},
      wishlist: {
        user_id: "",
        product_id: "",
      },
    };
  },
  components: {
    ProductSidebar,
  },
  methods: {
    productList() {
      this.$store.dispatch("product/getFrontendProduct", this.currentPage);
    },
    singleProductView(product) {
      this.product = product;
    },
    addToCatt(product) {},
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
    handleCurrentChange() {
      this.$store.dispatch("product/getFrontendProduct", this.currentPage);
    },
  },
  created() {
    this.productList();
  },
  computed: {
    products() {
      return this.$store.getters["product/productList"];
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
</style>
