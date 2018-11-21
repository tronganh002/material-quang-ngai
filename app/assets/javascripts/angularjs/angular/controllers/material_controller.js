'use strict';

angular.module('userApp')
  .controller('materialController', materialController);

materialController.$inject = ['materialService', 'Flash', '$scope'];
function materialController(materialService, Flash, $scope) {
  var vm = this;

  vm.initData = function(statistic, materials){
    vm.statistic = statistic;
    vm.materials = materials;
    $scope.tab = _.first(materials).id;
    vm.materialIdSelected = $scope.tab;
    vm.showCreate = _.isEmpty(vm.statistic);
  };

  $scope.setTab = function(newTab){
    $scope.tab = newTab;
    vm.materialIdSelected = newTab;
    var params = {
      material_id: vm.materialIdSelected
    };
    materialService.getStatistic(params)
    .then(function(resp){
      vm.statistic = resp.statistic;
      vm.showCreate = _.isEmpty(vm.statistic);
    })
    .catch(function(err){
      Flash.create('danger', 'Remove error' + err);
    })
    vm.showEdit[statistic.id] = false;
  };

  $scope.isSet = function(tabNum){
    return $scope.tab === tabNum;
  };

  vm.showEdit = function(statistic){
    vm.showEdit[statistic.id] = !vm.showEdit[statistic.id];
    assignStatistic(statistic);
  }
  vm.remove = function(statistic){
    var confirm = window.confirm("Xoá dòng này?");
    if (confirm != true) {
      return;
    }
    var params = {
      id: statistic.id,
      material_id: vm.materialIdSelected
    };
    materialService.remove(params)
    .then(function(resp){
      vm.statistic = resp.statistic;
    })
    .catch(function(err){
      Flash.create('danger', 'Remove error' + err);
    })
    vm.showEdit[statistic.id] = false;
  }

  vm.update = function(statistic){
    var params = {
      time: vm.timeEdit,
      mass: vm.massEdit,
      price: vm.priceEdit,
      id: statistic.id,
      material_id: vm.materialIdSelected
    };
    materialService.update(params)
    .then(function(resp){
      vm.statistic = resp.statistic;
    })
    .catch(function(err){
      Flash.create('danger', 'Remove error' + err);
    })
    vm.showEdit[statistic.id] = false;
  }

  var assignStatistic = function(statistic){
    vm.priceEdit = statistic.price;
    vm.massEdit = statistic.mass;
    vm.timeEdit = statistic.time_input;
  }

  vm.submit = function(){
    var params = {
      time: vm.time,
      mass: vm.mass,
      price: vm.price,
      material_id: vm.materialIdSelected
    };

    materialService.create(params)
    .then(function(resp){
      vm.statistic = resp.statistic;
    })
    .catch(function(err){
      Flash.create('danger', 'Remove error' + err);
    })
    vm.showCreate = _.isEmpty(vm.statistic);
  };
}
