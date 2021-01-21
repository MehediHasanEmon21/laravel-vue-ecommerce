<template>
  <div id="admin_dashboard">
    <div class="content-wrapper" style="min-height: 314px">
      <!-- Content Header (Page header) -->
      <div class="content-header">
        <div class="container-fluid">
          <div class="row mb-2">
            <div class="col-sm-6">
              <h1 class="m-0">Dashboard</h1>
            </div>
            <!-- /.col -->
            <div class="col-sm-6">
              <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="#">Home</a></li>
                <li class="breadcrumb-item active">Dashboard v1</li>
              </ol>
            </div>
            <!-- /.col -->
          </div>
          <!-- /.row -->
        </div>
        <!-- /.container-fluid -->
      </div>
      <!-- /.content-header -->

      <!-- Main content -->
      <section class="content">
        <div class="container-fluid">
          <!-- Small boxes (Stat box) -->
          <div class="row">
            <div class="col-lg-3 col-6">
              <!-- small box -->
              <div class="small-box bg-info">
                <div class="inner">
                  <h3>{{ dashboard.pending_order }}</h3>

                  <p>New Orders</p>
                </div>
                <div class="icon">
                  <i class="ion ion-bag"></i>
                </div>
                <router-link
                  :to="{ name: 'OrderList' }"
                  class="small-box-footer"
                  >More info <i class="fas fa-arrow-circle-right"></i
                ></router-link>
              </div>
            </div>
            <!-- ./col -->
            <div class="col-lg-3 col-6">
              <!-- small box -->
              <div class="small-box bg-success">
                <div class="inner">
                  <h3>{{ dashboard.success_order }}</h3>

                  <p>Delivered Order</p>
                </div>
                <div class="icon">
                  <i class="ion ion-stats-bars"></i>
                </div>
                <router-link
                  :to="{ name: 'OrderList' }"
                  class="small-box-footer"
                  >More info <i class="fas fa-arrow-circle-right"></i
                ></router-link>
              </div>
            </div>
            <!-- ./col -->
            <div class="col-lg-3 col-6">
              <!-- small box -->
              <div class="small-box bg-warning">
                <div class="inner">
                  <h3>{{ dashboard.order }}</h3>

                  <p>Total Order</p>
                </div>
                <div class="icon">
                  <i class="ion ion-person-add"></i>
                </div>
                <router-link
                  :to="{ name: 'OrderList' }"
                  class="small-box-footer"
                  >More info <i class="fas fa-arrow-circle-right"></i
                ></router-link>
              </div>
            </div>
            <!-- ./col -->
            <div class="col-lg-3 col-6">
              <!-- small box -->
              <div class="small-box bg-danger">
                <div class="inner">
                  <h3>{{ dashboard.user }}</h3>

                  <p>Customer</p>
                </div>
                <div class="icon">
                  <i class="ion ion-pie-graph"></i>
                </div>
                <router-link
                  :to="{ name: 'CustomerList' }"
                  class="small-box-footer"
                  >More info <i class="fas fa-arrow-circle-right"></i
                ></router-link>
              </div>
            </div>

            <div class="col-lg-3 col-6">
              <!-- small box -->
              <div class="small-box bg-warning">
                <div class="inner">
                  <h3>{{ dashboard.category }}</h3>

                  <p>Total Category</p>
                </div>
                <div class="icon">
                  <i class="ion ion-person-add"></i>
                </div>
                <router-link
                  :to="{ name: 'CategoryList' }"
                  class="small-box-footer"
                  >More info <i class="fas fa-arrow-circle-right"></i
                ></router-link>
              </div>
            </div>
            <div class="col-lg-3 col-6">
              <!-- small box -->
              <div class="small-box bg-info">
                <div class="inner">
                  <h3>{{ dashboard.product }}</h3>

                  <p>Total Product</p>
                </div>
                <div class="icon">
                  <i class="ion ion-bag"></i>
                </div>
                <router-link
                  :to="{ name: 'ProductList' }"
                  class="small-box-footer"
                  >More info <i class="fas fa-arrow-circle-right"></i
                ></router-link>
              </div>
            </div>
            <div class="col-lg-3 col-6">
              <div class="small-box bg-success">
                <div class="inner">
                  <h3>{{ dashboard.brand }}</h3>

                  <p>Total Brand</p>
                </div>
                <div class="icon">
                  <i class="ion ion-stats-bars"></i>
                </div>
                <router-link
                  :to="{ name: 'BrandList' }"
                  class="small-box-footer"
                  >More info <i class="fas fa-arrow-circle-right"></i
                ></router-link>
              </div>
            </div>
            <!-- ./col -->
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
  name: "AdminDashboard",
  data() {
    return {
      user: this.$store.state.user,
      dashboard: {},
    };
  },
  created() {
    axios
      .get("/admin/admin-dashboard-info")
      .then((result) => {
        this.dashboard = result.data;
      })
      .catch((err) => {});
  },
};
</script>

<style scoped>
</style>
