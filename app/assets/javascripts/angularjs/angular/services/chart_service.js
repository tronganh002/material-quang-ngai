'use strict';

angular.module('userApp')
  .factory('chartService', ['ajaxLib', chartService]);


function chartService(ajaxLib) {
  return {
    getChart: getChart
  };

  function getChart(params) {
    return ajaxLib.ajaxCall('GET', '/statitic_charts?tab=' + params.tabName);
  }
}
