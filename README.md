# express-respondto

express-respondto is an NPM module for Express to add basic functionality similar to the respond_to method in Ruby on Rails. The module is used as a middleware that is added to your application to enable the checking for whether or not an extension is passed as part of a path.

If no extension is found in the path, it will default to the format `html`. The default extension can be overridden by calling the `setDefaultExtension` method before attaching the middleware.

## Using the middleware

The middleware is required like any other module used in your app. For obvious reasons, it requires Express. Once included, pass it into the app. The middleware will automatically parse the URL and set the format parameter of the `req` object.

``` javascript
express = require('express'),
  app = express(),
  respondTo = require('express-respondto');

app.use(respondTo.determineExtension);

/**
 * When the user visits /default, the default HTML template will be rendered.
 * When the user visits /default.json, the json response will be sent to the browser.
 */
app.get('/default', function(req, res, next) {
  switch(req.format) {
    case 'json':
      res.json({ default: 'data' });
    case 'html':
    default:
      res.render('default');
  }
});

/**
 * The default extension is set to html. To override this, use the setDefaultExtension method.
 */
respondTo.setDefaultExtension('json');
```

## Changelog

- __0.2.0__ - Adds the ability to set the default extension
- __0.1.0__ - Initial functionality
