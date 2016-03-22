chai = require("chai")
expect = chai.expect
respondTo = require("../index")

describe "determineExtension", ->
  it "returns the default extension html", ->
    req = url: "/test-path"
    res = {}
    next = ->

    respondTo.determineExtension req, res, next
    expect(req.format).to.equal "html"

  it "returns the extension json", ->
    req = url: "/test-path.json"
    res = {}
    next = ->

    respondTo.determineExtension req, res, next
    expect(req.format).to.equal "json"

describe "setDefaultExtension", ->
  it "sets the default extension to json", ->
    req = url: "/test-path"
    res = {}
    next = ->

    respondTo.setDefaultExtension 'json'
    respondTo.determineExtension req, res, next
    expect(req.format).to.equal "json"

  it "sets the default extension to json but returns html for the path", ->
    req = url: "/test-path.html"
    res = {}
    next = ->

    respondTo.setDefaultExtension 'json'
    respondTo.determineExtension req, res, next
    expect(req.format).to.equal "html"
