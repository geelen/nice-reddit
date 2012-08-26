app = angular.module('redditlulz', [])

app.controller "Main", ($scope, $http, $routeParams) ->
  articles = {
    evolution: "/r/explainlikeimfive/comments/pcxo7/im_a_creationist_because_i_dont_understand"
    obamacare: "/r/explainlikeimfive/comments/vb8vs/eli5_what_exactly_is_obamacare_and_what_did_it"
    'israel-palestine': "/r/explainlikeimfive/comments/j2d9r/ok_heres_a_really_difficult_oneisrael_and"
  }

  url = articles[$routeParams.article]
  if url?
    $http.jsonp("http://www.reddit.com#{url}.json?jsonp=JSON_CALLBACK").success (data) ->
      window.data = data
      $scope.title = data[0].data.children[0].data.title
      $scope.topcomment = new Showdown.converter().makeHtml(data[1].data.children[0].data.body)
  else
    $scope.title = "Nothing found..."

app.config ($locationProvider) ->
  $locationProvider.html5Mode(true).hashPrefix("!")
app.config ($routeProvider) -> $routeProvider
  .when("/show/:article", controller: "Main", templateUrl: "article.html")
  .otherwise(redirectTo: '/show/evolution')
