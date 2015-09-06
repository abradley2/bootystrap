module.exports = {
  username: 'Tony'
  password: 'Password'

  appSetings:
    theme: 'flatly'

  navlinks: [
    {
      id: 1
      type: 'article'
      guid: 'wetpohawptoghawe'
      name: 'Category One Article One'
      staticName: 'CategoryOneArticleOne'
      author: 'Tony Bradley'
      publishDate: '99/88/44'
      summary: 'This is the summary of Category One Article One'
    }
    {
      id: 2
      type: 'category'
      guid: '09823523tjpwegp32985239h'
      name: 'Category One'
      staticName: 'CategoryOne'
      articles: [
        3
        4
      ]
    }
    {
      id: 1
      type: 'categoryGroup'
      guid: 'oht09842uihhru8y34ueeeaw'
      name: 'Category Group One'
      staticName: 'CategoryGroupOne'
      categoryIds: [
        4
        5
      ]
    }
  ]

  viewModels: [

  ]

  templates: [
    # {id: 'syndicate-navbar'}
  ]

  articleGroups: [

  ]

  categoryGroups: [
    {
      id: 1
      type: 'categoryGroup'
      guid: 'oht09842uihhru8y34ueeeaw'
      name: 'Category Group One'
      staticName: 'CategoryGroupOne'
      categoryIds: [
        4
        5
      ]
    }
  ]

  articles: [
    {
      id: 1
      type: 'article'
      guid: 'wetpohawptoghawe'
      name: 'Category One Article One'
      staticName: 'CategoryOneArticleOne'
      author: 'Tony Bradley'
      publishDate: '99/88/44'
      summary: 'This is the summary of Category One Article One'
    }
    {
      id: 2
      type: 'article'
      guid: 'aeptohoifjewyere'
      name: 'Category One Article Two'
      staticName: 'CategoryOneArticleTwo'
      author: 'Sammi Bradley'
      publishDate: '55/33/11'
      summary: 'This is the summary of Category One Article Two'
    }
    {
      id: 3
      type: 'article'
      guid: 'uwgpuherpiuhgiw'
      name: 'SubCategory Two Article One'
      staticName: 'SubCategoryTwoArticleOne'
      author: 'Vito Bradley'
      publishDate: '55/33/11'
      summary: 'This is the summary of SubCategory Two Article One'
    }
    {
      id: 4
      type: 'article'
      guid: 'wetpoietophwegpohgwe'
      name: 'SubCategory Two Article Two'
      staticName: 'SubCategoryTwoArticleTwo'
      author: 'Vito Bradley'
      publishDate: '55/33/11'
      summary: 'This is the summary of SubCategory Two Article Two'
    }
    {
      id: 5
      type: 'article'
      guid: 'giugerbjth348y7eroihger'
      name: 'Category Three Article One'
      staticName: 'CategoryThreeArticleOne'
      author: 'Charlie Bradley'
      publishDate: '11/55/66'
      summary: 'This is the summary of Category Three Article One'
    }
  ]

  categories: [
    {
      id: 1
      type: 'category'
      guid: '09823523tjpwegp32985239h'
      name: 'Category One'
      staticName: 'CategoryOne'
      articles: [
        1
        2
      ]
    }
    {
      id: 2
      type: 'category'
      guid: 'oht09842uihhru8y34ueeeaw'
      name: 'Category Two'
      staticName: 'CategoryTwo'
      articles: [
        1
        3
      ]
    }
    {
      id: 3
      type: 'category'
      guid: 'haegihwegisdjghwhtpoewvmns'
      name: 'Category Three'
      staticName: 'CategoryThree'
      viewModel: 'default'
      template: 'default'
      articles: [
        3
      ]
    }
    {
      id: 4
      type: 'category'
      guid: 'sgpohwepothewgnaeaetwayn'
      name: 'Category Group One: A'
      staticName: 'CategoryGroupOneA'
      articles: [
        4
      ]
    }
    {
      id: 5
      type: 'category'
      guid: 'rtiovjnehikejetopiaweteei'
      name: 'Category Group One: B'
      staticName: 'CategoryGroupOneB'
      articles: [
        5
      ]
    }
  ]

  images: [

  ]

  documents: [

  ]

}
