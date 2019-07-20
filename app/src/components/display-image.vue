<template>
  <q-img
    :src="imageUrl"
    spinner-color="white"
    style="height: fit; max-width: fit"
  />
</template>

<script>
export default {
  name: 'DisplayImage',
  data () {
    return {
      url: '/detection_service/results'
    }
  },
  computed: {
    imageUrl: {
      get() {
        return (this.$store.state.main.imageUrl + '?t=' + (new Date).toLocaleString());
      }
    }
  }
}
</script>

<style>
</style>
