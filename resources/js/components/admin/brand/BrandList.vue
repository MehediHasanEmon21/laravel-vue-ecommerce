<template>
  <div id="Brand_list">
    <div class="content-wrapper">
      <div class="content">
        <div class="container-fluid">
          <div class="row">
            <div class="col-12">
              <div class="card">
                <div class="card-header border-0">
                  <div class="d-flex justify-content-between">
                    <h3 class="card-title">Brand List</h3>
                    <el-button @click="OpenModal" type="primary" round>
                      Add New
                      <i class="el-icon-plus el-icon-right"></i>
                    </el-button>
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
                  :data="brands.data"
                  style="width: 100%"
                  @selection-change="handleSelectionChange"
                >
                  <el-table-column type="selection" width="55"></el-table-column>
                  <el-table-column label="Date" width="120">
                    <template slot-scope="scope">{{ scope.row.created_at | timeFormat }}</template>
                  </el-table-column>
                  <el-table-column property="name" label="Name" width="120"></el-table-column>
                  <el-table-column fixed="right" label="Operations">
                    <template slot-scope="scope">
                      <el-button type="success" @click="editBrand(scope.row)" size="small">Edit</el-button>
                      <el-button @click="deleteBrand(scope.row)" type="danger" size="small">Delete</el-button>
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
                  :page-size="brands.per_page"
                  :total="brands.total"
                ></el-pagination>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <el-dialog
      :title="form.id ? 'Edit Brand' : 'Add New Brand'"
      :visible.sync="brandDialouge"
      width="50%"
      center
    >
      <span>
        <el-form
          label-width="120px"
          @submit.prevent.native="!form.id ? addNewBrand() : updateBrand()"
        >
          <el-form-item label="Brand Name">
            <el-input v-model="form.name" :placeholder="form.id ? 'Edit Brand' : 'Add New Brand'"></el-input>
            <font style="color: red" v-if="errors['name']">{{ errors['name'][0] }}</font>
          </el-form-item>
        </el-form>
      </span>
      <span slot="footer" class="dialog-footer">
        <el-button @click="brandList">Cancel</el-button>
        <el-button type="primary" v-if="!form.id" @click.prevent="addNewBrand">Save</el-button>
        <el-button type="primary" v-else @click.prevent="updateBrand">Edit</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
export default {
  name: "BrandList",
  data() {
    return {
      multipleSelection: [],
      brandDialouge: false,
      form: {
        name: "",
      },
      errors: {},
      currentPage: 1,
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

    handleSelectionChange(val) {
      this.multipleSelection = val;
    },

    //Brand list
    brandList() {
      this.brandDialouge = false;
      this.$store.dispatch("brand/brandList", this.currentPage);
    },

    //add new Brand
    addNewBrand() {
      axios
        .post("/admin/brand", this.form)
        .then(() => {
          this.$message({
            message: "Brand Added Successfully",
            type: "success",
            center: false,
          });
          this.clear();
          this.brandList();
          this.brandDialouge = false;
        })
        .catch((err) => {
          this.errors = err.response.data.errors;
        });
    },

    //edit Brand
    editBrand(brand) {
      this.brandDialouge = true;
      this.form = brand;
    },
    updateBrand() {
      axios
        .put("/admin/brand/" + this.form.id, this.form)
        .then(() => {
          this.$message({
            message: "Brand Update Successfully",
            type: "success",
            center: false,
          });

          this.clear();
          this.brandList();
          this.brandDialouge = false;
        })
        .catch((err) => {
          this.errors = err.response.data.errors;
        });
    },

    //delete Brand
    deleteBrand(brand) {
      this.$store.dispatch("brand/deleteBrand", brand);
      this.$message({
        message: "Brand Deleted Successfully",
        type: "success",
        center: false,
      });
    },

    //multiple delete
    multipleDelete() {
      axios
        .post("/admin/brand/multi/delete", this.multipleSelection)
        .then(() => {
          this.$message({
            message: "Brand Deleted Successfully",
            type: "success",
            center: false,
          });
          this.brandList();
        });
    },

    //helper function
    OpenModal() {
      this.brandDialouge = true;
      this.clear();
    },
    clear() {
      this.errors = {};
      this.form = {};
    },

    //handle pagination
    handleCurrentChange() {
      this.$store.dispatch("brand/brandList", this.currentPage);
    },
  },
  created() {
    this.brandList();
  },
  computed: {
    brands() {
      return this.$store.getters["brand/brandList"];
    },
  },
};
</script>

<style lang="scss" scoped>
</style>
