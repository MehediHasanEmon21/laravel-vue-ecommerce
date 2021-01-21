<template>
  <div id="public_master">
    <!-- header section start -->
    <public-header></public-header>
    <public-bread-crum v-if="$route.name != 'Home'"></public-bread-crum>
    <!-- header section end -->
    <!-- slider-section-start -->
    <router-view></router-view>
    <!-- quick view end -->
    <!-- footer section start -->
    <public-footer></public-footer>
    <!-- footer section end -->
  </div>
</template>

<script>
import PublicHeader from "./inc/PublicHeader";
import PublicFooter from "./inc/PublicFooter";
import PublicBreadCrum from "./inc/PublicBreadCrum";
export default {
  name: "PublicMaster",
  components: {
    PublicHeader,
    PublicFooter,
    PublicBreadCrum,
  },
};
</script>
