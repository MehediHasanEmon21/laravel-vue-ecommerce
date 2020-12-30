<template>
  <div id="user_dashboard" class="container">
    <table class="table table-dark">
      <thead>
        <tr>
          <th scope="col">SL</th>
          <th scope="col">Payment Type</th>
          <th scope="col">Total</th>
          <th scope="col">Action</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="(item, index) in orders.data" :key="item.index">
          <td>{{ index + 1 }}</td>
          <td>{{ item.payment_type }}</td>
          <td>{{ item.total }}</td>
          <td><a href="" class="btn btn-sm btn-success">Detail</a></td>
        </tr>
      </tbody>
    </table>
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
</template>

<script>
export default {
  name: "UserDashboard",

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
      this.$store.dispatch("order/userOrderList", this.currentPage);
    },

    handleCurrentChange() {
      this.$store.dispatch("order/userOrderList", this.currentPage);
    },
    getUser() {
      this.$store.dispatch("user/getUser");
    },
  },
  created() {
    this.orderList();
    this.getUser();
  },
  computed: {
    orders() {
      return this.$store.getters["order/orderList"];
    },
    user() {
      return this.$store.getters["user/getUser"];
    },
  },
};
</script>

<style lang="scss" scoped>
</style>
