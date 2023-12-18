<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
  <!-- Basic -->
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <!-- Mobile Metas -->
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <!-- Site Metas -->
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta name="author" content="" />
  <link rel="shortcut icon" href="images/favicon.png" type="">

  <title> 노웨잇(eat) </title>

  <!-- bootstrap core css -->
  <link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.css" />

  <!--owl slider stylesheet -->
  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
  <!-- nice select  -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css" integrity="sha512-CruCP+TD3yXzlvvijET8wV5WxxEh5H8P4cmz0RFbKK6FlZ2sYl3AEsKlLPHbniXKSrDdFewhbmBK5skbdsASbQ==" crossorigin="anonymous" />
  <!-- font awesome style -->
  <link href="/resources/css/font-awesome.min.css" rel="stylesheet" >

  <!-- Custom styles for this template -->
  <link href="/resources/css/style.css" rel="stylesheet" />
  <!-- responsive style -->
  <link href="/resources/css/responsive.css" rel="stylesheet" />
<script src="/resources/jquery/jquery-3.3.1.min.js"></script>
</head>

<body>
    <!-- header section strats -->
    <header class="header_section" style="background-color: black;">
      <div class="container">
        <nav class="navbar navbar-expand-lg custom_nav-container ">
          <c:choose>
           	<%-- 로그인 하지 않았을 경우 --%>
           	  <c:when test="${member eq null}">
		        <a class="navbar-brand" href="/">
		          <span>NOWAIT</span>
		        </a>

		        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		          <span class=""> </span>
		        </button>

          		<div class="collapse navbar-collapse" id="navbarSupportedContent">
		            <ul class="navbar-nav  mx-auto ">
		              <li class="nav-item active">
		                <a class="nav-link" href="/">Home <span class="sr-only">(current)</span></a>
		              </li>
				    </ul>
				    <div class="user_option">
				    	<a href="/choice" class="order_online">회원가입/로그인</a>
				    </div>
				</div>  
              </c:when>
              	
              	<%-- 로그인 했을 경우 --%>
              	<c:otherwise>
              		<%-- 사장로그인 --%>
              		<c:if test="${result eq 1}">
              		
              		  	<a class="navbar-brand" href="/owner/ownerHome">
				          <span>NOWAIT</span>
				        </a>
		
				        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
				          <span class=""> </span>
				        </button>
		
		          		<div class="collapse navbar-collapse" id="navbarSupportedContent">
	              			<ul class="navbar-nav  mx-auto ">
				              	<li class="nav-item active">
					                <a class="nav-link" href="/owner/ownerHome">${member.ownerId}님, 환영합니다<span class="sr-only">(current)</span></a>
				              	</li>
					            <li class="nav-item">
					            	<a class="nav-link" href="/store/storeNewRegister">새 가게등록</a>
					            </li>
					            <li class="nav-item">
					            	<a class="nav-link" href="/store/storeExistRegister">기존 가게등록</a>
					            </li>
			    			</ul>
				            <div class="user_option">
				            	<a href="/owner/ownerMypage" class="user_link">
					            	<i class="fa fa-user" aria-hidden="true"></i>
					            </a>
				            	<a class="order_online" href="/owner/ownerLogout">로그아웃</a>
				            </div>
		            	</div>
              		</c:if>
              		
              		<%-- 회원로그인 --%>
              		<c:if test="${result eq 2}">
              			
              			<a class="navbar-brand" href="/user/userHome">
				          <span>NOWAIT</span>
				        </a>
		
				        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
				          <span class=""> </span>
				        </button>
		
		          		<div class="collapse navbar-collapse" id="navbarSupportedContent">
	              			<ul class="navbar-nav  mx-auto ">
				              	<li class="nav-item active">
					                <a class="nav-link" href="/user/userHome">${member.userId}님, 환영합니다<span class="sr-only">(current)</span></a>
				              	</li>
		              			<li class="nav-item">
					            	<a class="nav-link" href="/order/userOrderList">주문내역</a>
					            </li>
					            <li class="nav-item">
					            	<a class="nav-link" href="/board/userReview">리뷰내역</a>
					            </li>
					            <li class="nav-item">
					            	<a class="nav-link" href="/user/serviceCenter">고객센터</a>
					            </li>
			    			</ul>
				            <div class="user_option">
				              <a href="/user/userGet" class="user_link">
				                <i class="fa fa-user" aria-hidden="true"></i>
				              </a>
				              <a href="/order/orderCart" class="cart_link" >
				                <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 456.029 456.029" style="enable-background:new 0 0 456.029 456.029;" xml:space="preserve">
				                  <g>
				                    <g>
				                      <path d="M345.6,338.862c-29.184,0-53.248,23.552-53.248,53.248c0,29.184,23.552,53.248,53.248,53.248
				                   c29.184,0,53.248-23.552,53.248-53.248C398.336,362.926,374.784,338.862,345.6,338.862z" />
				                    </g>
				                  </g>
				                  <g>
				                    <g>
				                      <path d="M439.296,84.91c-1.024,0-2.56-0.512-4.096-0.512H112.64l-5.12-34.304C104.448,27.566,84.992,10.67,61.952,10.67H20.48
				                   C9.216,10.67,0,19.886,0,31.15c0,11.264,9.216,20.48,20.48,20.48h41.472c2.56,0,4.608,2.048,5.12,4.608l31.744,216.064
				                   c4.096,27.136,27.648,47.616,55.296,47.616h212.992c26.624,0,49.664-18.944,55.296-45.056l33.28-166.4
				                   C457.728,97.71,450.56,86.958,439.296,84.91z" />
				                    </g>
				                  </g>
				                  <g>
				                    <g>
				                      <path d="M215.04,389.55c-1.024-28.16-24.576-50.688-52.736-50.688c-29.696,1.536-52.224,26.112-51.2,55.296
				                   c1.024,28.16,24.064,50.688,52.224,50.688h1.024C193.536,443.31,216.576,418.734,215.04,389.55z" />
				                    </g>
				                  </g>
				                  <g>
				                  </g>
				                  <g>
				                  </g>
				                  <g>
				                  </g>
				                  <g>
				                  </g>
				                  <g>
				                  </g>
				                  <g>
				                  </g>
				                  <g>
				                  </g>
				                  <g>
				                  </g>
				                  <g>
				                  </g>
				                  <g>
				                  </g>
				                  <g>
				                  </g>
				                  <g>
				                  </g>
				                  <g>
				                  </g>
				                  <g>
				                  </g>
				                  <g>
				                  </g>
				                </svg>
				              </a>
				              <div class="user_option">
				            	<a class="order_online" href="/user/userLogout">로그아웃</a>
				              </div>
				            </div>
              			</div>
              		</c:if>
              	</c:otherwise>
              </c:choose>
        </nav>
      </div>
    </header>
    <!-- end header section -->
</body>
</html>