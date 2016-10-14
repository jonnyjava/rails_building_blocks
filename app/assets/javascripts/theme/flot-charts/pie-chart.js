function plot_pie_chart(jobRolesPieData){
  $.plot('#pie-chart', jobRolesPieData, {
    series: {
      pie: {
        show: true,
        radius: 1,
        label: {
          show: true,
          radius: 1/1,
          threshold: 0.1,
          formatter: function(label, slice) {
            return "<div class='pie-custom-label'>" + label + "  " + Math.round(slice.percent) + "%</div>";
          },
          background: {
            opacity: 0.5,
            color: '#000'
          }
        },
        stroke: {
          width: 0.75,
        },
      },
    },
    legend: {
      container: '.flc-pie',
      backgroundOpacity: 0.5,
      noColumns: 1,
      backgroundColor: "white",
      lineWidth: 10,
      labelFormatter: function(label, series) {
        return "<div class='bar-custom-label'>" + label + "</div>";
      },
    },
    grid: {
      hoverable: true,
      clickable: true
    },
    tooltip: true,
    tooltipOpts: {
      content: "%p.0%, %s", // show percentages, rounding to 2 decimal places
      shifts: {
        x: 20,
        y: 0
      },
      defaultTheme: false,
      cssClass: 'flot-tooltip'
    }
  });
}
