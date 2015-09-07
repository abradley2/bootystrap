class HumbleArticle


  constructor: (params) ->
    console.log 'article params = ',params
    @articleId = params.articleId
    return


module.exports = HumbleArticle
