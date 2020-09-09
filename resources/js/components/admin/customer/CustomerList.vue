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
                    <h3 class="card-title">Customer List</h3>
                    <el-form :inline="true" class="demo-form-inline">
                      <el-form-item>
                        <el-input v-model="query" placeholder="Search"></el-input>
                      </el-form-item>
                      <el-form-item>
                        <!-- <el-button type="primary">Search</el-button> -->
                      </el-form-item>
                    </el-form>
                  </div>
                </div>

                <el-table
                  ref="multipleTable"
                  :data="query != '' ? searchUsers.data : users.data"
                  style="width: 100%"
                  @selection-change="handleSelectionChange"
                >
                  <el-table-column type="selection" width="55"></el-table-column>
                  <el-table-column label="Date" width="120">
                    <template slot-scope="scope">{{ scope.row.created_at | timeFormat }}</template>
                  </el-table-column>
                  <el-table-column property="name" label="Name" width="120"></el-table-column>
                  <el-table-column property="email" label="Email" show-overflow-tooltip></el-table-column>
                  <el-table-column fixed="right" label="Operations">
                    <template slot-scope="scope">
                      <el-button @click="handleClick" type="primary" size="small">Detail</el-button>
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
                  :page-size="query != '' ? searchUsers.per_page : users.per_page"
                  :total="query != '' ? searchUsers.total : users.total"
                ></el-pagination>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "CustomerList",
  data() {
    return {
      multipleSelection: [],
      currentPage: 1,
      query: "",
    };
  },

  watch: {
    query(newValue, oldValue) {
      this.searchUser();
    },
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
    handleClick() {},
    searchUser() {
      this.$store.dispatch("user/searchUser", {
        query: this.query,
        currentPage: this.currentPage,
      });
    },
    userList() {
      this.$store.dispatch("user/userList", this.currentPage);
    },
    handleCurrentChange() {
      if (this.query != "") {
        this.$store.dispatch("user/searchUser", {
          query: this.query,
          currentPage: this.currentPage,
        });
      } else {
        this.$store.dispatch("user/userList", this.currentPage);
      }
    },
  },
  created() {
    this.userList();
  },
  computed: {
    users() {
      return this.$store.getters["user/userList"];
    },
    searchUsers() {
      return this.$store.getters["user/searchUsers"];
    },
  },
};
</script>

<style lang="scss" scoped>
</style>
