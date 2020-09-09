<template>
  <div id="UserRegister">
    <section class="pages login-page section-padding">
      <div class="container">
        <div class="row">
          <div class="col-sm-12">
            <div class="main-input padding60 new-customer">
              <div class="log-title">
                <h3>
                  <strong>new customers</strong>
                </h3>
              </div>
              <div class="custom-input">
                <form method="post" @submit.prevent="UserRegister">
                  <input type="text" v-model="form.name" placeholder="Name here.." />
                  <small style="color: red" v-if="errors['name']">{{ errors['name'][0] }}</small>
                  <input type="email" v-model="form.email" placeholder="Email Address.." />
                  <small style="color: red" v-if="errors['email']">{{ errors['email'][0] }}</small>
                  <input type="number" v-model="form.phone" placeholder="Phone Number.." />
                  <small style="color: red" v-if="errors['phone']">{{ errors['phone'][0] }}</small>
                  <input type="text" v-model="form.address" placeholder="Address.." />
                  <small style="color: red" v-if="errors['address']">{{ errors['address'][0] }}</small>
                  <input type="password" v-model="form.password" placeholder="Password" />
                  <small style="color: red" v-if="errors['password']">{{ errors['password'][0] }}</small>
                  <input
                    type="password"
                    v-model="form.password_confirmation"
                    placeholder="Confirm Password"
                  />
                  <!-- <label class="first-child">
                    <input type="radio" name="rememberme" value="forever" />
                    Sign up for our newsletter!
                  </label>-->
                  <div class="submit-text coupon">
                    <button type="submit">Register</button>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
</template>

<script>
export default {
  name: "UserRegister",
  data() {
    return {
      errors: {},
      form: {},
    };
  },
  methods: {
    UserRegister() {
      axios
        .post("/register", this.form)
        .then((res) => {
          this.$router.push({ name: "UserDashboard" });
          this.$message({
            message: "Logged out successfully",
            type: "success",
          });
        })
        .catch((err) => {
          this.errors = err.response.data.errors;
        });
    },
  },
};
</script>

<style scoped>
</style>
