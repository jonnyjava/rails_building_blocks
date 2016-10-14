function plot_bar_chart(barData, bar_values){
  $.plot($("#bar-chart"), barData, {
    grid : {
      borderWidth: 1,
      borderColor: '#fff',
      show : true,
      hoverable : true,
      clickable : true
    },

    yaxis: {
        tickColor: '#fff',
        show: false,
        tickDecimals: 0,
        font :{
          lineHeight: 13,
          style: "normal",
          color: "#000000",
        },
        shadowSize: 0
    },

    xaxis: {
        tickColor: '#fff',
        ticks: bar_values,
        tickDecimals: 0,
        font :{
            lineHeight: 13,
            style: "normal",
            color: "#00000"
        },
        shadowSize: 1
    },

    legend:{
      container: '.flc-bar',
      backgroundOpacity: 0.5,
      noColumns: 1,
      lineWidth: 1,
      position: 'sw',
      colors: colors,
      sorted: 'reverse',
      labelFormatter: function(label, series) {
        return "<div class='bar-custom-label'>" + label + "</div>";
      },
    }
  });
}

function plot_bar_chart_tooltip(){
  $(".flot-chart").bind("plothover", function (event, pos, item) {
    if (item) {
      var x = item.datapoint[0].toFixed(2),
        y = item.datapoint[1].toFixed(2);
      $(".flot-tooltip").html(item.series.label + " of " + x + " = " + y).css({top: item.pageY+5, left: item.pageX+5}).show();
    }
    else {
      $(".flot-tooltip").hide();
    }
  });
  $("<div class='flot-tooltip' class='chart-tooltip'></div>").appendTo("body");
}
