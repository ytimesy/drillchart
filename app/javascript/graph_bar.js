window.addEventListener('load', function(){
  
  let ctx = document.getElementById('myChart');
  let titleTexts = [ `テックキャンプ  問題  理解度 グラフ`, `総合学習(${chartTitles[category].length}問)  理解度`, `基礎コース(${chartTitles[category].length}問)  理解度`, `応用コース(${chartTitles[category].length}問)  理解度`, `ドリル基礎(${chartTitles[category].length}問)  理解度`, `ドリル応用(${chartTitles[category].length}問)  理解度`];

if(category == 0){
  let myChart = new Chart(ctx, {
    type: 'bar',
    data: {
      labels: chartTitles[category],
      datasets: [{
        label: 'パーセント（％）',
        data: [Math.floor(totalScores[0]/totalMaxScores[0]*100), Math.floor(totalScores[1]/totalMaxScores[1]*100), Math.floor(totalScores[2]/totalMaxScores[2]*100), Math.floor(totalScores[3]/totalMaxScores[3]*100), Math.floor(totalScores[4]/totalMaxScores[4]*100)],
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
          text: titleTexts[category],
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
}else{
  let myChart = new Chart(ctx, {
    type: 'bar',
    data: {
      labels: chartTitles[category],
      datasets: [{
        label: 'パーセント（％）',
        data: chartScores[category],
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
          text: titleTexts[category],
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
}

  
});