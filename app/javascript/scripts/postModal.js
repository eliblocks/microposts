document.addEventListener('turbo:load', _ => {
  const postModal = document.getElementById('post-modal')
  if (postModal) {
    postModal.addEventListener('show.bs.modal', event => {
      const button = event.relatedTarget
      const postId = button.getAttribute('data-post-id')
      const originalPostField = postModal.querySelector('#post_original_post_id')
      originalPostField.value = postId

      const originalPostCard = document.querySelector(`#card-${postId}`)
      const modalOriginalCard = postModal.querySelector('#modal-original-post')
      modalOriginalCard.innerHTML = originalPostCard.innerHTML
    })
  }
})
