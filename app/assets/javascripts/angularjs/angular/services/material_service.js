'use strict';

angular.module('userApp')
  .factory('materialService', ['ajaxLib', materialService]);


function materialService(ajaxLib) {
  return {
    create: create,
    remove: remove,
    update: update,
    getStatistic: getStatistic
  };

  function create(params) {
    return ajaxLib.ajaxCall('POST', '/materials', {data: params});
  }

  function getStatistic(params) {
    return ajaxLib.ajaxCall('GET', '/materials?material_id=' + params.material_id, {data: params});
  }

  function update(params) {
    return ajaxLib.ajaxCall('PATCH', '/materials/' + params.id, {data: params});
  }

  function remove(params) {
    return ajaxLib.ajaxCall('DELETE', '/materials/' + params.id, {data: params});
  }
}
