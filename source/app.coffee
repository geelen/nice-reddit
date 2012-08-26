app = angular.module('redditlulz', [])

app.controller "Main", ($scope, $http, $routeParams) ->
  $http.jsonp("http://www.reddit.com/r/explainlikeimfive/comments/pcxo7/im_a_creationist_because_i_dont_understand.json?jsonp=JSON_CALLBACK").success (data) ->
    window.data = data
    $scope.title = data[0].data.children[0].data.title
    $scope.topcomment = new Showdown.converter().makeHtml(data[1].data.children[0].data.body)

app.config ($locationProvider) ->
  $locationProvider.html5Mode(true).hashPrefix("!")
app.config ($routeProvider) -> $routeProvider
  .when("/show/:article", controller: "Main", templateUrl: "article.html")
  .otherwise(redirectTo: '/show/evolution')
