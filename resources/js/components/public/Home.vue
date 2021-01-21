<template>
  <span id="home">
    <!-- <div class="main-slider-one main-slider-two slider-area">
      <div id="wrapper">
        <div class="slider-wrapper">
          <div id="mainSlider" class="nivoSlider">
            <img
              src="/assets/public/img/slider/home2/1.jpg"
              alt="main slider"
              title="#htmlcaption"
            />
            <img
              src="/assets/public/img/slider/home2/2.jpg"
              alt="main slider"
              title="#htmlcaption2"
            />
          </div>
          <div id="htmlcaption" class="nivo-html-caption slider-caption">
            <div class="container">
              <div class="slider-left slider-right">
                <div class="slide-text animated zoomInUp">
                  <h3>new collection</h3>
                  <h1>Men’s Fashion 2016</h1>
                </div>
                <div class="animated slider-btn fadeInUpBig">
                  <a class="shop-btn" href="shop.html">Shop now</a>
                </div>
              </div>
            </div>
          </div>
          <div id="htmlcaption2" class="nivo-html-caption slider-caption">
            <div class="container">
              <div class="slider-left two-caption-text slider-right">
                <div class="slide-text animated zoomInUp">
                  <h3>new collection</h3>
                  <h1>Men’s Fashion 2016</h1>
                  <span>Starting at $65.00. Don’t miss out!</span>
                </div>
                <div class="one-p animated bounceInLeft">
                  <p>
                    The standard chunk of Lorem Ipsum used since the 1500s is
                    reproduced below for those interested. Sections 1.10.32 and
                    1.10.33 from "de Finibus Bonorum et Malorum".
                  </p>
                </div>
                <div class="animated slider-btn fadeInUpBig">
                  <a class="shop-btn" href="shop.html">Shop now</a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div> -->
    <!-- slider section end -->
    <!-- collection section start -->
    <section class="collection-area collection-area2 section-padding">
      <div class="container">
        <div class="row">
          <div class="col-sm-4">
            <div class="single-colect banner collect-one">
              <a href="#" style="cursor: pointer" data-toggle="modal"
                              data-target="#quick-view" @click.prevent="singleProductView(products.random_one)"
                ><img :src="`/uploads/${products.random_one.image}`" alt=""
              /></a>
            </div>
          </div>
          <div class="col-sm-4">
            <div class="colect-text">
              <h4><router-link :to="{name: 'Shop'}">Fashion Collection 2021</router-link></h4>
              <h5>
                big sale of the men 2021 fashion <br />
                Up To 23% Off!
              </h5>
              <router-link :to="{name: 'Shop'}">Shop Now <i class="mdi mdi-arrow-right"></i></router-link>
            </div>
            <div class="collect-img banner margin single-colect">
              <a href="#" style="cursor: pointer" data-toggle="modal"
                              data-target="#quick-view" @click.prevent="singleProductView(products.random_two)"
                ><img :src="`/uploads/${products.random_two.image}`" alt=""
              /></a>
            </div>
          </div>
          <div class="col-sm-4">
            <div class="collect-img banner single-colect">
              <a href="#" style="cursor: pointer" data-toggle="modal"
                              data-target="#quick-view"  @click.prevent="singleProductView(products.random_three)"
                ><img :src="`/uploads/${products.random_three.image}`" alt=""
              /></a>
            </div>
            <div class="colect-text">
              <h4><router-link :to="{name: 'Shop'}">Men’s Collection 2020</router-link :to="{name: 'Shop'}"></h4>
              <p>
                There are many variations of passages of Lorem Ipsum avalabbut
                the majority have suffered alteration in some form.
              </p>
              <router-link :to="{name: 'Shop'}">Shop Now <i class="mdi mdi-arrow-right"></i></router-link :to="{name: 'Shop'}">
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- collection section end -->
    <!-- featured-products section start -->
    <section
      class="single-products products-two section-padding extra-padding-bottom"
    >
      <div class="container">
        <div class="row">
          <div class="col-xs-12">
            <div class="section-title text-center">
              <h2>Featured Products</h2>
            </div>
          </div>
        </div>
        <div class="wrapper">
          <ul class="load-list load-list-one">
            <li>
              <div class="row text-center">
                <div
                  class="col-xs-12 col-sm-6 col-md-3"
                  v-for="fp in products.feature_products"
                  :key="fp.id"
                >
                  <div class="single-product">
                    <div class="product-img">
                      <div class="pro-type">
                        <span>new</span>
                      </div>
                      <a href="#"
                        ><img :src="`/uploads/${fp.image}`" alt="Product Title"
                      /></a>
                      <div class="actions-btn">
                        <a href="#" @click.prevent="addToCart(fp)"><i class="mdi mdi-cart"></i></a>
                        <a
                          href="#"
                          data-toggle="modal"
                          data-target="#quick-view"
                          @click.prevent="singleProductView(fp)"
                          ><i class="mdi mdi-eye"></i
                        ></a>
                        <a href="#" @click.prevent="addToWishList(fp)"><i class="mdi mdi-heart"></i></a>
                      </div>
                    </div>
                    <div class="product-dsc">
                      <p>
                        <a href="#">{{ fp.name }}</a>
                      </p>
                      <span>${{ fp.price }}</span>
                    </div>
                  </div>
                </div>
              </div>
            </li>
          </ul>
        </div>
      </div>
    </section>
    <!-- featured-products section end -->
    <!-- coming product section start -->
    <section class="coming-product coming-product2">
      <div class="container">
        <div class="row">
          <div class="col-sm-4 col-md-2">
            <div class="tab-menu nav nav-tabs padding"></div>
          </div>
          <div class="col-sm-7 col-md-5">
            <div class="text-center large-img tab-content">
              <div class="tab-pane fade in active" id="dress1">
                <img data-toggle="modal"
                          data-target="#quick-view"
                          @click.prevent="singleProductView(products.mid_random)"
                  :src="`/uploads/${products.mid_random.image}`"
                  style="height: 600px"
                  alt=""
                />
                <div class="count-text clearfix"></div>
              </div>
              <div class="tab-pane fade" id="dress2">
                <img
                  :src="`/uploads/${products.mid_random.image}`"
                  style="height: 600px"
                  alt=""
                />
                <div class="count-text clearfix"></div>
              </div>
            </div>
          </div>
          <div class="col-sm-12 col-md-5">
            <div class="padding">
              <div class="tab-content">
                <div class="single-coming tab-pane fade in active" id="text1">
                  <h4>
                    <a href="#">{{ products.mid_random.name }}</a>
                  </h4>
                  <span
                    ><strong>${{ products.mid_random.price }}</strong></span
                  >
                  <p class="come-p">
                    {{ products.mid_random.description }}
                  </p>
                  <ul class="color-size">
                    <li>
                      <span>Size</span><strong>:</strong>
                      <a
                        v-for="(size, index) in products.mid_random.size"
                        :key="index"
                        href="#"
                        >{{ size }}</a
                      >
                    </li>
                    <li>
                      <span>color</span><strong>:</strong>
                      <a
                        v-for="(color, index) in products.mid_random.color"
                        :key="index"
                        href="#"
                        >{{ color }}</a
                      >
                    </li>
                    <li v-if="products.mid_random.brand.name">
                      <span>Brand</span><strong>:</strong
                      >{{ products.mid_random.brand.name }}
                    </li>
                    <li v-if="products.mid_random.category.name">
                      <span>category</span><strong>:</strong
                      >{{ products.mid_random.category.name }}
                    </li>
                  </ul>
                </div>
                <div class="single-coming tab-pane fade" id="text2">
                  <h4><a href="#">The Maker usc Dress</a></h4>
                  <span><strong>$569.00</strong> <del>$669.00</del></span>
                  <p class="come-p">
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
                    does eiusmodes tempor incididunt ut labore et dolore magna
                    aliqua. Ut enim ad minim venim, quis nostrud exercitation
                    ullamco laboris nisi ut aliquip ex ea commodoes tempor
                    incididunt ut labore et dolore magna aliqua. consequat. Ut
                    enim ad minim veniam.
                  </p>
                  <ul class="color-size">
                    <li>
                      <span>Size</span><strong>:</strong> <a href="#">SL</a
                      ><a href="#">ML</a><a href="#">Xl</a>
                    </li>
                    <li>
                      <span>color</span><strong>:</strong> <a href="#">Red</a
                      ><a href="#">Grean</a><a href="#">Blue</a>
                    </li>
                    <li><span>Brand</span><strong>:</strong>Crazy Fashion</li>
                    <li>
                      <span>category</span><strong>:</strong>Fashion Men’s
                    </li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- coming product section end -->
    <!-- tab-products section start -->
    <div
      class="tab-products single-products products-two section-padding extra-padding-top"
    >
      <div class="container">
        <div class="row">
          <div class="col-xs-12">
            <div class="section-title text-center">
              <div class="product-tab nav nav-tabs">
                <ul>
                  <li class="active">
                    <a data-toggle="tab" href="#arrival"
                      >New Arrival <span>//</span></a
                    >
                  </li>
                  <li>
                    <a data-toggle="tab" href="#popular"
                      >Popular Product <span>//</span></a
                    >
                  </li>
                  <li><a data-toggle="tab" href="#best">Best Seller</a></li>
                </ul>
              </div>
            </div>
          </div>
        </div>
        <div class="text-center tab-content">
          <div class="tab-pane fade in active" id="arrival">
            <div class="wrapper">
              <ul class="load-list load-list-two">
                <li>
                  <div class="row text-center">
                    <div
                      class="col-xs-12 col-sm-6 col-md-3"
                      v-for="na in products.new_arival"
                      :key="na.id"
                    >
                      <div class="single-product">
                        <div class="product-img">
                          <div class="pro-type">
                            <span>new</span>
                          </div>
                          <a href="#"
                            ><img
                              :src="`/uploads/${na.image}`"
                              alt="Product Title"
                          /></a>
                          <div class="actions-btn">
                            <a href="#" @click.prevent="addToCart(product)"><i class="mdi mdi-cart"></i></a>
                            <a
                              href="#"
                              data-toggle="modal"
                              data-target="#quick-view"
                              @click.prevent="singleProductView(na)"
                              ><i class="mdi mdi-eye"></i
                            ></a>
                            <a href="#" @click.prevent="addToWishList(product)"><i class="mdi mdi-heart"></i></a>
                          </div>
                        </div>
                        <div class="product-dsc">
                          <p>
                            <a href="#">{{ na.name }}</a>
                          </p>
                          <span>${{ na.price }}</span>
                        </div>
                      </div>
                    </div>
                    <!-- single product end -->
                  </div>
                </li>
              </ul>
            </div>
          </div>
          <!-- arrival product end -->
          <div class="tab-pane fade" id="popular">
            <div class="wrapper">
              <ul class="load-list load-list-three">
                <li>
                  <div class="row text-center">
                    <div class="col-xs-12 col-sm-6 col-md-3">
                      <div class="single-product">
                        <div class="product-img">
                          <a href="#"
                            ><img
                              src="/assets/public/img/products/16.jpg"
                              alt="Product Title"
                          /></a>
                          <div class="actions-btn">
                            <a href="#"><i class="mdi mdi-cart"></i></a>
                            <a
                              href="#"
                              data-toggle="modal"
                              data-target="#quick-view"
                              ><i class="mdi mdi-eye"></i
                            ></a>
                            <a href="#"><i class="mdi mdi-heart"></i></a>
                          </div>
                        </div>
                        <div class="product-dsc">
                          <p><a href="#">men’s Black t-shirt</a></p>
                          <span>$57.00</span>
                        </div>
                      </div>
                    </div>
                    <!-- single product end -->
                    <div class="col-xs-12 col-sm-6 col-md-3">
                      <div class="single-product">
                        <div class="product-img">
                          <a href="#"
                            ><img
                              src="/assets/public/img/products/17.jpg"
                              alt="Product Title"
                          /></a>
                          <div class="actions-btn">
                            <a href="#"><i class="mdi mdi-cart"></i></a>
                            <a
                              href="#"
                              data-toggle="modal"
                              data-target="#quick-view"
                              ><i class="mdi mdi-eye"></i
                            ></a>
                            <a href="#"><i class="mdi mdi-heart"></i></a>
                          </div>
                        </div>
                        <div class="product-dsc">
                          <p><a href="#">men’s White t-shirt</a></p>
                          <span>$67.00</span>
                        </div>
                      </div>
                    </div>
                    <!-- single product end -->
                    <div class="col-xs-12 col-sm-6 col-md-3 r-margin-top">
                      <div class="single-product">
                        <div class="product-img">
                          <a href="#"
                            ><img
                              src="/assets/public/img/products/18.jpg"
                              alt="Product Title"
                          /></a>
                          <div class="actions-btn">
                            <a href="#"><i class="mdi mdi-cart"></i></a>
                            <a
                              href="#"
                              data-toggle="modal"
                              data-target="#quick-view"
                              ><i class="mdi mdi-eye"></i
                            ></a>
                            <a href="#"><i class="mdi mdi-heart"></i></a>
                          </div>
                        </div>
                        <div class="product-dsc">
                          <p><a href="#">men’s Blue t-shirt</a></p>
                          <span>$77.00</span>
                        </div>
                      </div>
                    </div>
                    <!-- single product end -->
                    <div class="col-xs-12 col-sm-6 col-md-3 r-margin-top">
                      <div class="single-product">
                        <div class="product-img">
                          <a href="#"
                            ><img
                              src="/assets/public/img/products/19.jpg"
                              alt="Product Title"
                          /></a>
                          <div class="actions-btn">
                            <a href="#"><i class="mdi mdi-cart"></i></a>
                            <a
                              href="#"
                              data-toggle="modal"
                              data-target="#quick-view"
                              ><i class="mdi mdi-eye"></i
                            ></a>
                            <a href="#"><i class="mdi mdi-heart"></i></a>
                          </div>
                        </div>
                        <div class="product-dsc">
                          <p><a href="#">men’s Grey t-shirt</a></p>
                          <span>$77.00</span>
                        </div>
                      </div>
                    </div>
                    <!-- single product end -->
                  </div>
                </li>
                <li>
                  <div class="row text-center">
                    <div class="col-xs-12 col-sm-6 col-md-3">
                      <div class="single-product">
                        <div class="product-img">
                          <a href="#"
                            ><img
                              src="/assets/public/img/products/20.jpg"
                              alt="Product Title"
                          /></a>
                          <div class="actions-btn">
                            <a href="#"><i class="mdi mdi-cart"></i></a>
                            <a
                              href="#"
                              data-toggle="modal"
                              data-target="#quick-view"
                              ><i class="mdi mdi-eye"></i
                            ></a>
                            <a href="#"><i class="mdi mdi-heart"></i></a>
                          </div>
                        </div>
                        <div class="product-dsc">
                          <p><a href="#">men’s white t-shirt</a></p>
                          <span>$65.20</span>
                        </div>
                      </div>
                    </div>
                    <!-- single product end -->
                    <div class="col-xs-12 col-sm-6 col-md-3">
                      <div class="single-product">
                        <div class="product-img">
                          <div class="pro-type sell">
                            <span>sell</span>
                          </div>
                          <a href="#"
                            ><img
                              src="/assets/public/img/products/21.jpg"
                              alt="Product Title"
                          /></a>
                          <div class="actions-btn">
                            <a href="#"><i class="mdi mdi-cart"></i></a>
                            <a
                              href="#"
                              data-toggle="modal"
                              data-target="#quick-view"
                              ><i class="mdi mdi-eye"></i
                            ></a>
                            <a href="#"><i class="mdi mdi-heart"></i></a>
                          </div>
                        </div>
                        <div class="product-dsc">
                          <p><a href="#">men’s Black t-shirt</a></p>
                          <span>$57.00 <del>$62.00</del></span>
                        </div>
                      </div>
                    </div>
                    <!-- single product end -->
                    <div class="col-xs-12 col-sm-6 col-md-3 r-margin-top">
                      <div class="single-product">
                        <div class="product-img">
                          <a href="#"
                            ><img
                              src="/assets/public/img/products/22.jpg"
                              alt="Product Title"
                          /></a>
                          <div class="actions-btn">
                            <a href="#"><i class="mdi mdi-cart"></i></a>
                            <a
                              href="#"
                              data-toggle="modal"
                              data-target="#quick-view"
                              ><i class="mdi mdi-eye"></i
                            ></a>
                            <a href="#"><i class="mdi mdi-heart"></i></a>
                          </div>
                        </div>
                        <div class="product-dsc">
                          <p><a href="#">men’s Black t-shirt</a></p>
                          <span>$56.00</span>
                        </div>
                      </div>
                    </div>
                    <!-- single product end -->
                    <div class="col-xs-12 col-sm-6 col-md-3 r-margin-top">
                      <div class="single-product">
                        <div class="product-img">
                          <a href="#"
                            ><img
                              src="/assets/public/img/products/23.jpg"
                              alt="Product Title"
                          /></a>
                          <div class="actions-btn">
                            <a href="#"><i class="mdi mdi-cart"></i></a>
                            <a
                              href="#"
                              data-toggle="modal"
                              data-target="#quick-view"
                              ><i class="mdi mdi-eye"></i
                            ></a>
                            <a href="#"><i class="mdi mdi-heart"></i></a>
                          </div>
                        </div>
                        <div class="product-dsc">
                          <p><a href="#">men’s Black t-shirt</a></p>
                          <span>$96.00</span>
                        </div>
                      </div>
                    </div>
                    <!-- single product end -->
                  </div>
                </li>
                <li>
                  <div class="row text-center">
                    <div class="col-xs-12 col-sm-6 col-md-3">
                      <div class="single-product">
                        <div class="product-img">
                          <div class="pro-type">
                            <span>new</span>
                          </div>
                          <a href="#"
                            ><img
                              src="/assets/public/img/products/18.jpg"
                              alt="Product Title"
                          /></a>
                          <div class="actions-btn">
                            <a href="#"><i class="mdi mdi-cart"></i></a>
                            <a
                              href="#"
                              data-toggle="modal"
                              data-target="#quick-view"
                              ><i class="mdi mdi-eye"></i
                            ></a>
                            <a href="#"><i class="mdi mdi-heart"></i></a>
                          </div>
                        </div>
                        <div class="product-dsc">
                          <p><a href="#">men’s White t-shirt</a></p>
                          <span>$165.20</span>
                        </div>
                      </div>
                    </div>
                    <!-- single product end -->
                    <div class="col-xs-12 col-sm-6 col-md-3">
                      <div class="single-product">
                        <div class="product-img">
                          <a href="#"
                            ><img
                              src="/assets/public/img/products/21.jpg"
                              alt="Product Title"
                          /></a>
                          <div class="actions-btn">
                            <a href="#"><i class="mdi mdi-cart"></i></a>
                            <a
                              href="#"
                              data-toggle="modal"
                              data-target="#quick-view"
                              ><i class="mdi mdi-eye"></i
                            ></a>
                            <a href="#"><i class="mdi mdi-heart"></i></a>
                          </div>
                        </div>
                        <div class="product-dsc">
                          <p><a href="#">men’s White t-shirt</a></p>
                          <span>$57.00</span>
                        </div>
                      </div>
                    </div>
                    <!-- single product end -->
                    <div class="col-xs-12 col-sm-6 col-md-3 r-margin-top">
                      <div class="single-product">
                        <div class="product-img">
                          <a href="#"
                            ><img
                              src="/assets/public/img/products/23.jpg"
                              alt="Product Title"
                          /></a>
                          <div class="actions-btn">
                            <a href="#"><i class="mdi mdi-cart"></i></a>
                            <a
                              href="#"
                              data-toggle="modal"
                              data-target="#quick-view"
                              ><i class="mdi mdi-eye"></i
                            ></a>
                            <a href="#"><i class="mdi mdi-heart"></i></a>
                          </div>
                        </div>
                        <div class="product-dsc">
                          <p><a href="#">men’s Black t-shirt</a></p>
                          <span>$67.00</span>
                        </div>
                      </div>
                    </div>
                    <!-- single product end -->
                    <div class="col-xs-12 col-sm-6 col-md-3 r-margin-top">
                      <div class="single-product">
                        <div class="product-img">
                          <a href="#"
                            ><img
                              src="/assets/public/img/products/19.jpg"
                              alt="Product Title"
                          /></a>
                          <div class="actions-btn">
                            <a href="#"><i class="mdi mdi-cart"></i></a>
                            <a
                              href="#"
                              data-toggle="modal"
                              data-target="#quick-view"
                              ><i class="mdi mdi-eye"></i
                            ></a>
                            <a href="#"><i class="mdi mdi-heart"></i></a>
                          </div>
                        </div>
                        <div class="product-dsc">
                          <p><a href="#">men’s Grey t-shirt</a></p>
                          <span>$77.00</span>
                        </div>
                      </div>
                    </div>
                    <!-- single product end -->
                  </div>
                </li>
              </ul>
              <button id="load-more-three">Load More</button>
            </div>
          </div>
          <!-- popular product end -->
          <div class="tab-pane fade" id="best">
            <div class="wrapper">
              <ul class="load-list load-list-four">
                <li>
                  <div class="row text-center">
                    <div class="col-xs-12 col-sm-6 col-md-3">
                      <div class="single-product">
                        <div class="product-img">
                          <div class="pro-type">
                            <span>new</span>
                          </div>
                          <a href="#"
                            ><img
                              src="/assets/public/img/products/21.jpg"
                              alt="Product Title"
                          /></a>
                          <div class="actions-btn">
                            <a href="#"><i class="mdi mdi-cart"></i></a>
                            <a
                              href="#"
                              data-toggle="modal"
                              data-target="#quick-view"
                              ><i class="mdi mdi-eye"></i
                            ></a>
                            <a href="#"><i class="mdi mdi-heart"></i></a>
                          </div>
                        </div>
                        <div class="product-dsc">
                          <p><a href="#">men’s White t-shirt</a></p>
                          <span>$165.20</span>
                        </div>
                      </div>
                    </div>
                    <!-- single product end -->
                    <div class="col-xs-12 col-sm-6 col-md-3">
                      <div class="single-product">
                        <div class="product-img">
                          <a href="#"
                            ><img
                              src="/assets/public/img/products/13.jpg"
                              alt="Product Title"
                          /></a>
                          <div class="actions-btn">
                            <a href="#"><i class="mdi mdi-cart"></i></a>
                            <a
                              href="#"
                              data-toggle="modal"
                              data-target="#quick-view"
                              ><i class="mdi mdi-eye"></i
                            ></a>
                            <a href="#"><i class="mdi mdi-heart"></i></a>
                          </div>
                        </div>
                        <div class="product-dsc">
                          <p><a href="#">men’s Black t-shirt</a></p>
                          <span>$57.00</span>
                        </div>
                      </div>
                    </div>
                    <!-- single product end -->
                    <div class="col-xs-12 col-sm-6 col-md-3 r-margin-top">
                      <div class="single-product">
                        <div class="product-img">
                          <div class="pro-type">
                            <span>-15%</span>
                          </div>
                          <a href="#"
                            ><img
                              src="/assets/public/img/products/22.jpg"
                              alt="Product Title"
                          /></a>
                          <div class="actions-btn">
                            <a href="#"><i class="mdi mdi-cart"></i></a>
                            <a
                              href="#"
                              data-toggle="modal"
                              data-target="#quick-view"
                              ><i class="mdi mdi-eye"></i
                            ></a>
                            <a href="#"><i class="mdi mdi-heart"></i></a>
                          </div>
                        </div>
                        <div class="product-dsc">
                          <p><a href="#">men’s Black t-shirt</a></p>
                          <span>$67.00</span>
                        </div>
                      </div>
                    </div>
                    <!-- single product end -->
                    <div class="col-xs-12 col-sm-6 col-md-3 r-margin-top">
                      <div class="single-product">
                        <div class="product-img">
                          <a href="#"
                            ><img
                              src="/assets/public/img/products/16.jpg"
                              alt="Product Title"
                          /></a>
                          <div class="actions-btn">
                            <a href="#"><i class="mdi mdi-cart"></i></a>
                            <a
                              href="#"
                              data-toggle="modal"
                              data-target="#quick-view"
                              ><i class="mdi mdi-eye"></i
                            ></a>
                            <a href="#"><i class="mdi mdi-heart"></i></a>
                          </div>
                        </div>
                        <div class="product-dsc">
                          <p><a href="#">men’s Black t-shirt</a></p>
                          <span>$77.00</span>
                        </div>
                      </div>
                    </div>
                    <!-- single product end -->
                  </div>
                </li>
                <li>
                  <div class="row text-center">
                    <div class="col-xs-12 col-sm-6 col-md-3">
                      <div class="single-product">
                        <div class="product-img">
                          <a href="#"
                            ><img
                              src="/assets/public/img/products/17.jpg"
                              alt="Product Title"
                          /></a>
                          <div class="actions-btn">
                            <a href="#"><i class="mdi mdi-cart"></i></a>
                            <a
                              href="#"
                              data-toggle="modal"
                              data-target="#quick-view"
                              ><i class="mdi mdi-eye"></i
                            ></a>
                            <a href="#"><i class="mdi mdi-heart"></i></a>
                          </div>
                        </div>
                        <div class="product-dsc">
                          <p><a href="#">men’s Black t-shirt</a></p>
                          <span>$65.20</span>
                        </div>
                      </div>
                    </div>
                    <!-- single product end -->
                    <div class="col-xs-12 col-sm-6 col-md-3">
                      <div class="single-product">
                        <div class="product-img">
                          <div class="pro-type sell">
                            <span>sell</span>
                          </div>
                          <a href="#"
                            ><img
                              src="/assets/public/img/products/19.jpg"
                              alt="Product Title"
                          /></a>
                          <div class="actions-btn">
                            <a href="#"><i class="mdi mdi-cart"></i></a>
                            <a
                              href="#"
                              data-toggle="modal"
                              data-target="#quick-view"
                              ><i class="mdi mdi-eye"></i
                            ></a>
                            <a href="#"><i class="mdi mdi-heart"></i></a>
                          </div>
                        </div>
                        <div class="product-dsc">
                          <p><a href="#">men’s Grey t-shirt</a></p>
                          <span>$57.00 <del>$62.00</del></span>
                        </div>
                      </div>
                    </div>
                    <!-- single product end -->
                    <div class="col-xs-12 col-sm-6 col-md-3 r-margin-top">
                      <div class="single-product">
                        <div class="product-img">
                          <a href="#"
                            ><img
                              src="/assets/public/img/products/18.jpg"
                              alt="Product Title"
                          /></a>
                          <div class="actions-btn">
                            <a href="#"><i class="mdi mdi-cart"></i></a>
                            <a
                              href="#"
                              data-toggle="modal"
                              data-target="#quick-view"
                              ><i class="mdi mdi-eye"></i
                            ></a>
                            <a href="#"><i class="mdi mdi-heart"></i></a>
                          </div>
                        </div>
                        <div class="product-dsc">
                          <p><a href="#">men’s White t-shirt</a></p>
                          <span>$56.00</span>
                        </div>
                      </div>
                    </div>
                    <!-- single product end -->
                    <div class="col-xs-12 col-sm-6 col-md-3 r-margin-top">
                      <div class="single-product">
                        <div class="product-img">
                          <a href="#"
                            ><img
                              src="/assets/public/img/products/20.jpg"
                              alt="Product Title"
                          /></a>
                          <div class="actions-btn">
                            <a href="#"><i class="mdi mdi-cart"></i></a>
                            <a
                              href="#"
                              data-toggle="modal"
                              data-target="#quick-view"
                              ><i class="mdi mdi-eye"></i
                            ></a>
                            <a href="#"><i class="mdi mdi-heart"></i></a>
                          </div>
                        </div>
                        <div class="product-dsc">
                          <p><a href="#">men’s Black t-shirt</a></p>
                          <span>$96.00</span>
                        </div>
                      </div>
                    </div>
                    <!-- single product end -->
                  </div>
                </li>
                <li>
                  <div class="row text-center">
                    <div class="col-xs-12 col-sm-6 col-md-3">
                      <div class="single-product">
                        <div class="product-img">
                          <div class="pro-type">
                            <span>new</span>
                          </div>
                          <a href="#"
                            ><img
                              src="/assets/public/img/products/23.jpg"
                              alt="Product Title"
                          /></a>
                          <div class="actions-btn">
                            <a href="#"><i class="mdi mdi-cart"></i></a>
                            <a
                              href="#"
                              data-toggle="modal"
                              data-target="#quick-view"
                              ><i class="mdi mdi-eye"></i
                            ></a>
                            <a href="#"><i class="mdi mdi-heart"></i></a>
                          </div>
                        </div>
                        <div class="product-dsc">
                          <p><a href="#">men’s Black t-shirt</a></p>
                          <span>$165.20</span>
                        </div>
                      </div>
                    </div>
                    <!-- single product end -->
                    <div class="col-xs-12 col-sm-6 col-md-3">
                      <div class="single-product">
                        <div class="product-img">
                          <div class="pro-type">
                            <span>new</span>
                          </div>
                          <a href="#"
                            ><img
                              src="/assets/public/img/products/20.jpg"
                              alt="Product Title"
                          /></a>
                          <div class="actions-btn">
                            <a href="#"><i class="mdi mdi-cart"></i></a>
                            <a
                              href="#"
                              data-toggle="modal"
                              data-target="#quick-view"
                              ><i class="mdi mdi-eye"></i
                            ></a>
                            <a href="#"><i class="mdi mdi-heart"></i></a>
                          </div>
                        </div>
                        <div class="product-dsc">
                          <p><a href="#">men’s White t-shirt</a></p>
                          <span>$165.20</span>
                        </div>
                      </div>
                    </div>
                    <!-- single product end -->
                    <div class="col-xs-12 col-sm-6 col-md-3 r-margin-top">
                      <div class="single-product">
                        <div class="product-img">
                          <a href="#"
                            ><img
                              src="/assets/public/img/products/16.jpg"
                              alt="Product Title"
                          /></a>
                          <div class="actions-btn">
                            <a href="#"><i class="mdi mdi-cart"></i></a>
                            <a
                              href="#"
                              data-toggle="modal"
                              data-target="#quick-view"
                              ><i class="mdi mdi-eye"></i
                            ></a>
                            <a href="#"><i class="mdi mdi-heart"></i></a>
                          </div>
                        </div>
                        <div class="product-dsc">
                          <p><a href="#">men’s Black t-shirt</a></p>
                          <span>$57.00</span>
                        </div>
                      </div>
                    </div>
                    <!-- single product end -->
                    <div class="col-xs-12 col-sm-6 col-md-3 r-margin-top">
                      <div class="single-product">
                        <div class="product-img">
                          <a href="#"
                            ><img
                              src="/assets/public/img/products/18.jpg"
                              alt="Product Title"
                          /></a>
                          <div class="actions-btn">
                            <a href="#"><i class="mdi mdi-cart"></i></a>
                            <a
                              href="#"
                              data-toggle="modal"
                              data-target="#quick-view"
                              ><i class="mdi mdi-eye"></i
                            ></a>
                            <a href="#"><i class="mdi mdi-heart"></i></a>
                          </div>
                        </div>
                        <div class="product-dsc">
                          <p><a href="#">men’s Blue t-shirt</a></p>
                          <span>$77.00</span>
                        </div>
                      </div>
                    </div>
                    <!-- single product end -->
                  </div>
                </li>
              </ul>
              <button id="load-more-four">Load More</button>
            </div>
          </div>
          <!-- popular product end -->
        </div>
      </div>
    </div>
    <!-- tab-products section end -->
    <!-- blog section start -->
    <section class="latest-blog section-padding">
      <div class="container">
        <div class="row">
          <div class="col-xs-12">
            <div class="section-title text-center">
              <h2>Latest Blog</h2>
            </div>
          </div>
        </div>
        <div class="wrapper">
          <ul class="load-list load-list-blog">
            <li>
              <div class="row">
                <div class="col-sm-4">
                  <div class="l-blog-text">
                    <div class="banner">
                      <a href="single-blog.html"
                        ><img src="/assets/public/img/blog/1.jpg" alt=""
                      /></a>
                    </div>
                    <div class="s-blog-text">
                      <h4>
                        <a href="single-blog.html"
                          >Fashion style fine arts drawing</a
                        >
                      </h4>
                      <span
                        >By : <a href="#">Rakib</a> | <a href="#">210 Like</a> |
                        <a href="#">69 Comments</a></span
                      >
                      <p>
                        There are many variations of passages of Lorem Ipsum
                        available, but the majority have suffered alteration in
                        some form, by injected humour....
                      </p>
                    </div>
                    <div class="date-read clearfix">
                      <a href="#"><i class="mdi mdi-clock"></i> jun 25, 2016</a>
                      <a href="single-blog.html">read more</a>
                    </div>
                  </div>
                </div>
                <div class="col-sm-4">
                  <div class="l-blog-text">
                    <div class="banner">
                      <a href="single-blog.html"
                        ><img src="/assets/public/img/blog/2.jpg" alt=""
                      /></a>
                    </div>
                    <div class="s-blog-text">
                      <h4>
                        <a href="single-blog.html"
                          >women’s Fashion style 2016</a
                        >
                      </h4>
                      <span
                        >By : <a href="#">Rakib</a> | <a href="#">210 Like</a> |
                        <a href="#">69 Comments</a></span
                      >
                      <p>
                        There are many variations of passages of Lorem Ipsum
                        available, but the majority have suffered alteration in
                        some form, by injected humour....
                      </p>
                    </div>
                    <div class="date-read clearfix">
                      <a href="#"><i class="mdi mdi-clock"></i> jun 15, 2016</a>
                      <a href="single-blog.html">read more</a>
                    </div>
                  </div>
                </div>
                <div class="col-sm-4">
                  <div class="l-blog-text">
                    <div class="banner">
                      <a href="single-blog.html"
                        ><img src="/assets/public/img/blog/3.jpg" alt=""
                      /></a>
                    </div>
                    <div class="s-blog-text">
                      <h4>
                        <a href="single-blog.html"
                          >women’s winter Fashion style</a
                        >
                      </h4>
                      <span
                        >By : <a href="#">Rakib</a> | <a href="#">210 Like</a> |
                        <a href="#">69 Comments</a></span
                      >
                      <p>
                        There are many variations of passages of Lorem Ipsum
                        available, but the majority have suffered alteration in
                        some form, by injected humour....
                      </p>
                    </div>
                    <div class="date-read clearfix">
                      <a href="#"><i class="mdi mdi-clock"></i> jun 22, 2016</a>
                      <a href="single-blog.html">read more</a>
                    </div>
                  </div>
                </div>
              </div>
            </li>
            <li>
              <div class="row">
                <div class="col-sm-4">
                  <div class="l-blog-text">
                    <div class="banner">
                      <a href="single-blog.html"
                        ><img src="/assets/public/img/blog/4.jpg" alt=""
                      /></a>
                    </div>
                    <div class="s-blog-text">
                      <h4>
                        <a href="single-blog.html"
                          >women’s winter Fashion style</a
                        >
                      </h4>
                      <span
                        >By : <a href="#">Rakib</a> | <a href="#">210 Like</a> |
                        <a href="#">69 Comments</a></span
                      >
                      <p>
                        There are many variations of passages of Lorem Ipsum
                        available, but the majority have suffered alteration in
                        some form, by injected humour....
                      </p>
                    </div>
                    <div class="date-read clearfix">
                      <a href="#"><i class="mdi mdi-clock"></i> jun 22, 2016</a>
                      <a href="single-blog.html">read more</a>
                    </div>
                  </div>
                </div>
                <div class="col-sm-4">
                  <div class="l-blog-text">
                    <div class="banner">
                      <a href="single-blog.html"
                        ><img src="/assets/public/img/blog/5.jpg" alt=""
                      /></a>
                    </div>
                    <div class="s-blog-text">
                      <h4>
                        <a href="#"
                          >Fashion style fine arts drawing</a
                        >
                      </h4>
                      <span
                        >By : <a href="#">Rakib</a> | <a href="#">210 Like</a> |
                        <a href="#">69 Comments</a></span
                      >
                      <p>
                        There are many variations of passages of Lorem Ipsum
                        available, but the majority have suffered alteration in
                        some form, by injected humour....
                      </p>
                    </div>
                    <div class="date-read clearfix">
                      <a href="#"><i class="mdi mdi-clock"></i> jun 25, 2016</a>
                      <a href="#">read more</a>
                    </div>
                  </div>
                </div>
                <div class="col-sm-4">
                  <div class="l-blog-text">
                    <div class="banner">
                      <a href="single-blog.html"
                        ><img src="/assets/public/img/blog/6.jpg" alt=""
                      /></a>
                    </div>
                    <div class="s-blog-text">
                      <h4>
                        <a href="single-blog.html"
                          >women’s Fashion style 2016</a
                        >
                      </h4>
                      <span
                        >By : <a href="#">Rakib</a> | <a href="#">210 Like</a> |
                        <a href="#">69 Comments</a></span
                      >
                      <p>
                        There are many variations of passages of Lorem Ipsum
                        available, but the majority have suffered alteration in
                        some form, by injected humour....
                      </p>
                    </div>
                    <div class="date-read clearfix">
                      <a href="#"><i class="mdi mdi-clock"></i> jun 15, 2016</a>
                      <a href="#">read more</a>
                    </div>
                  </div>
                </div>
              </div>
            </li>
          </ul>
        </div>
      </div>
    </section>
    <!-- blog section end -->
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
                                 $ {{ product.discount_price }}
                              </h5>
                            </template>

                            <template v-else
                              > $ {{ product.price }}</template
                            >
                            <p>{{ product.description }}</p>
                            <div class="all-choose">
                              <div class="s-shoose">
                                <h5>Color</h5>
                                <div class="size-drop">
                                  <select
                                    class="form-control form-control-sm"
                                    v-model="product_color"
                                  >
                                    <option :value="color"
                                      v-for="color in product.color"
                                      :key="color">{{color}}</option>
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
  </span>
</template>

<script>
export default {
  name: "Home",
  data() {
    return {
      product: {},
      product_color: "",
      product_size: "",
      product_qty: "1",
      wishlist: {
        user_id: "",
        product_id: "",
      },
    };
  },
  methods: {
    homeProducts() {
      this.$store.dispatch("product/getHomeProduct");
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
    cartProducts() {
      this.$store.dispatch("cart/productList");
    },
  },
  created() {
    this.homeProducts();
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
.form-control {
  width: 15% !important;
  height: 31px !important;
}
</style>
