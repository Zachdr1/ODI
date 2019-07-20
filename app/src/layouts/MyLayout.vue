<template>
  <q-layout view="lHh Lpr lFf">
    <q-header elevated>
      <q-toolbar>
        <div class="row items-center q-gutter-lg">
          <div class="column block">
            <q-btn
              flat
              dense
              round
              @click="leftDrawerOpen = !leftDrawerOpen"
              aria-label="Menu"
            >
              <q-icon name="menu" />
            </q-btn>
          </div>
          <div class="column block">
            <q-toolbar-title>
              DLI - Deep Learning Interface
            </q-toolbar-title>
          </div>

          <div class="column block">
            <q-select color="white" class="full-width" outlined v-model="route" :options="route_options">
              <template v-slot:append>
                <q-avatar>
                  <img src="https://cdn.quasar.dev/logo/svg/quasar-logo.svg">
                </q-avatar>
              </template>
            </q-select>
          </div>
        </div>
      </q-toolbar>
    </q-header>

    <q-drawer v-model="leftDrawerOpen" bordered content-class="bg-grey-2">
      <router-view />
    </q-drawer>

    <q-page-container>
      <DisplayImage />
    </q-page-container>
  </q-layout>
</template>

<script>
import { openURL } from "quasar";
import DisplayImage from "./../components/display-image";

export default {
  name: "MyLayout",
  components: {
    DisplayImage
  },
  data() {
    return {
      leftDrawerOpen: this.$q.platform.is.desktop,
      route: "Select a Network",
      route_options: ["Select a Network", "YOLOv3"]
    };
  },
  methods: {
    openURL
  },
  watch: {
    route(value) {
      if(value == "Select a Network") {
        this.$router.push("/")
      }
      else if(value == "YOLOv3") {
        this.$router.push("/yolov3")
      }
    }
  }
};
</script>

<style></style>
