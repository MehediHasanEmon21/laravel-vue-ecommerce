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
                    <h3 class="card-title">Order List</h3>
                  </div>
                </div>

                <el-table
                  ref="multipleTable"
                  :data="orders.data"
                  style="width: 100%"
                  @selection-change="handleSelectionChange"
                >
                  <el-table-column
                    type="selection"
                    width="55"
                  ></el-table-column>
                  <el-table-column label="Date" width="120">
                    <template slot-scope="scope">{{
                      scope.row.created_at | timeFormat
                    }}</template>
                  </el-table-column>
                  <el-table-column
                    property="payment_type"
                    label="Payment Type"
                    width="120"
                  ></el-table-column>
                  <el-table-column
                    property="status"
                    label="Status"
                    show-overflow-tooltip
                  ></el-table-column>
                  <el-table-column fixed="right" label="Operations">
                    <template slot-scope="scope">
                      <el-button
                        @click="orderDetail(scope.row.id)"
                        type="primary"
                        size="small"
                        >Detail</el-button
                      >
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
                  :page-size="orders.per_page"
                  :total="orders.total"
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
    orderDetail(id) {
      this.$router.push({ name: "OrderDetail", params: { order_id: id } });
    },
    orderList() {
      this.$store.dispatch("order/orderList", this.currentPage);
    },

    handleCurrentChange() {
      this.$store.dispatch("order/orderList", this.currentPage);
    },
  },
  created() {
    this.orderList();
  },
  computed: {
    orders() {
      return this.$store.getters["order/orderList"];
    },
  },
};
</script>

<style lang="scss" scoped>
</style>
