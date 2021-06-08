$ ->
  postForm = $("#post_form")
  addPostBtn = $("#add_post_btn")
  postsList = $(".posts-list")

  addPostBtn.on 'click', (e) ->
    e.preventDefault()
    postForm.show()
    postForm.find(".cancel-btn").one 'click', ->
      postForm.hide()
    false

    postForm.on 'ajax:success', (e, data, status, xhr) ->
      App.utils.successMessage(data?.message)
      window.location.href = "/posts/#{data.post.id}"

    postForm.on 'ajax:error', App.utils.ajaxErrorHandler

    App.cable.subscriptions.create('PostsChannel', {
      connected: ->
        console.log('Connected!')
    })