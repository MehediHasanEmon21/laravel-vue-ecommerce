<template>
  <div id="user_dashboard">
    <h2>User Dashboard</h2>
    <p>{{user}}</p>
  </div>
</template>

<script>
export default {
  name: "UserDashboard",
  computed: {
    user() {
      return this.$store.getters["user/getUser"];
    },
  },
  methods: {
    getUser() {
      this.$store.dispatch("user/getUser");
    },
  },

  created() {
    this.getUser();
  },
};
</script>

<style lang="scss" scoped>
</style>
