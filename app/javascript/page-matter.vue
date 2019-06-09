<template>
  <div class="page-matter__button" :class=" isMatter ? 'is-active' : '' " @click="push">
    <i class="fas fa-burn page-matter__icon is-left-icon"></i>
    <div class="page-matter__text">
      {{ matterLabel }}
    </div>
  </div>
</template>

<script>

export default {
  props: ['pageId', 'matter'],
  data () {
    return {
      isMatter: false,
      matterLabel: "見せ場なし"
    }
  },
  mounted () {
    if (this.matter == "true") {
      this.isMatter = true
      this.matterLabel = "見せ場あり"
    } else {
      this.isMatter = false
      this.matterLabel = "見せ場なし"
    }
  },
  methods: {
    token () {
      const meta = document.querySelector('meta[name="csrf-token"]')
      return meta ? meta.getAttribute('content') : ''
    },
    push () {
      if (this.isMatter == true) {
        this.pushUnmatter()
      } else {
        this.pushMatter()
      }
    },
    pushMatter () {
      let params = new FormData()
      params.append('matter', true)

      fetch(`/api/pages/${this.pageId}.json`, {
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
          this.isMatter = true
          this.matterLabel = "見せ場あり"
        })
        .catch(error => {
          console.warn('Failed to parsing', error)
        })
    },
    pushUnmatter () {
      let params = new FormData()
      params.append('matter', false)

      fetch(`/api/pages/${this.pageId}.json`, {
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
          this.isMatter = false
          this.matterLabel = "見せ場なし"
        })
        .catch(error => {
          console.warn('Failed to parsing', error)
        })
    }
  }
}

</script>
