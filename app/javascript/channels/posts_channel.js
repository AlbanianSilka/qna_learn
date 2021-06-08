import consumer from "./consumer"

document.addEventListener('turbolinks:load', () => {

})
consumer.subscriptions.create("PostsChannel", {
  connected() {
    // console.log('i am post')
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },
  received(data) {
    $('#post_title').append('<a href="posts/' + data.id + '"><div class="post">' + data.title + '</div>')
    $('#post_content').append('<div class="post">' + data.content + '</div>')
    console.log(data)
    // console.log(data)
    // Called when there's incoming data on the websocket for this channel
  }
});
