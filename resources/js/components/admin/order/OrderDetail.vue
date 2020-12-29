<template>
  <div id="order_detail">
    <div class="content-wrapper">
      <!-- Content Header (Page header) -->
      <section class="content-header">
        <div class="container-fluid">
          <div class="row mb-2">
            <div class="col-sm-6">
              <h1>Invoice</h1>
            </div>
            <div class="col-sm-6">
              <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="#">Home</a></li>
                <li class="breadcrumb-item active">Invoice</li>
              </ol>
            </div>
          </div>
        </div>
        <!-- /.container-fluid -->
      </section>

      <section class="content">
        <div class="container-fluid">
          <div class="row">
            <div class="col-12">
              <!-- Main content -->
              <div class="invoice p-3 mb-3">
                <!-- title row -->
                <div class="row">
                  <div class="col-12">
                    <h4>
                      <i class="fas fa-globe"></i> AdminLTE, Inc.
                      <small class="float-right">Date: 2/10/2014</small>
                    </h4>
                  </div>
                  <!-- /.col -->
                </div>
                <!-- info row -->
                <div class="row invoice-info">
                  <div class="col-sm-4 invoice-col">
                    From
                    <address>
                      <strong>Admin, Inc.</strong><br />
                      795 Folsom Ave, Suite 600<br />
                      San Francisco, CA 94107<br />
                      Phone: (804) 123-5432<br />
                      Email: info@almasaeedstudio.com
                    </address>
                  </div>
                  <!-- /.col -->
                  <div class="col-sm-4 invoice-col">
                    To
                    <address>
                      <strong>{{ shipping_address.name }}</strong
                      ><br />
                      {{ shipping_address.address }}<br />
                      Phone: {{ shipping_address.phone }}<br />
                      Email: {{ shipping_address.email }}
                    </address>
                  </div>
                  <!-- /.col -->
                  <div class="col-sm-4 invoice-col">
                    <b>Invoice #{{order.id}}</b><br />
                    <br />

                  </div>
                  <!-- /.col -->
                </div>
                <!-- /.row -->

                <!-- Table row -->
                <div class="row">
                  <div class="col-12 table-responsive">
                    <table class="table table-striped">
                      <thead>
                        <tr>
                          <thSL</th>
                          <th>Qty</th>
                          <th>Product</th>
                          <th>Price</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr v-for="(item,index) in order.order_items" :key="item.id">
                          <td>{{ index+1 }}</td>
                          <td>{{item.item_quantity}}</td>
                          <td>{{item.item_name}}</td>
                          <td>${{item.item_price}}</td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                  <!-- /.col -->
                </div>
                <!-- /.row -->

                <div class="row">
                  <!-- accepted payments column -->
                  <div class="col-6">



                  </div>
                  <!-- /.col -->
                  <div class="col-6">
                    <p class="lead">Created Date: {{order.created_at | timeFormat}}</p>

                    <div class="table-responsive">
                      <table class="table">

                        <tr>
                          <th>Total:</th>
                          <td>${{order.total}}</td>
                        </tr>
                      </table>
                    </div>
                  </div>
                  <!-- /.col -->
                </div>
                <!-- /.row -->


              </div>
              <!-- /.invoice -->
            </div>
            <!-- /.col -->
          </div>
          <!-- /.row -->
        </div>
        <!-- /.container-fluid -->
      </section>
      <!-- /.content -->
    </div>
  </div>
</template>

<script>
export default {
  name: "OrderDetail",
  data() {
    return {};
  },

  methods: {
    singleOrder() {
      this.$store.dispatch("order/order", this.$route.params.order_id);
    },
  },
  created() {
    this.singleOrder();
  },
  computed: {
    order() {
      return this.$store.getters["order/order"];
    },
    shipping_address() {
      return this.order.shipping_address
        ? JSON.parse(this.order.shipping_address)
        : "";
    },
  },
};
</script>

<style lang="scss" scoped>
</style>
