<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="../common/header.jsp" %>


	<style>
		/*table css*/
		table{
			width: 100%;
			border-collapse: collapse;
		}
		th,td{
			border: 1px solid #ddd;
			padding: 12px;
			text-align: left; 
		}
		th{
			background-color: #4CAF50;
			color: white;
		}
		tr:nth-child(even){ /*ap dung cho dong chan*/
			background-color: #f2f2f2;
		} /*lay the con ben trong: even:chan, odd:le*/ 
		tr:hover{
			background-color: #dddd;
		}
		
		
	</style>
		<div class="container">
			<h2>商品管理</h2>
			<a class="btn" href="./create">新規登録</a>
			<table>
				<thead>
					<tr>
						<th>ID</th>
						<th>商品名</th>
						<th>価格</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>Product 1</td>
						<td>2980</td>
					</tr>
					<tr>
						<td>2</td>
						<td>Product 2</td>
						<td>3980</td>
					</tr>
					<tr>
						<td>3</td>
						<td>Product 3</td>
						<td>1980</td>
					</tr>
					
				</tbody>
<!--		<c:forEach items="${products}" var="c">-->
<!--			<tr>-->
<!--				<td>${c.id}</td>-->
<!--				<td>${c.productName}</td>-->
<!--				<td>${c.price}</td>-->
<!--				<td>${c.categoryId}</td>-->

<!--			</tr>-->
<!--		</c:forEach>-->
	</table>
		</div>
	</div>
<%@ include file="../common/footer.jsp" %>