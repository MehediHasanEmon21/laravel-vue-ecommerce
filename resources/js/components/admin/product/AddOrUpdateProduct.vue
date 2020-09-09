<template>
  <div id="product_list">
    <div class="content-wrapper">
      <div class="content">
        <div class="container-fluid">
          <div class="row">
            <div class="col-12">
              <div class="card">
                <div class="card-header border-0">
                  <div class="d-flex justify-content-between">
                    <h3 class="card-title" v-if="form.id">Add Product</h3>
                    <h3 class="card-title" v-else>Edit Product</h3>

                    <router-link :to="{name: 'ProductList'}" class="btn btn-success">All Product</router-link>
                  </div>
                </div>
                <div class="card-body">
                  <el-form ref="form" :model="form">
                    <el-form-item label="Product name">
                      <el-input v-model="form.name"></el-input>
                      <font style="color: red" v-if="errors['name']">{{ errors['name'][0] }}</font>
                    </el-form-item>

                    <el-form-item label="Category">
                      <el-select v-model="form.category_id" placeholder="select Category">
                        <el-option
                          v-for="category in categories"
                          :key="category.id"
                          :label="category.name"
                          :value="category.id"
                        ></el-option>
                      </el-select>
                      <font
                        style="color: red"
                        v-if="errors['category_id']"
                      >{{ errors['category_id'][0] }}</font>
                    </el-form-item>

                    <el-form-item label="Brand">
                      <el-select v-model="form.brand_id" placeholder="select Brand">
                        <el-option
                          v-for="brand in brands"
                          :key="brand.id"
                          :label="brand.name"
                          :value="brand.id"
                        ></el-option>
                      </el-select>
                      <font style="color: red" v-if="errors['brand_id']">{{ errors['brand_id'][0] }}</font>
                    </el-form-item>

                    <el-form-item label="Color" prop="type">
                      <el-checkbox-group v-model="form.color">
                        <el-checkbox
                          v-for="color in options.options.color"
                          :key="color.value"
                          :label="color.value"
                          name="type"
                        >{{ color.label }}</el-checkbox>
                      </el-checkbox-group>
                      <font style="color: red" v-if="errors['color']">{{ errors['color'][0] }}</font>
                    </el-form-item>

                    <el-form-item label="Size" prop="type">
                      <el-checkbox-group v-model="form.size">
                        <el-checkbox
                          v-for="size in options.options.size"
                          :key="size.value"
                          :label="size.value"
                          name="type"
                        >{{ size.label }}</el-checkbox>
                      </el-checkbox-group>
                      <font style="color: red" v-if="errors['size']">{{ errors['size'][0] }}</font>
                    </el-form-item>

                    <el-form-item label="Price">
                      <el-input type="number" v-model="form.price"></el-input>
                      <font style="color: red" v-if="errors['price']">{{ errors['price'][0] }}</font>
                    </el-form-item>

                    <el-form-item label="Discount Price">
                      <el-input type="number" v-model="form.discount_price"></el-input>
                      <font
                        style="color: red"
                        v-if="errors['discount_price']"
                      >{{ errors['discount_price'][0] }}</font>
                    </el-form-item>

                    <el-form-item label="Quantity">
                      <el-input type="number" v-model="form.quantity"></el-input>
                      <font style="color: red" v-if="errors['quantity']">{{ errors['quantity'][0] }}</font>
                    </el-form-item>

                    <el-form-item label="Description">
                      <el-input type="textarea" v-model="form.description"></el-input>
                      <font
                        style="color: red"
                        v-if="errors['description']"
                      >{{ errors['description'][0] }}</font>
                    </el-form-item>

                    <el-form-item label="Image">
                      <input type="file" @change="handleImage" class="form-control" />
                      <font style="color: red" v-if="errors['image']">{{ errors['image'][0] }}</font>
                      <img
                        v-if="form.id"
                        :src="`/uploads/${product.image}`"
                        width="80px"
                        height="80px"
                        alt
                      />
                    </el-form-item>
                  </el-form>
                  <el-button @click.prevent="addOrUpdateProduct" type="primary">Submit</el-button>
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
import jsonOptions from "../../../common/helper/form";
export default {
  name: "AddOrUpdateProduct",
  data() {
    return {
      options: jsonOptions,
      errors: {},
      form: {
        color: [],
        size: [],
        image: "",
        name: "",
        category_id: "",
        brand_id: "",
        price: "",
        discount_price: "",
        quantity: "",
        description: "",
      },
    };
  },
  methods: {
    allCategory() {
      this.$store.dispatch("category/allCategory");
    },
    allBrand() {
      this.$store.dispatch("brand/allBrand");
    },
    addOrUpdateProduct() {
      if (this.form.id) {
        this.updateProduct();
      } else {
        this.addProduct();
      }
    },
    updateProduct() {
      let formData = new FormData();
      formData.append("name", this.form.name);
      formData.append("category_id", this.form.category_id);
      formData.append("brand_id", this.form.brand_id);
      formData.append("price", this.form.price);
      formData.append("discount_price", this.form.discount_price);
      formData.append("description", this.form.description);
      formData.append("image", this.form.image);
      formData.append("color", this.form.color);
      formData.append("size", this.form.size);
      formData.append("quantity", this.form.quantity);
      axios
        .post(`/admin/product-update/${this.$route.params.id}`, formData)
        .then((result) => {
          this.$router.push({ name: "ProductList" });
          this.$message({
            message: "Product Updated Successfully",
            type: "success",
            center: false,
          });
        })
        .catch((err) => {
          this.errors = err.response.data.errors;
        });
    },
    addProduct() {
      let formData = new FormData();
      formData.append("name", this.form.name);
      formData.append("category_id", this.form.category_id);
      formData.append("brand_id", this.form.brand_id);
      formData.append("price", this.form.price);
      formData.append("discount_price", this.form.discount_price);
      formData.append("description", this.form.description);
      formData.append("image", this.form.image);
      formData.append("color", this.form.color);
      formData.append("size", this.form.size);
      formData.append("quantity", this.form.quantity);
      axios
        .post("/admin/product", formData)
        .then((result) => {
          this.$router.push({ name: "ProductList" });
          this.$message({
            message: "Product Added Successfully",
            type: "success",
            center: false,
          });
        })
        .catch((err) => {
          this.errors = err.response.data.errors;
        });
    },
    handleImage(e) {
      this.form.image = e.target.files[0];
    },
    getSingleProduct() {
      this.$store.dispatch("product/getSingleProduct", this.$route.params.id);
    },
  },
  created() {
    this.allCategory();
    this.allBrand();
    if (this.$route.params.id) {
      this.getSingleProduct();
    }
  },
  computed: {
    categories() {
      return this.$store.getters["category/allCategory"];
    },
    brands() {
      return this.$store.getters["brand/allBrand"];
    },
    product() {
      return this.$store.getters["product/getSingleProduct"];
    },
  },
  watch: {
    product() {
      this.form = this.product;
    },
  },
};
</script>

<style lang="scss" scoped>
</style>

