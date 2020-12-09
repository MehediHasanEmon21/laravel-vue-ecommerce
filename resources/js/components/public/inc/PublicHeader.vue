<template>
  <header class="header-one header-two">
    <div class="header-top-two">
      <div class="container text-center">
        <div class="row">
          <div class="col-sm-12">
            <div class="middel-top">
              <div class="left floatleft">
                <p>
                  <i class="mdi mdi-clock"></i>
                  Mon-Fri : 09:00-19:00
                </p>
              </div>
            </div>
            <div class="middel-top clearfix">
              <ul class="clearfix right floatright">
                <li v-if="user && user.id">
                  <a href="#">
                    <i class="mdi mdi-account"></i>
                  </a>
                  <ul>
                    <li>
                      <router-link :to="{ name: 'UserDashboard' }"
                        >My Account</router-link
                      >
                    </li>
                    <li>
                      <a @click.prevent="userLogout">Logout</a>
                    </li>
                  </ul>
                </li>
                <li v-else>
                  <a href="#">
                    <i class="mdi mdi-account"></i>
                  </a>
                  <ul>
                    <li>
                      <router-link :to="{ name: 'UserLogin' }"
                        >Login</router-link
                      >
                    </li>
                    <li>
                      <router-link :to="{ name: 'UserRegister' }"
                        >Register</router-link
                      >
                    </li>
                  </ul>
                </li>
                <li>
                  <a href="#">
                    <i class="mdi mdi-settings"></i>
                  </a>
                  <ul>
                    <li>
                      <a href="my-account.html">My account</a>
                    </li>
                    <li>
                      <router-link :to="{ name: 'Cart' }">My cart</router-link>
                    </li>
                    <li>
                      <router-link :to="{ name: 'WishList' }"
                        >My wishlist</router-link
                      >
                    </li>
                    <li>
                      <a href="checkout.html">Check out</a>
                    </li>
                  </ul>
                </li>
              </ul>
              <div class="right floatright">
                <form action="#" method="get">
                  <button type="submit">
                    <i class="mdi mdi-magnify"></i>
                  </button>
                  <input
                    type="text"
                    placeholder="Search within these results..."
                  />
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="container text-center">
      <div class="row">
        <div class="col-sm-2">
          <div class="logo">
            <a href="index.html">
              <img src="/assets/public/img/logo2.png" alt="Sellshop" />
            </a>
          </div>
        </div>
        <div class="col-sm-8">
          <div class="header-middel">
            <div class="mainmenu">
              <nav>
                <ul>
                  <li>
                    <router-link :to="{ name: 'Home' }">Home</router-link>
                  </li>
                  <li>
                    <router-link :to="{ name: 'Shop' }">Shop</router-link>
                  </li>
                  <li>
                    <router-link :to="{ name: 'Blog' }">Blog</router-link>
                  </li>
                  <li>
                    <router-link :to="{ name: 'About' }">About</router-link>
                  </li>
                  <li>
                    <router-link :to="{ name: 'Contact' }">Contact</router-link>
                  </li>
                </ul>
              </nav>
            </div>
            <!-- mobile menu start -->
            <div class="mobile-menu-area">
              <div class="mobile-menu">
                <nav id="dropdown">
                  <ul>
                    <li>
                      <router-link :to="{ name: 'Home' }">Home</router-link>
                    </li>
                    <li>
                      <router-link :to="{ name: 'Shop' }">Shop</router-link>
                    </li>
                    <li>
                      <router-link :to="{ name: 'Blog' }">Blog</router-link>
                    </li>
                    <li>
                      <router-link :to="{ name: 'About' }">About</router-link>
                    </li>
                    <li>
                      <router-link :to="{ name: 'Contact' }"
                        >Contact</router-link
                      >
                    </li>
                  </ul>
                </nav>
              </div>
            </div>
          </div>
        </div>
        <div class="col-sm-2">
          <div class="cart-itmes">
            <router-link class="cart-itme-a" :to="{ name: 'Cart' }">
              <i class="mdi mdi-cart"></i>
              {{ products.count }} items :
              <strong>${{ products.total }}</strong>
            </router-link>
            <div class="cartdrop">
              <div
                class="sin-itme clearfix"
                v-for="product in products.carts"
                :key="product.id"
              >
                <i @click.prevent="removeCart(product.id)" class="mdi mdi-close"></i>
                <a class="cart-img" href="cart.html">
                  <img :src="`/uploads/${product.attributes.image}`" alt />
                </a>
                <div class="menu-cart-text">
                  <a href="#">
                    <h5>{{ product.name }}</h5>
                  </a>
                  <span>Color : {{ product.attributes.color }}</span>
                  <span>Size : {{ product.attributes.size }}</span>
                  <strong>${{ product.price }}</strong>
                </div>
              </div>
              <div class="total">
                <span>
                  total
                  <strong>= ${{ products.total }}</strong>
                </span>
              </div>
              <router-link class="goto" :to="{ name: 'Cart' }"
                >go to cart</router-link
              >
              <a class="out-menu" href="checkout.html">Check out</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </header>
</template>

<script>
export default {
  name: "PublicHeader",
  computed: {
    user() {
      return this.$store.getters["user/getUser"];
    },
    products() {
      return this.$store.getters["cart/productList"];
    },
  },
  methods: {
    getUser() {
      this.$store.dispatch("user/getUser");
    },
    userLogout() {
      this.$store.dispatch("user/userLogout");
      localStorage.removeItem("userLoggedIn");
      this.$router.push({ name: "UserLogin" });
      this.$message({
        message: "Logged out successfully",
        type: "success",
      });
    },
    productList() {
      this.$store.dispatch("cart/productList");
    },
     removeCart(id){
        axios.get('/cart/remove-cart/'+id)
        .then((result) => {
            this.productList();
            this.$message({
            message: "Cart Product Remove Successfully",
            type: "success",
            center: false,
            });

        }).catch((err) => {
            console.log(err)
        });
    }
  },

  created() {
    this.getUser();
    this.productList();
  },
};
</script>

<style scoped>
</style>
