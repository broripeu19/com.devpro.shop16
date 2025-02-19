<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<title>Product Page - Admin</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:400,700" />
<!-- https://fonts.google.com/specimen/Roboto -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
	integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="../css/fontawesome.min.css" />
<!-- https://fontawesome.com/ -->
<link rel="stylesheet" href="../css/bootstrap.min.css" />
<!-- https://getbootstrap.com/ -->
<link rel="stylesheet" href="../css/templatemo-style.css">
<link rel="stylesheet" href="../css/simplePagination.css" />
<!--
	Product Admin CSS Template
	https://templatemo.com/tm-524-product-admin
	-->
<style type="text/css">
.select-category {
	height: 60px;
}


.keyword-search-product {
	height: 60px;
}

.simplePagination-page {
	margin: auto;
	margin-top: 46px;
}

.dark-theme a, .dark-theme span {
	line-height: 36px;
	padding: 0px 12px;
}

.tm-block-products-css {
	    min-height: 570px;
}
.add-new-product {
    margin-left: 640px;
}
</style>
<!-- import JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!-- import SPRING-FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
</head>

<body id="reportsPage">
	<jsp:include page="/WEB-INF/views/quantrivien/layout/header.jsp"></jsp:include>
	<div class="container mt-5">

		<div class="row tm-content-row">
			<div class="col-sm-12 col-md-12 col-lg-12 col-xl-12 tm-block-col">
				<div
					class="tm-bg-primary-dark tm-block tm-block-products tm-block-products-css">

				
					<!-- Dang 2: Spring Form  -->
					<form class="form-inline" action="${base }/admin/users-admin" method="get">
						<div class="d-flex flex-row justify-content-between mt-4">
							<div class="d-flex flex-row">
								<input type="hidden" id="page" name="page" class="form-control">
								<input type="text" id="keyword" name="keyword"
									class="form-control keyword-search-product"
									placeholder="Search" value="${searchModel.keyword }"
									style="margin-right: 5px;">
								<button type="submit" id="btnSearch" name="btnSearch"
									value="Search" class="btn btn-primary">Seach</button>
							</div>
							<div class="add-new-product">
								<a class="btn btn-outline-primary mb-1"
									href="${base }/admin/add-account/" role="button">Add Account</a>
							</div>
							
						</div>
						<table class="table table-striped">
							<thead>
								<tr>
									<th scope="col">#</th>
									<th scope="col">ID</th>
									<th scope="col">UserName</th>
									<!-- <th scope="col">Password</th> -->
									<th scope="col">Email</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${usersWithPaging.data}" var="user"
									varStatus="loop">
									<tr>
										<th scope="row">${loop.index + 1}</th>
										<td>${user.id }</td>
										<td>${user.username }</td>
										<%-- <td>${user.password }</td> --%>
										
										<td>${user.email }</td>
										
										
										<td><a class="btn btn-primary"
											href="${base }/admin/add-product/${product.id}" role="button">Edit</a>
											<a class="btn btn-danger"
											href="${base }/admin/users-admin/deleteUser/${user.id}" id="delete_${user.id}" 
											onclick="DeleteProduct('${base }/admin/users-admin/${username }',${user.id})" 
											role="button">Delete</a> 
											
											<%-- <button class="btn btn-danger" id="delete_${user.id}" role="button"
												onclick="DeleteProduct('${base }',${user.username})">Delete</button> --%> 
									
									</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<!-- Paging -->
						<div class="row simplePagination-page">
							<div class="col-12 d-flex justify-content-center">
								<div id="paging"></div>
							</div>
						</div>
				</div>

			</div>

			<!-- <div class="col-sm-12 col-md-12 col-lg-4 col-xl-4 tm-block-col">
				<div class="tm-bg-primary-dark tm-block tm-block-product-categories">
					<h2 class="tm-block-title">Product Categories</h2>
					<div class="tm-product-table-container">
						<table class="table tm-table-small tm-product-table">
							<tbody>
								<tr>
									<td class="tm-product-name">Product Category 1</td>
									<td class="text-center"><a href="#"
										class="tm-product-delete-link"> <i
											class="far fa-trash-alt tm-product-delete-icon"></i>
									</a></td>
								</tr>
								<tr>
									<td class="tm-product-name">Product Category 2</td>
									<td class="text-center"><a href="#"
										class="tm-product-delete-link"> <i
											class="far fa-trash-alt tm-product-delete-icon"></i>
									</a></td>
								</tr>
								<tr>
									<td class="tm-product-name">Product Category 3</td>
									<td class="text-center"><a href="#"
										class="tm-product-delete-link"> <i
											class="far fa-trash-alt tm-product-delete-icon"></i>
									</a></td>
								</tr>
								<tr>
									<td class="tm-product-name">Product Category 4</td>
									<td class="text-center"><a href="#"
										class="tm-product-delete-link"> <i
											class="far fa-trash-alt tm-product-delete-icon"></i>
									</a></td>
								</tr>
								<tr>
									<td class="tm-product-name">Product Category 5</td>
									<td class="text-center"><a href="#"
										class="tm-product-delete-link"> <i
											class="far fa-trash-alt tm-product-delete-icon"></i>
									</a></td>
								</tr>
								<tr>
									<td class="tm-product-name">Product Category 6</td>
									<td class="text-center"><a href="#"
										class="tm-product-delete-link"> <i
											class="far fa-trash-alt tm-product-delete-icon"></i>
									</a></td>
								</tr>
								<tr>
									<td class="tm-product-name">Product Category 7</td>
									<td class="text-center"><a href="#"
										class="tm-product-delete-link"> <i
											class="far fa-trash-alt tm-product-delete-icon"></i>
									</a></td>
								</tr>
								<tr>
									<td class="tm-product-name">Product Category 8</td>
									<td class="text-center"><a href="#"
										class="tm-product-delete-link"> <i
											class="far fa-trash-alt tm-product-delete-icon"></i>
									</a></td>
								</tr>
								<tr>
									<td class="tm-product-name">Product Category 9</td>
									<td class="text-center"><a href="#"
										class="tm-product-delete-link"> <i
											class="far fa-trash-alt tm-product-delete-icon"></i>
									</a></td>
								</tr>
								<tr>
									<td class="tm-product-name">Product Category 10</td>
									<td class="text-center"><a href="#"
										class="tm-product-delete-link"> <i
											class="far fa-trash-alt tm-product-delete-icon"></i>
									</a></td>
								</tr>
								<tr>
									<td class="tm-product-name">Product Category 11</td>
									<td class="text-center"><a href="#"
										class="tm-product-delete-link"> <i
											class="far fa-trash-alt tm-product-delete-icon"></i>
									</a></td>
								</tr>
							</tbody>
						</table>
					</div>
					table container
					<button class="btn btn-primary btn-block text-uppercase mb-3">
						Add new category</button>
				</div>
			</div> -->
		</div>
	</div>
	<footer class="tm-footer row tm-mt-small">
		<div class="col-12 font-weight-light">
			<p class="text-center text-white mb-0 px-4 small">
				Copyright &copy; <b>2018</b> All rights reserved. Design: <a
					rel="nofollow noopener" href="https://templatemo.com"
					class="tm-footer-link">Template Mo</a>
			</p>
		</div>
	</footer>
	<script src="${base}/js/customer_scripts.js"></script>
	<script src="../js/jquery-3.3.1.min.js"></script>
	<!-- https://jquery.com/download/ -->
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/jquery.simplePagination.js"></script>
	<!-- https://getbootstrap.com/ -->
	<script>
      $(function() {
        $(".tm-product-name").on("click", function() {
          window.location.href = "edit-product";
        });
      });
      
      function DeleteProduct(id) {
			confirm("Thao tác sau đây sẽ xóa tài khoản! Bạn có chắc chắn không? ");
		} 
	
		$( document).ready(function() {
			$("#roleId").val(${searchModel.roleId});
			$("#paging").pagination({
				currentPage: ${usersWithPaging.currentPage},
		        items: ${usersWithPaging.totalItems},
		        itemsOnPage: 4,
		        cssStyle: 'dark-theme',
		        onPageClick: function(pageNumber, event) {
		        	$('#page').val(pageNumber);
		        	$('#btnSearch').trigger('click');
				},
		    });
		});
    </script>
</body>
</html>