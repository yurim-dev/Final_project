/**
 * 
 */
var main = {
   init : function() {
      var _this = this;
      $('#btn_add').on('click', function() {
         _this.add();
      });
      $('#btn_addAll').on('click', function() {
         _this.addAll();
      });
   },
   add : function() {
      //alert("시작");
      var token = $('#csrf').val();
      var data = {
         userId: $('#userId').val(),
         goodsNo: $('#goodsNo').val(),          // 현재 goodsNo 한개만 가져올수 있어서 goodsNo여러개 가져올수 없음
         amount: $("#amount").val()
      };
/*      var data ={
            userId:'asd',
            goodsNo:'49096',
            amount: 1
               
      };
      */
      //alert("goodsNo:"+data["goodsNo"]);
      
      console.log("userId:"+data["userId"]);
      console.log("goodsNo:"+data["goodsNo"]);
      console.log("amount:"+data["amount"]);
   /*   console.log("token:"+token);*/
      debugger;
      $.ajax({
         type:'POST',
         headers: {'x-csrf-token' : token},
         url: '/cart/add',
         dataType: 'json',
         async:false,
         cache: false,
         contentType: 'application/json;charset=utf-8',
         data: JSON.stringify(data)
      }).done(function() {
         //alert("장바구니");
         var isCart = confirm("장바구니에 물건이 추가되었습니다. 장바구니로 이동하시겠습니까?");
         if(isCart === true) {
            /*window.location.href="/order/cart";*/
            window.history.back();
         } else {
            window.location.href="/goods/detail?goodsNo="+ $('#goodsNo').val();
         }

      }).fail(function(error) {
         alert(JSON.stringify(error));
      });
      //
   },
   
   addAll : function() {
      //alert("시작");
      var token = $('#csrf').val();      
      
      var goodsNo = [];   
      var amount = [];
      
      $('.goodsNo').each(function(index){
         goodsNo.push($(this).val());      
      });
      var goods = goodsNo.slice(3,(Math.ceil((goodsNo.length-3)/2))+3);
      //alert('bbb:'+goodsNo+"\n"+'ccc:'+goodsNo.slice(3,(Math.ceil((goodsNo.length-3)/2))+3));
      
      
      $('.amount').each(function(index){
         amount.push($(this).val());      
      });
      
      var amounts = amount.slice(3,(Math.ceil((goodsNo.length-3)/2))+3);
      //alert('ddd:'+amount+"\n"+'eee:'+amount.slice(3,(Math.ceil((goodsNo.length-3)/2))+3));
      
      
      var data ={
            
         userId:$('#userId').val(),
         goodsNo :goods,
         amount : amounts
      };
      //-->이상적인 데이터 형태
      
      console.log(userId);
      console.log(goods);
      console.log(amounts);
      
               
      //alert("goodsNo:"+data["goodsNo"]);      
      
//      console.log("userId:"+data["userId"]);
//      console.log("goodsNo:"+data["goodsNo"]);
//      console.log("amount:"+data["amount"]);
//      console.log("token:"+token);
      debugger;
      
      
      $.ajax({
         type:'POST',
         headers: {'x-csrf-token' : token},
         url: '/cart/addAll',
         dataType: 'json',
         async:false,
         contentType: 'application/json;charset=utf-8',
         data: JSON.stringify(data),
         success:function() {
            alert("장바구니에 물건이 추가되었습니다.");
            console.log("현위치는 success");
            
            
            //window.location.href="/recipe/detail?rcp_seq=33";
            //window.location.href="/goods/list";
            window.history.back();
            //window.location.href="http://www.naver.com";
            //alert("ddd");
            //window.location.href="/order/cart";
            /*var isCart = confirm("장바구니에 물건이 추가되었습니다. 장바구니로 이동하시겠습니까?");
            if(isCart === true) {
               window.location.href="/order/cart";
            } else {
               window.location.href="/goods/detail?goodsNo="+ $('#goodsNo').val();
            }*/

         },
         error: function(error) {
            alert(JSON.stringify(error));
         }/*,
         complete: function() {
            alert("complete");
            window.location.href="/order/cart";
         } */
      });
   
/*      .done(function() {
         //alert("장바구니");
         var isCart = confirm("장바구니에 물건이 추가되었습니다. 장바구니로 이동하시겠습니까?");
         if(isCart == true) {
            window.location.href="/
            order/cart";
         } else {
            //window.location.href="/recipe/detail?rcp_seq="+ $('#rcp_seq').val();
            window.location.href="/goods/detail?goodsNo=49096";
         }

      }).fail(function(error) {
         alert(JSON.stringify(error));
      });*/
   }
   
};

main.init();