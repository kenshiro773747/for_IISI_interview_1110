<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh">

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Epicer Admin System</title>

<!-- eLindHead (開始) -->
<%@include file="../includes/eLinkHead.jsp" %>
<!-- eLindHead (結束) -->
<style>
	span {
position:relative;
overflow:hidden;
white-space: nowrap;  
overflow: hidden;  
text-overflow: ellipsis; 
max-width:600px;
display:inline-block;
}
</style>
</head>

<body class="g-sidenav-show   bg-gray-100">

	<!-- ////////////////// 介面最外層框架 //////////////////-->
	<div class="min-height-300 bg-primary position-absolute w-100"></div>
	<!-- ////////////////// Side Navber (開始) //////////////////-->
	
	<%@include file="../includes/eSidenavUser.jsp"%>
	
	<!-- ////////////////// Side Navber (結束) //////////////////-->
	<!-- //////////////////主畫面框架(開始) ////////////////// -->
	<main class="main-content position-relative border-radius-lg ">
		<!-- ////////////////// (Header)Start 上方 Navbar 上方  (要加裝在個人頁面)(從includes/eHead.jsp要拉一個檔案到自己資料夾改)////////////////// -->
		<%@include file="../includes/eHead.jsp"%>
		<!-- ////////////////// End 上方 Navbar //////////////////-->
<!-- ////////////////// 個人主文開始 //////////////////-->
<input type="hidden" id="userId" value="1002" >
<div class="row justify-content-end">
<div class="card col-12 col-md-10 ">
  <div class="recipetable">
<table class="table align-items-center mb-0 w-100"   >
    <colgroup>
			<col width="16%">
			<col width="52%">
			<col width="8%">
			<col width="8%">
			<col width="8%">
			<col width="8%">
		</colgroup>
      <thead>
        <tr>
          <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">食譜名稱</th>
          <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">食譜簡介</th>
          <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">烹調時間</th>
          <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">幾人份</th>
          <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">修改</th>
          <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">刪除</th>
        </tr>
      </thead>
<tbody id="table">

</tbody>
    </table>
  </div>
</div>
</div>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

      <script>
        $(document).ready(function () {
            let userId = Number($('#userId').val());
            $.ajax({
                type: 'get',
                url: `userrecipe/` + userId,
                dataType: 'json',
                complete: function (data) {
                    for (var x = 0; x < data.responseJSON.length; x++) {
                    console.log(data.responseJSON[x].recipeName)
                      let content=  `
                            <tr>
                            <form name="Form" action="/recipe/`+ data.responseJSON[x].recipeId + `" method="POST">
                             <input type="hidden" name="_method" value="DELETE" >
                              <td>
                                <div class="d-flex px-2 py-1">
                                  <div>
                                    <img src="https://demos.creative-tim.com/soft-ui-design-system-pro/assets/img/team-2.jpg" class="avatar avatar-sm me-3">
                                  </div>
                                  <div class="d-flex flex-column justify-content-center">
                                    <h6 class="mb-0 text-xs"><a href="${pageContext.request.contextPath}/reciperesult/` + data.responseJSON[x].recipeId + `">` + data.responseJSON[x].recipeName + `</h6>
                                  </div>
                                </div>
                              </td>
                              <td>
                                <span class="badge badge-sm badge-success" style="color: blue">`+ data.responseJSON[x].recipeDescription + `</span>
                              </td>
                              <td class="align-middle text-center text-sm">
                                <span class="badge badge-sm badge-success" style="color: blue">`+ data.responseJSON[x].cookTime + `</span>
                              </td>
                              <td class="align-middle text-center">
                                <span class="text-secondary text-xs font-weight-bold">`+ data.responseJSON[x].howManyPeople + `</span>
                              </td>
                              <td class="align-middle">
                                <a href="${pageContext.request.contextPath}/recipeForUpdate/` + data.responseJSON[x].recipeId + `">修改</a>
                              </td>
                               <td class="align-middle">
                               <input type="submit" value="刪除">
                              </td>
                              </form>
                            </tr> `

                          $("#table").append(content)
                    }
                }

            })
        })
    </script>
<!-- ////////////////// 個人主文結束 //////////////////-->
		<!--////////////////// Footer(開始) //////////////////-->
		<%@include file="../includes/eFooter.jsp"%>
		<!-- ////////////////// Footer(結束) //////////////////-->

		
		<!-- ////////////////// 中間主畫面(結束) ////////////////// -->
	</main>
	<!-- ////////////////// 主畫面框架(結束) //////////////////-->

	<!-- ////////////////// (右上設定鈕)Sidenav Type 調整樣式 ////////////////// -->
	<!-- ////////////////// Sidebar Backgrounds 開始 //////////////////-->
	<%@include file="../includes/eSidenavTypeSetting.jsp"%>
	<!-- ////////////////// Sidebar Backgrounds 結束 ////////////////// -->

	<!-- ////////////////// 框架Script url (開始)(不能少) ////////////////// -->
	<%@include file="../includes/eScriptForBody.jsp"%>
	<!-- ////////////////// 框架Script (結束) //////////////////-->

</body>

</html>