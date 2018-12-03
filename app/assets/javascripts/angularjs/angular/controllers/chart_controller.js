'use strict';

angular.module('userApp')
  .controller('chartController', chartController);

chartController.$inject = ['chartService', 'Flash', '$scope'];
function chartController(chartService, Flash, $scope) {
  var vm = this;
  vm.initData = function(dataset, idAdmin){
    vm.dataset = dataset;
    vm.dataMaterial = vm.dataset.datasets[0].data;
    vm.dataMaterialLabel = vm.dataset.datasets[0].label;
    vm.dataRevenues = vm.dataset.datasets[1].data;
    vm.dataRevenuesLabel = vm.dataset.datasets[1].label;
    vm.idAdmin = idAdmin;

    if(vm.idAdmin){
      vm.tabs.push({id: 3, name: "Tổng hợp Chi Phí NVL và Doanh Thu"});
    }

    var options = {
      maintainAspectRatio: false,
      spanGaps: false,
      elements: {
        line: {
          tension: 0.000001
        }
      },
      scales: {
        yAxes: [{
          stacked: true
        }]
      },
      plugins: {
        filler: {
          propagate: false
        },
        'samples-filler-analyser': {
          target: 'chart-analyser'
        }
      }
    };

    var chart = new Chart('chart-0', {
      type: 'line',
      data: vm.dataset,
      options: options
    });


  }

  vm.tabs = [
    {id: 1, name: "Nguyên vật liệu"},
    {id: 2, name: "Doanh thu"}
  ];
  $scope.tab = 1;

  $scope.setTab = function(newTab){
    $scope.tab = newTab;
    var tabName = 'revenue_type';
    if(newTab == 1){
      tabName = 'material_type';
    }else if(newTab == 3){
      tabName = 'all';
    }
    var params = {
      tabName: tabName
    };
    chartService.getChart(params)
    .then(function(resp){
      vm.initData(resp.data_set);
    })
    .catch(function(err){
      Flash.create('danger', 'Remove error' + err);
    })
  };

  $scope.isSet = function(tabNum){
    return $scope.tab === tabNum;
  };

}
