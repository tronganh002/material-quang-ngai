(function() {
  angular.module('userApp', ['ui.bootstrap', 'commonLib', 'ngFlash', 'ngSanitize', 'trNgGrid', 'angularFileUpload', 'angularjs-datetime-picker', 'colorpicker.module'])
    .config(['$httpProvider', '$locationProvider', defaultConfig])
})();
