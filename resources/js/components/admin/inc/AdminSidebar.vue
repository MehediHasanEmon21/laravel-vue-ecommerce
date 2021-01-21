<template>
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <router-link :to="{ name: 'AdminDashboard' }" class="brand-link">
      <!-- <img
        src="dist/img/AdminLTELogo.png"
        alt="AdminLTE Logo"
        class="brand-image img-circle elevation-3"
        style="opacity: .8"
      />-->
      <span class="brand-text font-weight-light">AdminLTE 3</span>
    </router-link>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img
            src="/assets/admin/default_avatar.png"
            class="img-circle elevation-2"
            alt="User Image"
          />
        </div>
        <div class="info">
          <router-link :to="{ name: 'AdminDashboard' }" class="d-block">{{
            admin.name
          }}</router-link>
        </div>
      </div>

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul
          class="nav nav-pills nav-sidebar flex-column"
          data-widget="treeview"
          role="menu"
          data-accordion="false"
        >
          <!-- Add icons to the links using the .nav-icon class
          with font-awesome or any other icon font library-->
          <li class="nav-item has-treeview menu-open">
            <router-link :to="{ name: 'AdminDashboard' }" class="nav-link">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>Dashboard</p>
            </router-link>
          </li>
          <li class="nav-item has-treeview menu-open">
            <router-link :to="{ name: 'CategoryList' }" class="nav-link">
              <i class="nav-icon fas fa-copy"></i>
              <p>Category</p>
            </router-link>
          </li>
          <li class="nav-item has-treeview menu-open">
            <router-link :to="{ name: 'BrandList' }" class="nav-link">
              <i class="nav-icon fas fa-business-time"></i>
              <p>Brand</p>
            </router-link>
          </li>

          <li class="nav-item has-treeview menu-open">
            <router-link :to="{ name: 'ProductList' }" class="nav-link">
              <i class="nav-icon fab fa-empire"></i>
              <p>Product</p>
            </router-link>
          </li>

          <li class="nav-item has-treeview menu-open">
            <router-link :to="{ name: 'CustomerList' }" class="nav-link">
              <i class="nav-icon fas fa-user"></i>
              <p>Customer</p>
            </router-link>
          </li>

          <li class="nav-item has-treeview menu-open">
            <router-link :to="{ name: 'OrderList' }" class="nav-link">
              <i class="nav-icon fas fa-shopping-cart"></i>
              <p>Order</p>
            </router-link>
          </li>
          <li style="cursor: pointer" class="nav-item has-treeview menu-open">
            <a @click.prevent="adminLogout" class="nav-link">
              <i class="nav-icon fas fa-sign-out-alt"></i>
              <p>
                Logout
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
          </li>
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>
</template>

<script>
export default {
  name: "AdminSidebar",
  methods: {
    adminLogout() {
      axios
        .get("/admin/logout")
        .then((result) => {
          localStorage.removeItem("AdminLoggedIn");
          this.$router.push({ name: "AdminLogin" });
        })
        .catch((err) => {});
    },
    getAuthAdmin() {
      this.$store.dispatch("admin/getUser");
    },
  },
  computed: {
    admin() {
      return this.$store.getters["admin/getUser"];
    },
  },
  created() {
    this.getAuthAdmin();
  },
};
</script>

<style scoped>
</style>
