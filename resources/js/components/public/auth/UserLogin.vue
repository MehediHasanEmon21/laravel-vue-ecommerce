<template>
  <div id="UserLogin">
    <section class="pages login-page section-padding">
      <div class="container">
        <div class="row">
          <div class="col-sm-12">
            <div class="main-input padding60">
              <div class="log-title">
                <h3>
                  <strong>registered customers</strong>
                </h3>
              </div>
              <div class="login-text">
                <div class="custom-input">
                  <p>If you have an account with us, Please log in!</p>
                  <form action="mail.php" method="post" @submit.prevent="userLogin">
                    <input type="email" v-model="form.email" placeholder="Email" />
                    <small style="color: red" v-if="errors['email']">{{ errors['email'][0] }}</small>
                    <input type="password" v-model="form.password" placeholder="Password" />
                    <small style="color: red" v-if="errors['password']">{{ errors['password'][0] }}</small>
                    <!-- <a class="forget" href="#">Forget your password?</a> -->
                    <div class="submit-text">
                      <button type="submit">login</button>
                    </div>
                  </form>
                </div>
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
  name: "UserLogin",
  data() {
    return {
      form: {},
      errors: {},
    };
  },
  methods: {
    userLogin() {
      axios
        .post("/login", this.form)
        .then((result) => {
          localStorage.setItem("userLoggedIn", true);
          this.$router.push({ name: "UserDashboard" });
          this.$message({
            message: "Logged in successfully",
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
