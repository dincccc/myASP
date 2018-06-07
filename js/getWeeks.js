$(function(){
    var date=new Date();
    var year=date.getFullYear();
    var month=date.getMonth()+1;
    var day=date.getDate();
    var now=year+"-"+month+"-"+day;
    var td = TodayInfo('2018-2-28',now)
    console.log(now+"||"+td.week);
    $(".msg-time-weeks").html(td.week); 
    $(".msg-time-all").html(year+"年"+month+"月"+day+"日"); 
})
function TodayInfo(start,today) {
    var WEEKLEN = 7,
        WEEKDAYS = [
            '一',
            '二',
            '三',
            '四',
            '五',
            '六',
            '日'
        ],
        weekInfo = {
            'week': null,
            'day': null
        }, // 初始化返回信息，默认第null周，星期null  
        oneDay = 24 * 60 * 60 * 1000, // 一天的毫秒时长  
        weekLeave, // 开学当天所在周剩余天数  
        weekStart, // 开学当天start是星期几 
        dateDiff, // 今天与开学当天日期差  
        sDate; //开学之日，日期对象  
    var rDateStr = /\d{4}[\/-]\d{1,2}[\/-]\d{1,2}/g; // 简单的日期格式校验：XXXX/XX/XX  
    if (!rDateStr.test(start)) {
        alert('请使用合法的开学日期！！！');
        return weekInfo;
    }
    sDate = new Date(start);
    weekStart = sDate.getDay();
    weekStart = weekStart === 0 ? 7 : weekStart; // JS中周日的索引为0，这里转换为7，方便计算  
    weekLeave = WEEKLEN - weekStart;
    today = new Date(today)|| new Date();
    weekInfo.day = WEEKDAYS[today.getDay()];
    today = new Date(today.getFullYear() + '-' + (today.getMonth() + 1) + '-' + today.getDate());
    dateDiff = today - sDate;
    if (dateDiff < 0) {
        alert(start+'还没开学！');
        return weekInfo;
    }
    dateDiff = parseInt(dateDiff / oneDay);
    weekInfo.week = Math.ceil((dateDiff - weekLeave) / WEEKLEN) + 1;
    return weekInfo;
}
