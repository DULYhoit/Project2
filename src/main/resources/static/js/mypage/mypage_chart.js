var ctx4 =document.getElementById('myChart2');
var ctx3 = document.getElementById('myChart');

//막대그래프
var myChart = new Chart(ctx3, { 
    type: 'bar', 
    data: { labels: ['', '1', '', '2', '', '3','','4','','5'], 
            datasets: [{ label: '별점분포', 
						 data: [
							22, 
							19, 
							45, 
							50, 
							85, 
							44, 
							46, 
							12, 
							88, 
							63], 
            backgroundColor: [ 'rgba(255, 204, 000)', 
                               'rgba(255, 204, 000)', 
                               'rgba(255, 204, 000)', 
                               'rgba(255, 204, 000)', 
                               'rgba(255, 204, 000)', 
                               'rgba(255, 204, 000)',
                               'rgba(255, 204, 000)',
                               'rgba(255, 204, 000)',
                               'rgba(255, 204, 000)',
                               'rgba(255, 204, 000)'
                             ], 
            borderColor: [     'rgba(255, 204, 000)', 
					           'rgba(255, 204, 000)', 
					           'rgba(255, 204, 000)', 
					           'rgba(255, 204, 000)', 
					           'rgba(255, 204, 000)', 
					           'rgba(255, 204, 000)',
					           'rgba(255, 204, 000)',
					           'rgba(255, 204, 000)',
					           'rgba(255, 204, 000)',
					           'rgba(255, 204, 000)'], 
            borderWidth: 1 
            }] 
          }, 
      options: { 
        maintainAspectRatio : false,
        legend : {display : false},
        scales: { 
          xAxes: [{
            gridLines: {
            display:false
            }
          }],
          yAxes: [{ 
            ticks: { 
              beginAtZero: true,
              stepSize : 30 },
            gridLines: {
              display:false
            }
               }] 
              } 
            } 
          }
        ); 
//도넛,파이 작성 2
        var num = Math.random(); 
        var data = { 
          labels: ["공포", "기타", "드라마", "멜로/로맨스", "액션/스릴러/범죄", "코메디", "판타지/SF"], 
          datasets: [ { 
            data: [ 
              Math.random(), 
              Math.random(), 
              Math.random(), 
              Math.random(), 
              Math.random(), 
              Math.random(), 
              Math.random() ], 
            backgroundColor: [ 
              "#f79546", "#9bba57", "#4f81bb", "#5f497a", "#a94069", "#ff5f34", "#41774e"], 
            borderWidth: 0, 
            label: "Dataset 1" 
          }] 
        }; 
        window.onload = function() { 
          var ctx8 = $('#myChart2').get(0).getContext("2d"); 
          window.theChart8 = new Chart(
            ctx8, { 
              type: 'doughnut', 
              data: data, 
              options: { 
                responsive: true, 
                legend: false, 
                maintainAspectRatio : false, 
                animation: false, 
                pieceLabel: { 
                  mode:"label", 
                  position:"border", 
                  fontSize: 11, 
                  fontStyle: 'bold' } 
                } 
              }
            )
        };










/*
    //도넛차트 
    var myChart2 = new Chart(ctx4, { 
    type: 'doughnut', 
    data: { labels: ['로맨스', '액션', '호러', '다큐', '애니매이션'], 
            datasets: [{ label: '별점분포', data: [22, 19, 45, 50, 85], 
            backgroundColor: [ 
            'rgba(051, 204, 102)', 
            'rgba(000, 102, 051)', 
            'rgba(000, 153, 102)', 
            'rgba(051, 153, 102)', 
            'rgba(051, 204, 153)' 
                                
                             ], 
            borderColor: [ 
              'rgba(051, 204, 102)',
              'rgba(000, 102, 051)',
              'rgba(000, 153, 102)',
              'rgba(051, 153, 102)',
              'rgba(051, 204, 153)'], 
            borderWidth: 1 
            }] 
          }, 
      options: { 
        maintainAspectRatio : false,
        legend : {display : false},
        scales: { 
          xAxes: [{
            gridLines: {
            display:false
            }
           
          }],
          yAxes: [{ 
            ticks: { 
              beginAtZero: true,
              stepSize : 30 },
            gridLines: {
              display:false
            }
            
               }] 
              } 
            } 
          }
        ); 

        */