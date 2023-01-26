window.addEventListener('load', function(){
  
  let ctx = document.getElementById('myChart');
  
  let myChart = new Chart(ctx, {
    type: 'bar',
    data: {
      labels: ["基礎コース", "応用コース", "ドリル基礎", "ドリル応用", "総合学習"],
      datasets: [{
        label: 'パーセント（％）',
        data: [Math.floor(0.5*100), Math.floor(0.9*100), Math.floor(0.45*100), Math.floor(0.87*100), Math.floor(0.53*100)],
        backgroundColor: [
              'rgba(255, 99, 132, 0.2)',
              'rgba(54, 162, 235, 0.2)',
              'rgba(255, 206, 86, 0.2)',
              'rgba(75, 192, 192, 0.2)',
              'rgba(75, 100, 192, 0.2)'
        ],
        borderColor: [
              'rgba(255, 99, 132, 1)',
              'rgba(54, 162, 235, 1)',
              'rgba(255, 206, 86, 1)',
              'rgba(75, 192, 192, 1)',
              'rgba(75, 100, 192, 1)'
        ],
        borderWidth: 1,
        borderRadius: 5
      }]
    },
    options: {
      indexAxis: 'y',
      plugins: {
        title: {
          display: true,
          text: 'テックキャンプ問題  理解度  グラフ',
          font:{
            size: 30,
            weight: 600
          },
          color: '#666',
          padding: {
            top: 10,
            bottom: 30
          }
        }
      },
      scales: {
          y: {
          beginAtZero: true,
          display: true,
          text: 'ラベル',
            font:{
            size: 180,
            weight: 300
          },
          color: '#666'
        }
      }
    }  
  });

  
});