import Vue from 'vue'
import PageMatter from './page-matter.vue'

document.addEventListener('DOMContentLoaded', () => {
  const pageMatters = document.querySelectorAll('.js-page-matter')
  if (pageMatters) {
    for (let i = 0; i < pageMatters.length; i++) {
      let pageMatter = pageMatters[i]

      const pageId = pageMatter.getAttribute('data-page-id')
      const matter = pageMatter.getAttribute('data-matter')
      new Vue({
        render: h => h(PageMatter, { props: { pageId: pageId, matter: matter } })
      }).$mount('.js-page-matter')
    }
  }
})
