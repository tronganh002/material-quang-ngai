'use strict';

angular.module('userApp')
  .factory('revenueService', ['ajaxLib', revenueService]);


function revenueService(ajaxLib) {
  return {
    create: create,
    remove: remove,
    update: update,
    getStatistic: getStatistic
  };

  function create(params) {
    return ajaxLib.ajaxCall('POST', '/revenues', {data: params});
  }

  function getStatistic(params) {
    return ajaxLib.ajaxCall('GET', '/revenues?material_id=' + params.material_id, {data: params});
  }

  function update(params) {
    return ajaxLib.ajaxCall('PATCH', '/revenues/' + params.id, {data: params});
  }

  function remove(params) {
    return ajaxLib.ajaxCall('DELETE', '/revenues/' + params.id, {data: params});
  }
}
