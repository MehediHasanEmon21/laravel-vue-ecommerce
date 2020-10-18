<template>
  <section class="pages wishlist-page section-padding">
    <div class="container">
      <div class="row">
        <div class="col-xs-12">
          <div class="table-responsive padding60">
            <table class="wishlist-table text-center">
              <thead>
                <tr>
                  <th>Product</th>
                  <th>Price</th>
                  <!-- <th>Stock Status</th> -->
                  <th>Add To Cart</th>
                  <th>Remove</th>
                </tr>
              </thead>
              <tbody>
                <tr v-for="wis in wishlist.data" :key="wis.id">
                  <td class="td-img text-left">
                    <a href="#"
                      ><img
                        :src="`/uploads/${wis.product.image}`"
                        alt="Add Product"
                    /></a>
                    <div class="items-dsc">
                      <h5>
                        <a href="#">{{ wis.product.name }}</a>
                      </h5>
                      <p class="itemcolor">
                        Color :
                        <span
                          ><span v-for="color in wis.product.color" :key="color"
                            >{{ color }},</span
                          ></span
                        >
                      </p>
                      <p class="itemcolor">
                        Size :
                        <span v-for="size in wis.product.size" :key="size">{{
                          size
                        }}</span>
                      </p>
                    </div>
                  </td>
                  <td>${{ wis.product.price }}</td>
                  <!-- <td>In Stock</td> -->
                  <td>
                    <div class="submit-text">
                      <a href="cart.html">Add to cart</a>
                    </div>
                  </td>
                  <td @click.prevent="deleteWishList(wis.id)">
                    <i class="mdi mdi-close" title="Remove this product"></i>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
export default {
  name: "WishList",
  data() {
    return {
      currentPage: 1,
    };
  },
  methods: {
    wishList() {
      this.$store.dispatch("wishlist/WishList", this.currentPage);
    },
    deleteWishList(id) {
      axios
        .delete(`/user/wishlist/${id}`)
        .then((result) => {
          this.wishList();
          this.$message({
            message: "Wishlist Deleted Successfully",
            type: "success",
            center: false,
          });
        })
        .catch((err) => {});
    },
  },
  created() {
    this.wishList();
  },
  computed: {
    wishlist() {
      return this.$store.getters["wishlist/WishList"];
    },
  },
};
</script>

<style lang="scss" scoped>
</style>
