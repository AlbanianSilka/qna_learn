import consumer from "./consumer"

document.addEventListener('turbolinks:load', () => {

  const element = document.getElementById('post-id');
  const post_id = element.getAttribute('data-post-id');

  consumer.subscriptions.create({channel: "PostChannel", post_id: post_id }, {
    connected() {
      console.log("connected to post №" + post_id)
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) {
      $('#comment_name').append('<div class="comment"> <strong>' + data.title + '</strong></div>')
      $('#comment_content').append('<div class="comment">' + data.content + '</div>')
      $('#comment_answers').append('<div class=comment">' + data.answer + '</div>')
      console.log(data)
    }
  });
})



