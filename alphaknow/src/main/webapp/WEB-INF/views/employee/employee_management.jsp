<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<body>
	    <div class="wrap_container">
        <div class="management_header">
            사원관리
        </div>
        <div class="employee_info">
            사원의 정보를 표시할 예정
        </div>
        <button type="button" id="show_employee_regedit">사원등록</button>
    </div>


    
    <form>
        <div class="employee_regedit">
            <div class="regedit_header">
                사원등록 <button type="button" id="hide_employee_regedit">x</button>
            </div>
            <table>
                <tr>
                    <td>
                        사원명
                    </td>
                    <td>
                        <input type="text" name="employee_name">
                    </td>
                </tr>
                <tr>
                    <td>
                        휴대전화
                    </td>
                    <td>
                        <input type="number" name="employee_phone">
                    </td>
                </tr>
                <tr>
                    <td>
                        아이디
                    </td>
                    <td>
                        <input type="text" name="employee_id">
                    </td>
                </tr>
                <tr>
                    <td>
                        비밀번호
                    </td>
                    <td>
                        <input type="password" name="employee_pw">
                    </td>
                </tr>
                <tr>
                    <td>
                        비밀번호확인
                    </td>
                    <td>
                        <input type="password">
                    </td>
                </tr>
            </table>
            <button type="submit">등록하기</button>
            <button type="reset">다시쓰기</button>
        </div>
    </form>
</body>
