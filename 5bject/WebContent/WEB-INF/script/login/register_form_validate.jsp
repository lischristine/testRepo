<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.Enumeration" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset=" UTF-8">
		<title>Sign Up form</title>
		<script type="text/javascript">
		</script>
		<style type="text/css">
			/* css 설정 */
			.error{
				color: red;
				face: impact;
				font-size : 2;
			}
	
			header{
				background-color: lightblue;
				color: white;
				text-align: left;
				padding: 20px;
			}
	
			footer{
				background-color: lightblue;
				color: white;
				padding-top: 20px;
				text-align: center;
				height: 100px;
				clear: both;
			}
		</style> 
	</head>
	<body>
		<header>
		</header>

		<spring:hasBindErrors name="members"/> 
			<form action="/5bject/member/register_form_validate.do" method="post">
				<table>
					<tr>
						<td colspan="2" align="center">
							<h1><font color="skyblue">Sign Up</font></h1>
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center"><font color="skyblue">회원가입</font></td>
					</tr>
					<tr>
						<td colspan="2"><b>ID</b></td>
					</tr>
					<tr>
						<td>
							<input type="text" name="id" value="${ requestScope.members.id }" placeholder="사용할 아이디를 입력하세요." size="25" maxlength="25" />
							<span class="error"><form:errors path = "members.id"/></span>
						</td>
						<td></td>
					</tr>
					<tr>
						<td colspan="2"><b>Password</b></td>
					</tr>
					<tr>
						<td>
							<input type="password" name="password" value="${ requestScope.members.password }" placeholder="비밀번호를 입력하세요." size="25" maxlength="25" />
							<span class="error"><form:errors path="members.password" delimiter=" - "/></span>
						</td>
						<td></td>
					</tr>
					<tr>
						<td colspan="2"><b>Name</b></td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="text" name="name" id="name" value="${requestScope.members.name}" placeholder="이름을 입력하세요" autofocus="autofocus" />
							<span class="error"><form:errors path = "members.name" delimiter=" - "/></span>
						</td>
					</tr>
					<tr>
						<td colspan="2"><font color="white">BLANK</font></td>
					</tr>
					<tr>
						<td colspan="2"><b>생년월일</b></td>
					</tr>
					<tr>
						<td colspan="2">
							<select name="month">
								<option>선택하세요</option>
								<option>January</option>
								<option>Fabruary</option>
								<option>March</option>
								<option>April</option>
								<option>May</option>
								<option>June</option>
								<option>July</option>
								<option>August</option>
								<option>October</option>
								<option>November</option>
								<option>December</option>
							</select>
							<select name="day">
								<c:forEach var="num" begin="1" end="31">
									<option>${ num }</option>
								</c:forEach>
								<!--
								<option>0</option>
								<option>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
								<option>5</option>
								<option>6</option>
								<option>7</option>
								<option>8</option>
								<option>9</option>
								<option>10</option>
								<option>11</option>
								<option>12</option>
								<option>13</option>
								<option>14</option>
								<option>15</option>
								<option>16</option>
								<option>17</option>
								<option>18</option>
								<option>19</option>
								<option>20</option>
								<option>21</option>
								<option>22</option>
								<option>23</option>
								<option>24</option>
								<option>25</option>
								<option>26</option>
								<option>27</option>
								<option>28</option>
								<option>29</option>
								<option>30</option>
								<option>31</option>
								-->
							</select>
							<input type="number" name="year" value="${ requestScope.members.year }" placeholder="Year" maxlength="4" />
				 			<span class="error"><form:errors path="members.year" delimiter=" - "/></span>
							<span class="error"><form:errors path="members.day" delimiter=" - "/></span>
							<span class="error"><form:errors path="members.month" delimiter=" - "/></span>
						</td>
					</tr>
					<tr>
						<td colspan="2"><b>이메일</b></td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="text" name=emailId value="${requestScope.members.emailId}" placeholder="email을 입력하세요" />@ 
							<select name="emailAddress">
								<option value="선택하세요">선택하세요</option>
								<option value="gmail.com">gmail.com</option>
								<option value="nate.com">nate.com</option>
								<option value="hanmail.net">hanmail.net</option>
								<option value="yahoo.com">yahoo.com</option>
								<option value="naver.com">naver.com</option>
								<option value="hotmail.com">hotmail.com</option>
								<option value="daum.com">daum.com</option>
						</select>
						<span class="error"><form:errors path="members.emailId" delimiter=" - "/></span>
					</td>
				<tr>
					<td colspan="2"><b>성별</b></td>
				</tr>
				<tr>
					<td colspan="2">
						<label>male:<input type="radio" name="gender" value="male" /></label>
						<label>female:<input type="radio" name="gender" value="female" /></label>
						<span class="error"><form:errors path = "members.gender" delimiter=" - "/></span>
					</td>
				</tr>
				<tr>
					<td colspan="2"><b>Phone Number</b> (ex:01012341234)</td>
				</tr>
				<tr>
					<td>
						<input type="number" name="phoneNumber" value="${requestScope.members.phoneNumber}" placeholder="핸드폰 번호를 입력하세요" size="11" maxlength="11" />
						<span class="error"><form:errors path="members.phoneNumber" delimiter=" - "/></span>
					</td>
					<td></td>
				</tr>
				<tr>
					<td><input type="submit" value="회원가입"></td>
					<td></td>
				</tr>
			</table>
			<p>
		</form>

		<footer>
		</footer>
	</body>
</html>