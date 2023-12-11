<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp" %>
<!DOCTYPE html>
<html lang="en">
    <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
        <thead>
            <tr>
                <th>리뷰등록날짜</th>
                <th>가게이름</th>
                <th>주문메뉴</th>
                <th>주문유형</th>
                <th>리뷰내용</th>
            </tr>
        </thead>                
   	<tbody>
       <c:forEach items="${rVO}" var="review">                                  
           <tr style="cursor:pointer" onclick="location.href='/board/readReview?reviewNum=<c:out value="${review.reviewNum}"/>'">
              <td><fmt:formatDate pattern="yyyy-MM-dd" value="${review.reviewRegdate}"/></td>
              <td><c:out value="${store.storeName}"/></td>
              <td><c:out value="${menu.menuName}"/></td>                                      
              <td><c:out value="${order.reservCheck}"/></td>
              <td><c:out value="${review.reviewContent}"/></td>
           </tr>                                   
        </c:forEach>
     </tbody>
    </table>              
  <!-- end food section -->
  <%@include file="../includes/footer.jsp" %>
</body>
</html>