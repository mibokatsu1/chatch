$(function(){
  // console.log("test");
  function buildHTML(message){
    if ( message.image ) {
      // console.log("画像あり");
      let html =
        `<div class="messenger__box">
          <div class="messenger__box__img">
            <img src="${message.user_image}"></img>
          </div>
          <div class="messenger__box-2">
            <div class="messenger__box-2__name p15">
              ${message.user_name}
            </div>
            <div class="messenger__box-2__message">
              <div class="message__content p15">
                ${message.content}
              </div>
              <img class="message__image" src="${message.image}"></img>
            </div>
          </div>
          <div class="messenger__box-3">
            <div class="messenger__box-3__created_at p8">
            ${message.created_at}
            </div>
          </div>
        </div>`
      return html;
    } else {
      // console.log("画像なし");
      let html =
        `<div class="messenger__box">
        <div class="messenger__box__img"></div>
        <div class="messenger__box-2">
          <div class="messenger__box-2__name p15">
            ${message.user_name}
          </div>
          <div class="messenger__box-2__message">
            <div class="message__content p15">
              ${message.content}
            </div>
            <img class="message__image" src="${message.image}"></img>
          </div>
        </div>
        <div class="messenger__box-3">
          <div class="messenger__box-3__created_at p8">
          ${message.created_at}
          </div>
        </div>
      </div>`
    return html;
    };
  }
  $(".footer__form").on('submit', function(e){
  // $(document).on('submit', ".footer__form", function(e){
    e.preventDefault();
    let formData = new FormData(this);
    let url = $(this).attr('action');
    // console.log(this);
    $.ajax({
      url: url,
      type: 'POST',
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      // console.log(data);
      let html = buildHTML(data);
      $('.messenger').append(html); 
      $('.footer__form')[0].reset();
      $('.main').animate({ scrollTop: $('.main')[0].scrollHeight});
      $('.footer__form__btn').prop('disabled', false);
    })
    .fail(function() {
      alert("メッセージ送信に失敗しました");
      $('.footer__form__btn').prop("disabled", false);
    });
  });

  // 最新コメントへ移動
  $(".message__moveNew").on('click', function(e){
    e.preventDefault();
    // console.log(this);
      $('.main').animate({ scrollTop: $('.main')[0].scrollHeight});
    });
});