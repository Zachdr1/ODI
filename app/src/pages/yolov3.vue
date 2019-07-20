<template>
  <q-page padding>
    <div class="col">
      <div class="row">
      Upload an image for processing.
      </div>
      <div class="row">
        <q-uploader
          url="/detection_service/detect"
          style="max-width: 265px"
          @finish="finishedUpload"
        />
      </div>
    </div>
  </q-page>
</template>

<script>
export default {
  // name: 'PageName',
  data() {
    return {
      route: "/yolov3",
      yoloImageUrl: "/detection_service/results"
    }
  },
  methods: {
    // init() {
    //   this.$store.dispatch("main/updateRoute", this.route)
    //   this.$store.dispatch("main/updateImageUrl", this.yoloImageUrl)
    // },
    finishedUpload() {
      console.log('finished uploading')
      var d = new Date();
      this.$store.dispatch('main/updateImageUrl', this.yoloImageUrl + '?t=' + d.getTime())
      console.log(this.$store.state.main.imageUrl)
    }
  },
  mounted() {
    // self.init()
  },
}
</script>

<style>
</style>
