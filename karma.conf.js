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
      transform: [ 'coffeeify', 'jadeify' ]
    },
    browsers: ['Chrome'],
    //browser: ['PhantomJS'],
    //browsers: ['PhantomJS','Chrome'],
    files: ['./test/*.test.coffee']
  });
};
