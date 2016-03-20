
/*
 * @file index.coffee
 * @author Will Steinmetz
 * This Express middleware provides basic functionality similar to the
 * respond_to method.
 */
var determineExtension;

determineExtension = function(req, res, next) {
  var format, formatRegex, respondToRegex;
  respondToRegex = /\.\w+$/;
  format = req.url.match(respondToRegex);
  req.format = 'html';
  if (format != null) {
    req.format = format[0].replace(/^\./, '');
  }
  if (format != null) {
    formatRegex = new RegExp((format[0].replace('.', '\.')) + "$");
    req.url = req.url.replace(formatRegex, '');
  }
  return next();
};

module.exports = {
  determineExtension: determineExtension
};

//# sourceMappingURL=index.js.map
