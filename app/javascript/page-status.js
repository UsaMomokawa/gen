import Vue from 'vue'
import PageStatus from './page-status.vue'

document.addEventListener('DOMContentLoaded', () => {
  const pageStatuses = document.querySelectorAll('.js-page-status')
  if (pageStatuses) {
    for (let i = 0; i < pageStatuses.length; i++) {
      let pageStatus = pageStatuses[i]

      const workId  = pageStatus.getAttribute('data-work-id')
      const stageId = pageStatus.getAttribute('data-stage-id')
      const pageId  = pageStatus.getAttribute('data-page-id')
      const status  = pageStatus.getAttribute('data-status')
      new Vue({
        render: h => h(PageStatus, { props: { workId: workId, stageId: stageId, pageId: pageId, status: status } })
      }).$mount('.js-page-status')
    }
  }
})
