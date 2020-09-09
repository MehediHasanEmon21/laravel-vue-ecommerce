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
                    <h3 class="card-title">Product List</h3>
                    <router-link :to="{name: 'AddOrUpdateProduct'}" class="btn btn-info">
                      Add New
                      <i class="el-icon-plus el-icon-right"></i>
                    </router-link>
                  </div>
                  <el-button
                    v-if="multipleSelection.length > 0"
                    @click="multipleDelete"
                    type="danger"
                    size="small"
                  >Multiple Delete</el-button>
                </div>

                <el-table
                  ref="multipleTable"
                  :data="products.data"
                  style="width: 100%"
                  @selection-change="handleSelectionChange"
                >
                  <el-table-column type="selection" width="55"></el-table-column>
                  <el-table-column label="Date" width="120">
                    <template slot-scope="scope">{{ scope.row.created_at | timeFormat }}</template>
                  </el-table-column>
                  <el-table-column property="name" label="Name" width="120"></el-table-column>
                  <el-table-column label="Category" width="100">
                    <template slot-scope="scope">{{ scope.row.category.name }}</template>
                  </el-table-column>
                  <el-table-column label="Brand" width="100">
                    <template slot-scope="scope">{{ scope.row.brand.name }}</template>
                  </el-table-column>
                  <el-table-column property="price" label="Price" width="120"></el-table-column>
                  <el-table-column property="quantity" label="Quantity" width="120"></el-table-column>
                  <el-table-column fixed="right" label="Operations">
                    <template slot-scope="scope">
                      <router-link
                        class="btn btn-success btn-sm"
                        :to="{name: 'EditProduct',params: {id: scope.row.id}}"
                      >Edit</router-link>
                      <el-button @click="deleteProduct(scope.row)" type="danger" size="small">Delete</el-button>
                      <el-button
                        @click="detailProduct(scope.row)"
                        type="primary"
                        size="small"
                      >Details</el-button>
                    </template>
                  </el-table-column>
                </el-table>
                <br />
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
    <!-- Product Dialouge -->

    <el-dialog :title="product.name" :visible.sync="centerDialogVisible" width="80%" center>
      <table class="table table-stripped table-bordered">
        <tr>
          <td style="width: 30%">
            <strong>Category:</strong>
          </td>
          <td v-if="product.category">{{ product.category.name }}</td>
        </tr>
        <tr>
          <td style="width: 30%">
            <strong>Brand:</strong>
          </td>
          <td v-if="product.brand">{{ product.brand.name }}</td>
        </tr>
        <tr>
          <td style="width: 30%">
            <strong>Price:</strong>
          </td>
          <td>{{ product.price }}</td>
        </tr>
        <tr>
          <td style="width: 30%">
            <strong>Quantity:</strong>
          </td>
          <td>{{ product.quantity }}</td>
        </tr>
        <tr>
          <td style="width: 30%">
            <strong>Discount Price:</strong>
          </td>
          <td>{{ product.discount_price }}</td>
        </tr>
        <tr>
          <td style="width: 30%">
            <strong>Image:</strong>
          </td>
          <td>
            <img :src="`/uploads/${product.image}`" width="60px" height="60px" alt />
          </td>
        </tr>
        <tr>
          <td style="width: 30%">
            <strong>Color:</strong>
          </td>
          <td>
            <span v-for="(color,index) in product.color" :key="index">
              <input type="color" :value="color" />&nbsp;&nbsp;
            </span>
          </td>
        </tr>
        <tr>
          <td style="width: 30%">
            <strong>Size:</strong>
          </td>
          <td>
            <span v-for="(size,index) in product.size" :key="index">
              {{ size }}
              <template v-if="index != product.size.length - 1">,</template> &nbsp;&nbsp;
            </span>
          </td>
        </tr>
      </table>
    </el-dialog>
  </div>
</template>

<script>
export default {
  name: "ProductList",
  data() {
    return {
      multipleSelection: [],
      categoryDialouge: false,
      form: {
        name: "",
      },
      errors: {},
      currentPage: 1,
      product: {},
      centerDialogVisible: false,
    };
  },
  methods: {
    toggleSelection(rows) {
      if (rows) {
        rows.forEach((row) => {
          this.$refs.multipleTable.toggleRowSelection(row);
        });
      } else {
        this.$refs.multipleTable.clearSelection();
      }
    },

    detailProduct(row) {
      this.product = row;
      this.centerDialogVisible = true;
    },

    handleSelectionChange(val) {
      this.multipleSelection = val;
    },

    //handle pagination
    handleCurrentChange() {
      this.$store.dispatch("product/productList", this.currentPage);
    },
    productList() {
      this.$store.dispatch("product/productList", this.currentPage);
    },

    //delete category
    deleteProduct(product) {
      this.$store.dispatch("product/deleteProduct", product);
      this.$message({
        message: "Product Deleted Successfully",
        type: "success",
        center: false,
      });
    },

    //multiple delete
    multipleDelete() {
      axios
        .post("/admin/product/multi/delete", this.multipleSelection)
        .then(() => {
          this.$message({
            message: "Product Deleted Successfully",
            type: "success",
            center: false,
          });
          this.productList();
        });
    },
  },
  created() {
    this.productList();
  },
  computed: {
    products() {
      return this.$store.getters["product/productList"];
    },
  },
};
</script>

<style lang="scss" scoped>
</style>
