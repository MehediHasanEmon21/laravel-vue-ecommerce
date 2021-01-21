<template>
  <div class="sidebar left-sidebar">
    <div class="s-side-text">
      <div class="sidebar-title clearfix">
        <h4 class="floatleft">Categories</h4>
        <h5 class="floatright">
          <a href="#">All</a>
        </h5>
      </div>
      <div class="categories left-right-p">
        <ul id="accordion" class="panel-group clearfix">
          <li
            class="panel"
            v-for="category in sidebars.categories"
            :key="category.id"
          >
            <div
              data-toggle="collapse"
              data-parent="#accordion"
              data-target="#collapse1"
            >
              <div
                class="medium-a"
                @click.prevent="ProductFilter(category.id, 'category_id')"
              >
                {{ category.name }}
              </div>
            </div>
          </li>
        </ul>
      </div>
    </div>
    <div class="s-side-text">
      <div class="sidebar-title">
        <h4>price</h4>
      </div>
      <div class="range-slider clearfix">
        <form action="#" method="get">
          <label>
            <span>You range</span>
          </label>
          <div class="block" v-if="sidebars.price">
            <el-slider
              @change="ProductFilter('', 'price')"
              v-model="value"
              range
              :min="sidebars.price.min_price"
              :max="sidebars.price.max_price"
            ></el-slider>
          </div>
        </form>
      </div>
    </div>
    <div class="s-side-text">
      <div class="sidebar-title clearfix">
        <h4 class="floatleft">size</h4>
        <h5 class="floatright">
          <a href="#">All</a>
        </h5>
      </div>
      <div class="size-select clearfix">
        <a
          v-for="(size, index) in jsonData.size"
          :key="index"
          href="#"
          @click.prevent="ProductFilter(size.value, 'size')"
          >{{ size.value }}</a
        >
      </div>
    </div>
    <div class="s-side-text">
      <div class="sidebar-title clearfix">
        <h4 class="floatleft">color</h4>
        <h5 class="floatright">
          <a href="#">All</a>
        </h5>
      </div>
      <div class="color-select clearfix">
        <span
          v-for="(color, index) in jsonData.color"
          :key="index"
          :style="`background: ${color.value}`"
          :title="color.label"
          @click.prevent="ProductFilter(color.value.substring(1), 'color')"
        ></span>
      </div>
    </div>
    <div class="s-side-text">
      <div class="sidebar-title clearfix">
        <h4 class="floatleft">brands</h4>
        <h5 class="floatright">
          <a href="#">All</a>
        </h5>
      </div>
      <div class="brands-select clearfix">
        <ul>
          <li v-for="(chunk, index) in brands" :key="index">
            <a
              href="#"
              @click.prevent="ProductFilter(brand.id, 'brand_id')"
              v-for="brand in chunk"
              :key="brand.id"
              >{{ brand.name }}</a
            >
          </li>
        </ul>
      </div>
    </div>
  </div>
</template>

<script>
import jsonForm from "../../../common/helper/form";
export default {
  name: "ProductSidebar",
  data() {
    return {
      jsonData: jsonForm.options,
      value: [0, 1000],
      form: {
        data: "",
        field: "",
      },
    };
  },
  methods: {
    productSidebarInfo() {
      this.$store.dispatch("product/productSidebarInfo");
    },
    ProductFilter(data, field) {
      if (data === "") {
        this.form.data = this.value;
      } else {
        this.form.data = data;
      }

      this.form.field = field;
      this.$store.dispatch("product/ProductFilter", JSON.stringify(this.form));
    },
  },
  created() {
    this.productSidebarInfo();
  },
  computed: {
    sidebars() {
      return this.$store.getters["product/productSidebarInfo"];
    },
    brands() {
      return _.chunk(this.sidebars.brands, 2);
    },
  },
};
</script>

<style lang="scss" scoped>
</style>
