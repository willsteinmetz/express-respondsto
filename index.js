
/*
 * @file index.coffee
 * @author Will Steinmetz
 * This Express middleware provides basic functionality similar to the
 * respond_to method.
 */
var defaultExtension, determineExtension, setDefaultExtension;

defaultExtension = 'html';

determineExtension = function(req, res, next) {
  var format, formatRegex, respondToRegex;
  respondToRegex = /\.\w+$/;
  format = req.url.match(respondToRegex);
  req.format = defaultExtension;
  if (format != null) {
    req.format = format[0].replace(/^\./, '');
  }
  if (format != null) {
    formatRegex = new RegExp((format[0].replace('.', '\.')) + "$");
    req.url = req.url.replace(formatRegex, '');
  }
  return next();
};

setDefaultExtension = function(extension) {
  if (extension != null) {
    return defaultExtension = extension;
  }
};

module.exports = {
  determineExtension: determineExtension,
  setDefaultExtension: setDefaultExtension
};

//# sourceMappingURL=index.js.map
