// karma.conf.js
module.exports = function(config) {
  config.set({
    frameworks: ['mocha','browserify'],
    preprocessors: {
      'test/**/*.coffee': [ 'browserify' ]
    },
    browserify: {
      debug: true,
      transform: [ 'coffeeify' ]
    },
    browsers: ['PhantomJS'],
    files: ['./test/test.test.coffee']
  });
};
