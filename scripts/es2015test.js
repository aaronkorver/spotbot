"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
// Description:
//   test es2015 compatability

exports.default = function (robot) {
  robot.respond(/do you speak es6\?/, function (res) {
    res.send("HELL TO THE YES. IMMA BOSS LIKE FULLER");
  });
};

module.exports = exports['default'];
