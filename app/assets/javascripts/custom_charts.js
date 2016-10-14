$(document).ready(function () {
  colors = ['#f44336','#2196f3','#4caf50','#ff9800','#607d8b'];
  var pie_values = [];
  var pie_labels = [];
  if ($('.js_category_weight')[0]) {
    pie_values =  $('.js_category_weight').data('values').toString().split(',');
    pie_labels =  $('.js_category_weight').data('labels').toString().split(',');
  }
  var jobRolesPieData = [];
  for(var i = 0; i < pie_values.length; i++){
    var slice = {data: pie_values[i], color: colors[i], label: pie_labels[i]};
    jobRolesPieData.push(slice);
  }

  var bar_values = [];
  var bar_labels = [];
  if ($('.js_category_weight')[0]) {
    bar_values = $('.js_top_jobs').data('values').toString().split(',');
    bar_labels = $('.js_top_jobs').data('labels').toString().split(',');
  }
  var barData = new Array();
  for (var i = 0; i < bar_values.length; i++){
    barData.push({
      data : [[bar_values[i], 1]],
      label: bar_labels[i],
      color: colors[i],
      bars : {
        show : true,
        barWidth : 0.25,
        order : i,
        lineWidth: 0,
        fillColor: colors[i],
        horizontal: true}
      });
    }

  if ($('#bar-chart')[0]) {
    plot_bar_chart(barData, bar_values);
  }

  if ($(".flot-chart")[0]) {
    plot_bar_chart_tooltip();
  }

  if($('#pie-chart')[0]){
    plot_pie_chart(jobRolesPieData);
  }

  if ($('.counter-pie')[0]) {
    easyPieChart('counter-pie', 'rgba(255,255,255,0.2)', 'rgba(255,255,255,0.5)', 'rgba(255,255,255,0.7)', 7, 'butt', 74);
  }

  if ($('.js_mini_counter_red')[0]) {
    easyPieChart('js_mini_counter_red', '#fff', '#ccc', '#f44336', 4, 'butt', 95);
  }

  if ($('.js_mini_counter_blue')[0]) {
    easyPieChart('js_mini_counter_blue', '#fff', '#ccc', '#2196f3', 4, 'butt', 95);
  }

  if ($('#js_job_offers_stats_pie')[0]) {
    var pie = $('#js_job_offers_stats_pie');
    var values = pie.data('values').split(',');
    sparklinePie('js_job_offers_stats_pie', values, 60, 60, ['#fff', 'rgba(255,255,255,0.4)'], 0.5, 4);
  }

  if ($('#js_job_applications_stats_pie')[0]) {
    var pie = $('#js_job_applications_stats_pie');
    var values = pie.data('values').split(',');
    sparklinePie('js_job_applications_stats_pie', values, 60, 60, ['#fff', 'rgba(255,255,255,0.4)']);
  }

});

function easyPieChart(id, trackColor, scaleColor, barColor, lineWidth, lineCap, size) {
    $('.'+id).easyPieChart({
        trackColor: trackColor,
        scaleColor: scaleColor,
        barColor: barColor,
        lineWidth: lineWidth,
        lineCap: lineCap,
        size: size
    });
}

function sparklinePie(id, values, width, height, sliceColors) {
  $('#'+id).sparkline(values, {
    type: 'pie',
    width: width,
    height: height,
    sliceColors: sliceColors,
    offset: 0,
    borderWidth: 0
  });
}
