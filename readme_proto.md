### Router Configuration

/category/_:categoryName_/subCategory/_:subCategoryName_/article/_:articleName_/page/:_pageNumber_  

This is the longest absolute route allowed by the router. It can, however, be
many variations of this so long as it remains in the same hierarchal order.  

Per esempio: /category/_:categoryName_/article/_:articleName_/page/1  

or  

/_:articleName_/page/1

There are some rules and effects however.

1. Articles not nested in categories or subcategories can't appear on any
category-based aggregation widget
2. Sub-Categories must be nested in Categories
3. Pages must be nested in Articles
4. Articles with one page do not display the pager widget
5. Categories and SubCategories with one article go directly to page 1 of that article
instead of the article-list view


### Template inheritance

Template inheritance makes it easy to give articles of similar categories and SubCategories
a similar feel while still being able to distinguish them between articles of other
categories and SubCategories.

...TODO...

Template inheritance is _very_ useful if you wish to override the template of a built-in
component but only for a certain category, sub category, or article, but don't want to
override it for the others.

### Custom components

There are several built in components that you may customize and override simple by creating
a component of the same name.

1. syndicate-navbar
2. syndicate-pager
3. syndicae-breadcrumbs

### Moment.js Aggregation of Categories
