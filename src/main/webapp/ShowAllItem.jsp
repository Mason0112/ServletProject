<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<title>全部資料</title>
<link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/headers/">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
<link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">


  
    <!-- Custom styles for this template -->
    <link href="headers.css" rel="stylesheet">
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
        <li><a href="/Hakka7-11/CreateItem.jsp" class="nav-link px-2">建立品項</a></li>
        <li><a href="#" class="nav-link px-2">Pricing</a></li>
        <li><a href="#" class="nav-link px-2">FAQs</a></li>
        <li><a href="#" class="nav-link px-2">About</a></li>
      </ul>

      <div class="col-md-3 text-end">
        <button type="button" class="btn btn-outline-primary me-2">Login</button>
        <button type="button" class="btn btn-primary">Sign-up</button>
      </div>
    </header>
	


	<table class="table table-striped"  style="margin-top: 30px;">
		<thead>
			<tr>
				<td>id</td>
				<td>品名</td>
				<td>價格</td>
				<td>蛋白質量</td>
				<td>評價</td>
				<td>照片</td>
				<td>功能</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${items }" var="i">
				<tr>
					<td>${i.itemId }</td>
					<td>${i.itemName }</td>
					<td>${i.itemPrice }</td>
					<td>${i.itemProteinContain }</td>
					<td>${i.itemRating }</td>
					<td><img data-id="${i.itemId}" src="${i.itemPhotoBase64 }"
						style="height: 100px"></td>
					<td>
						<button data-id="${i.itemId}" class="deleteBtn">刪除</button>
						<button data-id="${i.itemId}" class="updataBtn">更新</button>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<script type="text/javascript">
		const imgs=	document.querySelectorAll("img");
		const deleteBtns = document.querySelectorAll(".deleteBtn");
		const updataBtns = document.querySelectorAll(".updataBtn");

		for(let btn of deleteBtns){
			btn.addEventListener("click",()=>{
				if(confirm("確定要刪除嗎")){

					// 送出 AJAX 非同步請求，如果接收到後端回傳"done"，我才真的刪除頁面的元素
					fetch("/Hakka7-11/DeleteItemById.do?id="+btn.dataset["id"]).then(rs=>rs.text()).then(message=>{
						if(message=="done"){
							btn.parentElement.parentElement.remove();
						}
					})

				}
			})
		}

		for(let btn of updataBtns){
			btn.addEventListener("click",()=>{
				window.location="/Hakka7-11/GetDataAndGoToJSP.do?id="+btn.dataset["id"];
			})
		}



		for(let img of imgs){
			img.addEventListener("click",()=>{
				window.location="/Hakka7-11/GetItemById.do?id="+img.dataset["id"];
			})
		}
	</script>
<script src="../assets/dist/js/bootstrap.bundle.min.js"></script>	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>	
</body>
</html>