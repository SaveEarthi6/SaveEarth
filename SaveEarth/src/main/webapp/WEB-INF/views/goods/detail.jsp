<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/header.jsp"/> 





<script>


$(function(){
	$(".increase").click(function() {
		console.log("test")

		const num = $("#num").val();
		const price = ${goodsDetail.PROD_PRICE };
	
		console.log($("#num").val());
		console.log(${goodsDetail.PROD_PRICE });
		$.ajax({
			type: "get",

			url: "http://localhost:8888/goods/gettotal",
			data:{num:num,price:price },
			success: function(data){
				
				$(".totalprice").html(data);
					
		
			}
		})
	})
	
		$(".decrease").click(function() {
		console.log("test")

		const num = $("#num").val();
		const price = ${goodsDetail.PROD_PRICE };
	
		console.log($("#num").val());
		console.log(${goodsDetail.PROD_PRICE });
		$.ajax({
			type: "get",

			url: "http://localhost:8888/goods/gettotal",
			data:{num:num,price:price },
			success: function(data){
				
				$(".totalprice").html(data);
					
		
			}
		})
	})
	
	


	

})



</script>
    













<style>
        #product > .view > .info > div {
            float: left;
            width: 50%;
            height: 100%;
            padding: 10px;
            box-sizing: border-box;
            text-align: center;
        }

        #product > .view > .info > .image > img { 
        	width: 400px; 
        	height: 300px;
         }
         
         #goodsimage{
         	width: 400px; 
        	height: 300px;
         }

        #product > .view > .info > .summary > nav {
            border-bottom: 1px solid #eaeaea;
            padding-bottom: 10px;
            margin-bottom: 12px;
            overflow: hidden;
        }

        #product > .view > .info > .summary > nav > h1 {
            float: left;
            color: #0231a6;
            font-weight: bold;
            font-size: 1.5em;
        }

        #product > .view > .info > .summary > nav > h2 {
            float: right;
            color: #777;
            margin-top: 8px;
        }

        #product > .view > .info > .summary > nav > h3 {
            font-size: 18px;
            font-weight: bold;
            color: #1e2732;
        }

        #product > .view > .info > .summary > nav > p {
            font-size: 14px;
            color: #474747;
            line-height: 36px;
            letter-spacing: -1px;
        }

        #product > .view > .info > .summary > nav:nth-child(2) > .rating > a {
            color: #346aff;
            text-decoration: underline;
        }

        #product > .view > .info > .summary .count {
            position: relative;
            width: 100px;
            height: 40px;
        }

        #product > .view > .info > .summary .count > button {
            position: absolute;
            width: 21px;
            height: 21px;
            /* background-image: url(./img/kogo.jpg); */
            font-size: 10px;
            background-color: transparent;
            border: none;
        }

        #product > .view > .info > .summary .count > input[name=num] {
            position: absolute;
            left: 30px;
            top: 0;
            width: 30px;
            height: 21px;
            border: 1px solid #ececec;
            font-size: 14px;
            text-align: center;
        }

        .decrease {
            left: 0;
            top: 0;
            background-position: 0px -74px;
        }

        .increase {
            left: 70px;
            top: 0;
            background-position: -48px -74px;
        }


        #product > .view > .info > .summary .total {
            overflow: hidden;
            margin-top: 16px;
        }

        #product > .view > .info > .summary .total > span {
            float: right;
            display: inline-block;
            line-height: 38px;
            font-size: 24px;
            font-weight: bold;
            color: #000;
            text-align: right;
            letter-spacing: -0.5px;
        }

 

        #product > .view > .info > .summary .total > em {
            float: right;
            display: block;
            width: 100px;
            height: 22px;
            padding: 10px 0 0;
            font-size: 16px;
            line-height: 22px;
            color: #5e636d;
            letter-spacing: -1px;
        }

        #product > .view > .info > .summary .button {
            overflow: hidden;
            margin-top: 16px;
        }

        #product > .view > .info > .summary .button > input {
            float: left;
            width: 49%;
            height: 50px;
            margin: 2px;
            font-size: 20px;
            font-weight: bold;
            border-radius: 2px;
            cursor: pointer;
        }

        #product > .view > .info > .summary .button > .cart {
            background: #fff;
            border: 1px solid #d9d9d9;
            color: #233594;
        }

        #product > .view > .info > .summary .button > .order {
            background: #2e8de5;
            border: 1px solid #217fd7;
            color: #fff;
        }



        #product > .view > article > nav {
            border-bottom: 1px solid #a4a9b0;
            padding: 6px 0;
            margin-bottom: 12px;
            overflow: hidden;
        }

        #product > .view > article > nav > p {
            float: left;
            color: #777;
            margin-top: 6px;
            margin-left: 6px;
        }

        #product > .view > article > nav > h1 {
            float: left;
            color: #1e2732;
            font-weight: bold;
            font-size: 1.5em;
        }

        #product > .view > .notice > table { width: 100%; }

        #product > .view > .notice > table:nth-of-type(2) { border-top: 1px solid #ececec; }

        #product > .view > .notice > table tr > td {
             padding: 5px 0 6px 21px;
             font-size: 14px;
             color: #777;
        }

        #product > .view > .notice > table tr > td:nth-child(1) { width: 20%; color: #222; }





        #product > .view > .notice > .notice {
            margin: 20px 0;
            padding: 21px 26px 20px 19px;
            line-height: 20px;
            font-size: 14px;
            color: #757c8a;
            background: #fafafa;
            border-radius: 2px;
            white-space: normal;
        }
 </style>
    
 <style>
    /* Add your CSS styles here */
    .count {
        display: flex;
        align-items: center;
    }

    .count button {
        padding: 5px 10px;
        font-size: 16px;
        cursor: pointer;
    }

    .count input {
        width: 40px;
        text-align: center;
    }
</style>




    
    
<body>
<br><br><br><br><br><br><br><br><br><br>
    <div id="wrapper">
        <header>
       
       


        </header>
        <main id="product">

            <section class="view">
       
                <article class="info">
                    <div class="image">
                        <img src="/resources/img/free.png" alt="상품이미지" class="goodsimage">
                    </div>
                    <div class="summary">
                  
                        <nav>
                            <h1>${goodsDetail.PROD_NAME }</h1>
                 
                        </nav>
                        <nav>
                            <div >
                                <h3 class="prodprice">${goodsDetail.PROD_PRICE }</h3>
                                
                            </div>

                        </nav>

                       
                        <div class="count">
                            <button class="decrease">-</button>
                            <input type="text" name="num" id="num" value="1" readonly>
                            <button class="increase">+</button>
                        </div>
                        <div class="total">
                            <span class="totalprice">${goodsDetail.PROD_PRICE }</span>
                        
                        </div>
                        <div class="button">
                       
                            <input type="button" class="cart" value="장바구니" onclick="location.href='./cart?prodno=${goodsDetail.PROD_NO}'">
                            <input type="hidden" name="prodCount" class="prodCount">
                        
                            <input type="button" class="order" value="구매하기">
                            
                        </div>
                    </div>
                </article>


               
            </section>
        </main>
       
        
    </div>
    
    
<script>
    
    const decreaseBtn = document.querySelector('.decrease');
    const increaseBtn = document.querySelector('.increase');
    const inputField = document.querySelector('input[name="num"]');

    decreaseBtn.addEventListener('click', () => {
        let currentValue = parseInt(inputField.value);
        if (currentValue > 1) {
            inputField.value = --currentValue;
          

        }
    });

    increaseBtn.addEventListener('click', () => {
        let currentValue = parseInt(inputField.value);
        inputField.value = ++currentValue;
    });
    



</script>  


    
    
    
</body>
</html>