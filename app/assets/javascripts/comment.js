$(function(){
  // console.log("test");
  function buildHTML(comment){
    if ( comment.image ) {
      // console.log("画像あり");
      let html =
        `<div class="commenter__box">
          <div class="commenter__box__img">
            <img src="${comment.user_image}"></img>
          </div>
          <div class="commenter__box-2">
            <div class="commenter__box-2__name p15">
              ${comment.user_name}
            </div>
            <div class="commenter__box-2__comment">
              <div class="comment__content p15">
                ${comment.content}
              </div>
              <img class="comment__image" src="${comment.image}"></img>
            </div>
          </div>
          <div class="commenter__box-3">
            <div class="commenter__box-3__created_at p8">
            ${comment.created_at}
            </div>
          </div>
        </div>`
      return html;
    } else {
      // console.log("画像なし");
      let html =
        `<div class="commenter__box">
        <div class="commenter__box__img"></div>
        <div class="commenter__box-2">
          <div class="commenter__box-2__name p15">
            ${comment.user_name}
          </div>
          <div class="commenter__box-2__comment">
            <div class="comment__content p15">
              ${comment.content}
            </div>
            <img class="comment__image" src="${comment.image}"></img>
          </div>
        </div>
        <div class="commenter__box-3">
          <div class="commenter__box-3__created_at p8">
          ${comment.created_at}
          </div>
        </div>
      </div>`
    return html;
    };
  }
  $(".comment__footer__form").on('submit', function(e){
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
      $('.auc_show__comment').append(html); 
      $('.comment__footer__form')[0].reset();
      $('.main').animate({ scrollTop: $('.main')[0].scrollHeight});
      $('.comment__footer__form__btn').prop('disabled', false);
    })
    .fail(function() {
      alert("メッセージ送信に失敗しました");
      $('.comment__footer__form__btn').prop("disabled", false);
    });
  });

// 最新コメントへ移動
  $(".auc_show__moveNew").on('click', function(e){
    e.preventDefault();
    // console.log(this);
      $('.main').animate({ scrollTop: $('.main')[0].scrollHeight});
    });
});