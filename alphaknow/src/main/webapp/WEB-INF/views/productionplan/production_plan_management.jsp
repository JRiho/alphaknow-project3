<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.spring.alphaknow.dto.ppmDTO.ProductPlanManagementDTO"%>

	<form id=myForm method="post">
		<!-- content -->
		<div id="content">

			<!-- div id="headerj" 시작 -->
			<div id="headerj">생산계획관리</div>
			<!-- div id="headerj" 끝 -->

			<!-- updiv -->
			<div class="updiv">

				<!-- header1 div -->
				<div id="header1_div">
					<!-- 버튼 div -->

					<div id="btn_wrap_div">
						<button type="button" id="btn_auto">계획불러오기</button>
						<button type="button" id="btn_add">추가</button>
						<button type="button" id="btn_add_end">추가완료</button>
						<button type="button" id="btn_modify">수정</button>
						<button type="button" id="btn_modify_end">수정완료</button>
						<button type="button" id="btn_delete">삭제</button>
					</div>
				</div>
				<!-- header1 div 끝 -->

				<div id="plan_table_div">

					<table id="plan_table">
						<thead id="plan_table_thead">

						</thead>
						<%
						List list = (List) request.getAttribute("list");
						%>

						<tbody id="plan_table_tbody">
							<%
							try {
								for (int i = 0; i < list.size(); i++) {
									ProductPlanManagementDTO item = (ProductPlanManagementDTO) list.get(i);
							%>
							<tr>
								<td class="checkboxcell" style="text-align: center;"><input
									type="checkbox" class="table1_chkChild" name="chkChild"
									value=<%=item.getPpc()%>></td>
								<td><input type="text" name="planCode"
									value=<%=item.getPpc()%> readonly></td>
								<td><input type="text" name="itemCode"
									value=<%=item.getItemCode()%> readonly></td>
								<td><input type="text" name="itemName"
									value=<%=item.getItemName()%> readonly></td>
								<td><input type="text" name="deliveryPlace"
									value=<%=item.getDeliveryPlace()%> readonly></td>
								<td><input type="text" name="deliveryAmount"
									value=<%=item.getDeliveryAmount()%> readonly></td>
								<td><input type="text" name="productionAmount"
									value=<%=item.getProductionAmount()%> readonly></td>
								<td><input type="text" name="remainAmount"
									value=<%=item.getRemainAmount()%> readonly></td>
								<td><input type="date" name="startdate"
									value=<%=item.getStartdate()%> readonly></td>
								<td><input type="date" name="enddate"
									value=<%=item.getEnddate()%> readonly></td>
							</tr>
							<%
							}
							} catch (Exception e) {
							e.printStackTrace();
							}
							%>
						</tbody>
					</table>

				</div>


			</div>
			<!-- updiv 끝 -->

		</div>
		<!-- content 끝! -->









		<div id="alarm_wrap">
			<div id="message_div">
				<span id="message">메세지입니다.</span>
			</div>
			<div id="alarm_btn_wrap">
				<button type="button" id="btn_cancel">닫기</button>
				<button type="button" id="btn_ok">확인</button>
			</div>
		</div>

		<div id="overlay"></div>
	</form>

<link rel="stylesheet"
	href="/alphaknow/resources/css/production_plan_management.css">
<script
	src="/alphaknow/resources/js/production_plan_management.js"></script>
