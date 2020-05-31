/********************************************************
 * 윈도우 팝업창 처리 구현
 * @param1: 화면에 띄울 페이지의 URL
 * @param2: 팝업창의 가로 길이
 * @param3: 팝업창의 세로 길이
 * @parma4: 팝업창의 이름
 ********************************************************/
function cmm_window_popup(url, popUpWidth, popUpHeight, popUpName){
	//해상도(1600*1024), 팝업창 크기(700*450) //이렇게 가정
	Top = (window.screen.height-popUpHeight)/3;//(1024-450)/4 >> 191
	//모니터 크기
	Left = (window.screen.width-popUpWidth)/2;//(1600-700)/2 >> 450 
	if(Top<0) Top = 0;
	if(Left<0) Left = 0;
	//options = '';
	options = "location=yes, fullscreen=no, status=no";
	options += ", left=" + Left + ", top=" + Top;
	options += ", width=" + popUpWidth + ", height=" + popUpHeight;
	popUpName = window.open(url, popUpName, options);
}
/////////////////////////////
/*$('#dial_memberList').dialog({
    title: '회원 목록',
    width: 400,
    height: 400,
    closed: false,
    cache: false,
    href: 'memberList.jsp',
    modal: true
    ,toolbar : toolbar
    ,align:'center'
    ,halign:'center'
});*/