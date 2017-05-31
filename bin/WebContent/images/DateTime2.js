function tick(language) {
var isnMonth_cn = new	Array('1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月');
var isnDay_cn = new Array('星期日','星期一','星期二','星期三','星期四','星期五','星期六','星期日');
var isnMonth_en = new	Array('JAN.','FEB.','MAR.','APR.','MAY.','JUN.','JUL.','AUG.','SEP.','OCT.','NOV.','DEC.');
var isnDay_en = new Array('SUN','MON','TUE','WED','THU','FRI','SAT','SUN');
today = new Date () ;
Year=today.getYear();
Date1=today.getDate();
if (document.all){
	if(language=="cn"){
		document.write(Year+'年'+isnMonth_cn[today.getMonth()]+Date1+'日　'+isnDay_cn[today.getDay()])}
	else if(language=="en"){
		document.write(isnMonth_en[today.getMonth()]+Date1+','+Year+'　'+isnDay_en[today.getDay()])}
}}