<template>
  <v-layout>
    <v-flex text-xs-center>
      Tes saja - Ini bisa dibaca kalau login
      <img
        src="/v.png"
        alt="Vuetify.js"
        class="mb-5">
      <blockquote class="blockquote">
        &#8220;First, solve the problem. Then, write the code.&#8221;
        <footer>
          <small>
            <em>&mdash;John Johnson</em>
          </small>
        </footer>
        <code>{{ state }}</code>
      </blockquote>
      <v-btn @click="$auth.logout()">Log out</v-btn>
    </v-flex>
  </v-layout>
</template>
<script>
export default {
  middleware: ['auth'],
  computed: {
    state() {
      console.log(this.$auth)
      return JSON.stringify(this.$auth.$state, undefined, 2)
    }
  }
}
</script>
