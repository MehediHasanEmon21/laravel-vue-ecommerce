<template>
  <div id="category_list">
    <div class="content-wrapper">
      <div class="content">
        <div class="container-fluid">
          <div class="row">
            <div class="col-12">
              <div class="card">
                <div class="card-header border-0">
                  <div class="d-flex justify-content-between">
                    <h3 class="card-title">Category List</h3>
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
                  :data="categories.data"
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
                      <el-button type="success" @click="editCategory(scope.row)" size="small">Edit</el-button>
                      <el-button
                        @click="deleteCategory(scope.row)"
                        type="danger"
                        size="small"
                      >Delete</el-button>
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
                  :page-size="categories.per_page"
                  :total="categories.total"
                ></el-pagination>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <el-dialog
      :title="form.id ? 'Edit Category' : 'Add New Category'"
      :visible.sync="categoryDialouge"
      width="50%"
      center
    >
      <span>
        <el-form
          label-width="120px"
          @submit.prevent.native="!form.id ? addNewCategory() : updateCategory()"
        >
          <el-form-item label="Category Name">
            <el-input
              v-model="form.name"
              :placeholder="form.id ? 'Edit Category' : 'Add New Category'"
            ></el-input>
            <font style="color: red" v-if="errors['name']">{{ errors['name'][0] }}</font>
          </el-form-item>
        </el-form>
      </span>
      <span slot="footer" class="dialog-footer">
        <el-button @click="categoryList">Cancel</el-button>
        <el-button type="primary" v-if="!form.id" @click.prevent="addNewCategory">Save</el-button>
        <el-button type="primary" v-else @click.prevent="updateCategory">Edit</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
export default {
  name: "CategoryList",
  data() {
    return {
      multipleSelection: [],
      categoryDialouge: false,
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

    //category list
    categoryList() {
      this.categoryDialouge = false;
      this.$store.dispatch("category/categoryList", this.currentPage);
    },

    //add new category
    addNewCategory() {
      axios
        .post("/admin/category", this.form)
        .then(() => {
          this.$message({
            message: "Category Added Successfully",
            type: "success",
            center: false,
          });
          this.clear();
          this.categoryList();
          this.categoryDialouge = false;
        })
        .catch((err) => {
          this.errors = err.response.data.errors;
        });
    },

    //edit category
    editCategory(category) {
      this.categoryDialouge = true;
      this.form = category;
    },
    updateCategory() {
      axios
        .put("/admin/category/" + this.form.id, this.form)
        .then(() => {
          this.$message({
            message: "Category Update Successfully",
            type: "success",
            center: false,
          });

          this.clear();
          this.categoryList();
          this.categoryDialouge = false;
        })
        .catch((err) => {
          this.errors = err.response.data.errors;
        });
    },

    //delete category
    deleteCategory(category) {
      this.$store.dispatch("category/deleteCategory", category);
      this.$message({
        message: "Category Deleted Successfully",
        type: "success",
        center: false,
      });
    },

    //multiple delete
    multipleDelete() {
      axios
        .post("/admin/category/multi/delete", this.multipleSelection)
        .then(() => {
          this.$message({
            message: "Category Deleted Successfully",
            type: "success",
            center: false,
          });
          this.categoryList();
        });
    },

    //helper function
    OpenModal() {
      this.categoryDialouge = true;
      this.clear();
    },
    clear() {
      this.errors = {};
      this.form = {};
    },

    //handle pagination
    handleCurrentChange() {
      this.$store.dispatch("category/categoryList", this.currentPage);
    },
  },
  created() {
    this.categoryList();
  },
  computed: {
    categories() {
      return this.$store.getters["category/categoryList"];
    },
  },
};
</script>

<style lang="scss" scoped>
</style>
