<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>建立物件</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
      crossorigin="anonymous"
    />
  <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }

      .b-example-divider {
        width: 100%;
        height: 3rem;
        background-color: rgba(0, 0, 0, .1);
        border: solid rgba(0, 0, 0, .15);
        border-width: 1px 0;
        box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
      }

      .b-example-vr {
        flex-shrink: 0;
        width: 1.5rem;
        height: 100vh;
      }

      .bi {
        vertical-align: -.125em;
        fill: currentColor;
      }

      .nav-scroller {
        position: relative;
        z-index: 2;
        height: 2.75rem;
        overflow-y: hidden;
      }

      .nav-scroller .nav {
        display: flex;
        flex-wrap: nowrap;
        padding-bottom: 1rem;
        margin-top: -1px;
        overflow-x: auto;
        text-align: center;
        white-space: nowrap;
        -webkit-overflow-scrolling: touch;
      }

      .btn-bd-primary {
        --bd-violet-bg: #712cf9;
        --bd-violet-rgb: 112.520718, 44.062154, 249.437846;

        --bs-btn-font-weight: 600;
        --bs-btn-color: var(--bs-white);
        --bs-btn-bg: var(--bd-violet-bg);
        --bs-btn-border-color: var(--bd-violet-bg);
        --bs-btn-hover-color: var(--bs-white);
        --bs-btn-hover-bg: #6528e0;
        --bs-btn-hover-border-color: #6528e0;
        --bs-btn-focus-shadow-rgb: var(--bd-violet-rgb);
        --bs-btn-active-color: var(--bs-btn-hover-color);
        --bs-btn-active-bg: #5a23c8;
        --bs-btn-active-border-color: #5a23c8;
      }

      .bd-mode-toggle {
        z-index: 1500;
      }

      .bd-mode-toggle .dropdown-menu .active .bi {
        display: block !important;
      }
    </style>
  
  <style>
        .star {
            font-size: 2em;
            color: gray;
            cursor: pointer;
        }
        .star.rated {
            color: gold;
        }
    </style>
  
  
  </head>
  <body>
      <div class="py-3 text-center" >
      <img class="d-block mx-auto mb-4" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTe1YE4sQw7sDakzmw5NaSCewZOGDpAEwmLg&s" alt="" width="72" height="57">
      <h2>7-11食品評分</h2>
      <p class="lead">找尋最有CP值的食物</p>
    </div>
    
    
    <form
      action="${pageContext.request.contextPath }/CreateItem.do"
      method="POST"
      enctype="multipart/form-data"
    >
 	  <div class="col-3" style="margin: auto;" >
              <label for="email" class="form-label">品名 <span class="text-body-secondary"></span></label>
              <input type="text" class="form-control"   name="iName">
              <div class="invalid-feedback">
              </div>
            </div>
    
    	<div class="col-3" style="margin: auto;" >
              <label for="email" class="form-label">價格 <span class="text-body-secondary"></span></label>
              <input type="Number" class="form-control"   name="iPrice">
              <div class="invalid-feedback">
                請輸入品名
              </div>
            </div>
       <div class="col-3" style="margin: auto;" >
              <label for="email" class="form-label">蛋白質量 <span class="text-body-secondary"></span></label>
              <input type="Number" class="form-control"   name="iProtein">
              <div class="invalid-feedback">
                請輸入品名
              </div>
            </div>
            
       <div class="col-3" style="margin: auto;" >
              <label for="email" class="form-label">評級 <span class="text-body-secondary"></span></label>
              <div id="star-rating">
                    <span class="star" data-value="1">&#9733;</span>
                    <span class="star" data-value="2">&#9733;</span>
                    <span class="star" data-value="3">&#9733;</span>
                    <span class="star" data-value="4">&#9733;</span>
                    <span class="star" data-value="5">&#9733;</span>
                </div>
              <input type="hidden" class="form-control"  name="iRating" id="iRating">
              <div class="invalid-feedback">
              </div>
            </div>          
	
		<div class="col-3" style="margin: auto;" >
              <label for="email" class="form-label">照片 <span class="text-body-secondary">	</span></label>
              <input type="file"  class="form-control"   name="iPhoto"  accept="image/*">
              <div class="invalid-feedback">
              </div>
            </div>
	
	
	
<!-- 	<ul class="list-group"> -->
<!-- 		<li class="list-group-item">品名: <input type="text" name="iName" /></li> -->
<!-- 		<li class="list-group-item">價格: <input type="Number" name="iPrice" />新台幣</li> -->
<!-- 		<li class="list-group-item">蛋白質量: <input type="Number" name="iProtein" />公克</li> -->
<!-- 		<li class="list-group-item">評級:  -->
<!-- 		<span id="star-rating"> -->
<!--                     <span class="star" data-value="1">&#9733;</span> -->
<!--                     <span class="star" data-value="2">&#9733;</span> -->
<!--                     <span class="star" data-value="3">&#9733;</span> -->
<!--                     <span class="star" data-value="4">&#9733;</span> -->
<!--                     <span class="star" data-value="5">&#9733;</span> -->
<!--                 </span> -->
<!--                 <input type="hidden" name="iRating" id="iRating" /> -->
<!-- 		<li class="list-group-item">照片: <input type="file" accept="image/*" name="iPhoto" /></li> -->
<!-- 	  </ul> -->
      <button type="submit" style="margin-left:  580px; margin-top: 20px;"  class="btn btn-primary btn-lg">建立</button>
    </form>	
    

    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
      crossorigin="anonymous"
    ></script>
 	<script>
        document.addEventListener('DOMContentLoaded', () => {
            const stars = document.querySelectorAll('.star');
            const ratingInput = document.getElementById('iRating');
            let selectedRating = 0;

            stars.forEach(star => {
                star.addEventListener('click', () => {
                    const rating = star.getAttribute('data-value');
                    selectedRating = rating;
                    ratingInput.value = selectedRating;
                    stars.forEach(s => s.classList.remove('rated'));
                    star.classList.add('rated');
                    for (let i = 0; i < rating; i++) {
                        stars[i].classList.add('rated');
                    }
                });
            });
        });
    </script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
  	<script src="../assets/dist/js/bootstrap.bundle.min.js"></script>
    <script src="checkout.js"></script>
  </body>
</html>
