document.addEventListener(
  "DOMContentLoaded", e => {
    Payjp.setPublicKey("pk_test_8c2bb5e7e6422b6570dc93a0");
    var btn = document.getElementById('payment_card_submit-button');
    btn.addEventListener("click", (e) => {
      e.preventDefault();

      var card = {
        number: $("#number").val(),
        cvc: $("#cvc").val(),
        exp_month: $("#exp_month").val(),
        exp_year: $("#exp_year").val()
      }; 


      Payjp.createToken(card, (status, response) => {
        if (status === 200) {
          $("#number").removeAttr("name");
          $("#cvc").removeAttr("name");
          $("#exp_month").removeAttr("name");
          $("#exp_year").removeAttr("name"); 
          $("#card_token").append(
            $('<input type="hidden" name="payjp-token">').val(response.id)
          );
          document.inputForm.submit();
          alert("登録が完了しました"); 
        } else {
          alert("カード情報が正しくありません。"); 
        }
      });
    });
  },
  false
);

// $(document).on('turbolinks:load',function(){

//   let submit = document.getElementById("payment_card_submit-button");

//   Payjp.setPublicKey('pk_test_8c2bb5e7e6422b6570dc93a0');


//     submit.addEventListener('click', function(e){ 

//     e.preventDefault(); 

//     let card = { 
//         number: document.getElementById("payment_card_no").value,
//         cvc: document.getElementById("payment_card_cvc").value,
//         exp_month: document.getElementById("payment_card_month").value,
//         exp_year: document.getElementById("payment_card_year").value,
//     };

//     Payjp.createToken(card, function(status, response) {
//       if (status === 200) { 
//         $(".number").removeAttr("name");
//         $(".cvc").removeAttr("name");
//         $(".exp_month").removeAttr("name");
//         $(".exp_year").removeAttr("name"); 
//         $("#charge-form").append(
//           $('<input type="hidden" name="payjp_token">').val(response.id)
//         ); 
//         document.inputForm.submit();
//         alert("登録が完了しました"); 
//       } else {
//         alert("カード情報が正しくありません。"); 
//       }
//     });
//   });
// });