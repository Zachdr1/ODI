<template>
  <q-page>
    <q-list>
      <q-item-label header>Essential Links</q-item-label>
      <q-item
        clickable
        tag="a"
        target="_blank"
        href="https://github.com/zachdr1/DLI"
      >
        <q-item-section avatar>
          <q-icon name="code" />
        </q-item-section>
        <q-item-section>
          <q-item-label>Github</q-item-label>
          <q-item-label caption>github.com/zachdr1/DLI</q-item-label>
        </q-item-section>
      </q-item>
    </q-list>
  </q-page>
</template>

<style></style>

<script>
export default {
  name: "PageIndex"
};
</script>
