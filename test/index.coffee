chai = require("chai")
expect = chai.expect
respondTo = require("../index")

describe "determineExtension", ->
  it "returns the default of html", ->
    req = url: "/test-path"
    res = {}
    next = ->

    respondTo.determineExtension req, res, next
    expect(req.format).to.equal "html"

  it "returns the json", ->
    req = url: "/test-path.json"
    res = {}
    next = ->

    respondTo.determineExtension req, res, next
    expect(req.format).to.equal "json"
