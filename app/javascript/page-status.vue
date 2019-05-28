<template>
  <div>
    <ul class="page-status__buttons">
      <li class="page-status__buttons-item">
        <button class="page-status__button a-button js-not-complete" v-bind:disabled="statusName === 'not_complete'" v-bind:class="[statusName === 'not_complete' ? 'is-primary' : 'is-secondary']" @click="pushStatus('not_complete')">未完</button>
      </li>
      <li class="page-status__buttons-item">
        <button class="page-status__button a-button js-started" v-bind:disabled="statusName === 'started'" v-bind:class="[statusName === 'started' ? 'is-primary' : 'is-secondary']" @click="pushStatus('started')">開始</button>
      </li>
      <li class="page-status__buttons-item">
        <button class="page-status__button a-button js-complete" v-bind:disabled="statusName === 'complete'" v-bind:class="[statusName === 'complete' ? 'is-primary' : 'is-secondary']" @click="pushStatus('complete')">完了</button>
      </li>
    </ul>
  </div>
</template>
<script>

export default {
  props: ['workId', 'stageId', 'pageId', 'status'],
  data () {
    return {
      statusName: null
    }
  },
  mounted () {
    this.statusName = this.status
  },
  methods: {
    token () {
      const meta = document.querySelector('meta[name="csrf-token"]')
      return meta ? meta.getAttribute('content') : ''
    },
    pushStatus (name) {
      let params = new FormData()
      params.append('status', name)
      params.append('page_id', this.pageId)

      fetch(`/api/works/${this.workId}/stages/${this.stageId}/progress.json`, {
        method: 'PATCH',
        headers: {
          'X-Requested-With': 'XMLHttpRequest',
          'X-CSRF-Token': this.token()
        },
        credentials: 'same-origin',
        redirect: 'manual',
        body: params
      })
        .then(response => {
          this.statusName = name
        })
        .catch(error => {
          console.warn('Failed to parsing', error)
        })
    },
  }
}
</script>
<style scoped>
</style>
