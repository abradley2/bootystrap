// karma.conf.js
module.exports = function(config) {
  config.set({
    frameworks: ['mocha','browserify'],
    preprocessors: {
      'test/**/*.coffee': [ 'browserify' ]
    },
    reporters: ['nyan'],

    nyanReporter: {
      suppressErrorReport: true,
      suppressErrorHighlighting: true
    },
    browserify: {
      debug: true,
      transform: [ 'coffeeify', 'stringify' ]
    },
    browsers: ['PhantomJS'],
    files: ['./test/**/*.test.coffee']
  });
};
