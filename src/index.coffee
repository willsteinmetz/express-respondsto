###
# @file index.coffee
# @author Will Steinmetz
# This Express middleware provides basic functionality similar to the
# respond_to method.
###

determineExtension = (req, res, next) ->
  respondToRegex = /\.\w+$/
  format = req.url.match(respondToRegex)
  req.format = 'html'
  req.format = format[0].replace(/^\./, '') if format?
  # update the value of URL to router properly
  if format?
    formatRegex = new RegExp("#{format[0].replace('.', '\.')}$")
    req.url = req.url.replace(formatRegex, '')
  next()

module.exports = {
  determineExtension
}
