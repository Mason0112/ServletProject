<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/headers/">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
<link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">

</head>
<body>
	</head>
<body>
	<header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
      <div class="col-md-3 mb-2 mb-md-0">
        <a href="/" class="d-inline-flex link-body-emphasis text-decoration-none">
          <svg class="bi" width="40" height="32" role="img" aria-label="Bootstrap"><img style="height: 90px;" src="https://lh3.googleusercontent.com/proxy/9pK2Y5xhhvCwn1gGIhNdB8g9iS5H4oZWLjkgjBGF6lfC8mXuXhZuVjuvdwBYRbPf6KD0khvWHDDG3z_p60SJbztjrQSvXY_WO2GzzPmFnO8nbZN8PA" alt=""></svg>
        </a>
      </div>

      <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
        <li><a href="#" class="nav-link px-2 link-secondary">Home</a></li>
        <li><a href="#" class="nav-link px-2">Features</a></li>
        <li><a href="#" class="nav-link px-2">Pricing</a></li>
        <li><a href="#" class="nav-link px-2">FAQs</a></li>
        <li><a href="#" class="nav-link px-2">About</a></li>
      </ul>

      <div class="col-md-3 text-end">
        <button type="button" class="btn btn-outline-primary me-2">Login</button>
        <button type="button" class="btn btn-primary">Sign-up</button>
      </div>
    </header>
	
	<form action="${pageContext.request.contextPath }/UpdateItem.do"
		method="POST" enctype="multipart/form-data">

		<input type="hidden" name="id" value="${i.itemId }">

		 <div class="col-3" style="margin: auto;" >
              <label for="email" class="form-label">品名 <span class="text-body-secondary"></span></label>
              <input type="text" name="iName" value="${i.itemName }">
              <div class="invalid-feedback">
              </div>
            </div>
    
    	<div class="col-3" style="margin: auto;" >
              <label for="email" class="form-label">價格 <span class="text-body-secondary"></span></label>
              <input type="Number" name="iPrice" value="${i.itemPrice }">
              <div class="invalid-feedback">
 
              </div>
            </div>
       <div class="col-3" style="margin: auto;" >
              <label for="email" class="form-label">蛋白質量 <span class="text-body-secondary"></span></label>
              <input type="Number" name="iProteinContain" value="${i.itemProteinContain }">
              <div class="invalid-feedback">

              </div>
            </div>
            
       <div class="col-3" style="margin: auto;" >
              <label for="email" class="form-label">評分 <span class="text-body-secondary"></span></label>
              <input type="Number" name="iRating" value="${i.itemRating }">
              <div class="invalid-feedback">

              </div>
            </div>
	
		<div>
			<img  alt="" src="${i.itemPhotoBase64 } " style="height: 300px; margin-left: 400px;">
		</div>
		
		<div class="col-3" style="margin: auto;" >
              <label for="email" class="form-label"><span class="text-body-secondary">	</span></label>
              <input type="file" accept="image/*" name="iPhoto" >
              <div class="invalid-feedback">
              </div>
            </div>

		<button style="margin-left: 600px;">修改</button>
	</form>
	<script>
		const memberPhotoInput = document.querySelector("input[name='iPhoto']");
		const img =   document.querySelector("img")

		memberPhotoInput.addEventListener("change",()=>{
			const file = memberPhotoInput.files[0];
			const tempURL =  URL.createObjectURL(file);
			img.src = tempURL

		})
	</script>


<script src="../assets/dist/js/bootstrap.bundle.min.js"></script>	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
</body>
</html>