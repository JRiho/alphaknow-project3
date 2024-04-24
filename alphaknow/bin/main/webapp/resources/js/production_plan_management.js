// 실행문
makeTable(1, "#plan_table_thead", 1, 10);
makeColName(1);
checkEvent(1);

// 테이블 생성
function makeTable(tableNum, theadId, x, y) {
	let thead = document.querySelector(theadId);

	for (let i = 1; i <= x; i++) {
		let tr = document.createElement('tr');
		thead.appendChild(tr);
		for (let j = 1; j <= y; j++) {
			let th = document.createElement('th');
			tr.appendChild(th);
			th.setAttribute("id", `thead${tableNum}_${i}_${j}`);
		}
	}
}

// 1줄 추가
function addRow() {
	console.log()
	let tbody = document.getElementById("plan_table_tbody"); // 테이블 ID를 적절히 변경해주세요
	let newRow = tbody.insertRow(tbody.rows.length);

	let cell1 = newRow.insertCell(0);
	cell1.className = "checkboxcell";
	cell1.style.textAlign = "center";
	cell1.innerHTML = '<input type="checkbox" class="table1_chkChild" checked>';

	let cell2 = newRow.insertCell(1);
	cell2.innerHTML = "<input type='text' name='planCodeAdd' value='' placeholder='자동생성됩니다.' readonly>";
	let cell3 = newRow.insertCell(2);
	cell3.innerHTML = "<input type='text' name='itemCodeAdd' value='' placeholder='num'>";
	let cell4 = newRow.insertCell(3);
	cell4.innerHTML = "<input type='text' name='itemNameAdd' value='' placeholder='str'>";
	let cell5 = newRow.insertCell(4);
	cell5.innerHTML = "<input type='text' name='deliveryPlaceAdd' value='' placeholder='str'>";
	let cell6 = newRow.insertCell(5);
	cell6.innerHTML = "<input type='text' name='deliveryAmountAdd' value='' placeholder='num'>";
	let cell7 = newRow.insertCell(6);
	cell7.innerHTML = "<input type='text' name='productionAmountAdd' value='' placeholder='num'>";
	let cell8 = newRow.insertCell(7);
	cell8.innerHTML = "<input type='text' name='remainAmountAdd' value='' placeholder='num'>";
	let cell9 = newRow.insertCell(8);
	cell9.innerHTML = "<input type='date' name='startdateAdd' value='' placeholder='xxxx-xx-xx'>";
	let cell10 = newRow.insertCell(9);
	cell10.innerHTML = "<input type='date' name='enddateAdd' value='' placeholder='xxxx-xx-xx'>";
}


// 컬럼명 생성
function makeColName(tableNum) {
	let checkbox = document.createElement("input");
	checkbox.type = "checkbox";
	checkbox.classList.add("table1_chkAll");
	checkbox.setAttribute("name", "chkAll");
	document.querySelector(`#thead${tableNum}_1_1`).appendChild(checkbox);
	document.querySelector(`#thead${tableNum}_1_2`).appendChild(document.createTextNode("생산계획코드"))
	document.querySelector(`#thead${tableNum}_1_3`).appendChild(document.createTextNode("품목코드"))
	document.querySelector(`#thead${tableNum}_1_4`).appendChild(document.createTextNode("제품명"))
	document.querySelector(`#thead${tableNum}_1_5`).appendChild(document.createTextNode("납품처"))
	document.querySelector(`#thead${tableNum}_1_6`).appendChild(document.createTextNode("납품요구수량"))
	document.querySelector(`#thead${tableNum}_1_7`).appendChild(document.createTextNode("생산계획수량"))
	document.querySelector(`#thead${tableNum}_1_8`).appendChild(document.createTextNode("예상보유재고"))
	document.querySelector(`#thead${tableNum}_1_9`).appendChild(document.createTextNode("착수일"))
	document.querySelector(`#thead${tableNum}_1_10`).appendChild(document.createTextNode("완료일"))
}

// 전체선택 이벤트
function checkEvent(tableNum) {

	document.querySelector(`.table${tableNum}_chkAll`).addEventListener("click", function(e) {
		if (document.querySelector(`.table${tableNum}_chkAll`).checked == true) {
			document.querySelectorAll(`.table${tableNum}_chkChild`).forEach(function(chkChild) {
				chkChild.checked = true;
			})
		} else {
			document.querySelectorAll(`.table${tableNum}_chkChild`).forEach(function(chkChild) {
				chkChild.checked = false;
			})
		}
	})

	let checkboxes = document.querySelectorAll(`.table${tableNum}_chkChild`);

	checkboxes.forEach(function(checkbox) {
		checkbox.addEventListener("click", function(e) {
			let allbox = checkboxes.length;
			let nowbox = 0;

			checkboxes.forEach(function(checkbox) {
				if (checkbox.checked) {
					nowbox++;
				}
			});

			if (allbox === nowbox) {
				document.querySelector(`.table${tableNum}_chkAll`).checked = true;
			} else {
				document.querySelector(`.table${tableNum}_chkAll`).checked = false;
			}
		});
	});

}

// 알람기능
function showAlarm(message) {
	let alarm = document.querySelector("#alarm_wrap");
	let overlay = document.querySelector("#overlay");
	let txt = document.querySelector("#message");

	txt.innerHTML = "<span id='message'>" + message + "</span>"

	alarm.style.cssText = "display: block;"
	overlay.style.cssText = "display: block;"
}
function hideAlarm() {
	let alarm = document.querySelector("#alarm_wrap");
	let overlay = document.querySelector("#overlay");

	alarm.style.cssText = "display: none;"
	overlay.style.cssText = "display: none;"
}

// 랜덤코드생성
function randomNumber() {
	let randomNumber = Math.floor(Math.random() * 100000000);
	return randomNumber.toString().padStart(8, '0');
}

// 버튼클릭기능
window.addEventListener("load", function() {
	let btnOk = document.querySelector("#btn_ok")
	let btnCancel = document.querySelector("#btn_cancel")
	// 취소버튼 기능 미리넣기
	btnCancel.addEventListener("click", function() {
		hideAlarm();
	})

	document.querySelector("#btn_auto").addEventListener("click", function() {
		function moveLocation() {
			hideAlarm();
			window.location.href = "../alphaknow/ppms"
			btnOk.removeEventListener("click", moveLocation)
		}
		showAlarm("계획을 불러오시겠습니까?");
		btnOk.addEventListener("click", moveLocation);
	});

	document.querySelector("#btn_add").addEventListener("click", function() {
		function doAddRow() {
			hideAlarm();
			addRow();
			document.querySelector("#btn_auto").style.cssText = "display: none;"
			document.querySelector("#btn_add").style.cssText = "display: none;"
			document.querySelector("#btn_modify").style.cssText = "display: none;"
			document.querySelector("#btn_delete").style.cssText = "display: none;"
			document.querySelector("#btn_add_end").style.cssText = "display: inline-block;"
			btnOk.removeEventListener("click", doAddRow)
		}
		showAlarm("계획을 추가합니다.<br>추가 후에는 추가완료 버튼을 꼭 눌러주세요!");
		btnOk.addEventListener("click", doAddRow);
	});

	document.querySelector("#btn_add_end").addEventListener("click", function() {
		function endAdd() {
			hideAlarm();
			document.querySelectorAll('.table1_chkChild:checked').forEach(function(checkbox) {
				checkbox.parentNode.parentNode.querySelectorAll('input[type="text"]').forEach(function(input) {
					input.readOnly = true;
				});
				checkbox.checked = false;
			});

			document.getElementById('myForm').action = "/alphaknow/ppm/insert"
			btnOk.type = "submit";

			document.querySelector("#btn_auto").style.cssText = "display: inline-block;"
			document.querySelector("#btn_add").style.cssText = "display: inline-block;"
			document.querySelector("#btn_modify").style.cssText = "display: inline-block;"
			document.querySelector("#btn_delete").style.cssText = "display: inline-block;"
			document.querySelector("#btn_add_end").style.cssText = "display: none;"
			btnOk.removeEventListener("click", endAdd);
		}
		showAlarm("추가를 완료합니다.");
		btnOk.addEventListener("click", endAdd);
	});

	document.querySelector("#btn_modify").addEventListener("click", function() {
		function doModify() {
			function okIsOut() {
				hideAlarm();
				btnOk.removeEventListener("click", okIsOut);
			}
			if (document.querySelectorAll('.table1_chkChild:checked').length === 0) {
				showAlarm("수정할 계획을 선택해 주세요.");
				btnOk.addEventListener("click", okIsOut);
			} else if (document.querySelectorAll('.table1_chkChild:checked').length > 1) {
				showAlarm("수정은 하나씩만 가능합니다.<br>하나만 선택해서 수정해 주세요.");
				btnOk.addEventListener("click", okIsOut);
			} else {
				hideAlarm();
				document.querySelectorAll('.table1_chkChild:checked').forEach(function(checkbox) {
					checkbox.parentNode.parentNode.querySelectorAll('input[type="text"]').forEach(function(input, index) {
						input.readOnly = false;
						input.name = input.name + 'Update';
						// 생산계획코드는 수정하면 안됨
						if(index === 0){
							input.readOnly = true;
						}
						// 품목코드부터 focus
						if (index === 1) {
							input.setSelectionRange(input.value.length, input.value.length);
							input.focus();
						}
					});
					checkbox.parentNode.parentNode.querySelectorAll('input[type="date"]').forEach(function(input) {
						input.readOnly = false;
						input.name = input.name + 'Update';
					})
				});
				document.querySelector("#btn_auto").style.cssText = "display: none;"
				document.querySelector("#btn_add").style.cssText = "display: none;"
				document.querySelector("#btn_modify").style.cssText = "display: none;"
				document.querySelector("#btn_delete").style.cssText = "display: none;"
				document.querySelector("#btn_modify_end").style.cssText = "display: inline-block;"
				btnOk.removeEventListener("click", doModify);
			}
		}
		showAlarm("선택한 계획을 수정합니다.<br>수정 후에는 수정완료 버튼을 꼭 눌러주세요!");
		btnOk.addEventListener("click", doModify);
	});


	document.querySelector("#btn_modify_end").addEventListener("click", function() {
		function endModify() {
			hideAlarm();
			document.querySelectorAll('.table1_chkChild:checked').forEach(function(checkbox) {
				checkbox.parentNode.parentNode.querySelectorAll('input[type="text"]').forEach(function(input) {
					input.readOnly = true;
				});
			});

			document.getElementById('myForm').action = "/alphaknow/ppm/update"
			btnOk.type = "submit";

			document.querySelector("#btn_auto").style.cssText = "display: inline-block;"
			document.querySelector("#btn_add").style.cssText = "display: inline-block;"
			document.querySelector("#btn_modify").style.cssText = "display: inline-block;"
			document.querySelector("#btn_delete").style.cssText = "display: inline-block;"
			document.querySelector("#btn_modify_end").style.cssText = "display: none;"
			btnOk.removeEventListener("click", endModify);
		}
		showAlarm("수정을 완료합니다.");
		btnOk.addEventListener("click", endModify);
	});

	document.querySelector("#btn_delete").addEventListener("click", function() {
		function delRow() {
			hideAlarm();

			document.getElementById('myForm').action = "/alphaknow/ppm/delete"
			btnOk.type = "submit";

			//			document.querySelectorAll('.table1_chkChild:checked').forEach(function(checkbox) {
			//				let row = checkbox.parentNode.parentNode;
			//				row.parentNode.removeChild(row);
			//			});
			btnOk.removeEventListener("click", delRow);
		}
		showAlarm("선택한 계획을 삭제합니다.<br>삭제한 뒤에는 내용을 되돌릴 수 없습니다!!");
		btnOk.addEventListener("click", delRow);
	});

//	document.querySelector("#btn_save").addEventListener("click", function() {
//		function okIsSubmit() {
//			hideAlarm();
//			document.querySelector("#myForm").submit();
//			btnOk.removeEventListener("click", okIsSubmit);
//		}
//		showAlarm("계획을 저장합니다.");
//		btnOk.addEventListener("click", okIsSubmit);
//	});
});