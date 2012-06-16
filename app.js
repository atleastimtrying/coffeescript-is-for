(function() {
  var App;
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  App = (function() {

    function App() {
      this.keypress = __bind(this.keypress, this);
      var section, _i, _len, _ref;
      this.position = 0;
      this.sections = $('section');
      _ref = this.sections;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        section = _ref[_i];
        this.setBackground(section);
      }
      this.displaySections();
      $(window).keypress(this.keypress);
    }

    App.prototype.displaySections = function() {
      var section, _i, _len, _ref;
      _ref = this.sections;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        section = _ref[_i];
        $(section).hide();
      }
      return $(this.sections[this.position]).show();
    };

    App.prototype.randomrgb = function() {
      return "rgb(" + (this.roundom(180)) + "," + (this.roundom(180)) + "," + (this.roundom(180)) + ")";
    };

    App.prototype.roundom = function(int) {
      return Math.ceil(Math.random() * int);
    };

    App.prototype.setBackground = function(section) {
      return $(section).css({
        "background-color": this.randomrgb()
      });
    };

    App.prototype.keypress = function(event) {
      if (event.keyCode === 32) {
        return this.changeSection(1);
      } else {
        return this.changeSection(-1);
      }
    };

    App.prototype.normalizePosition = function() {
      if (this.position > this.sections.length) this.position = 0;
      if (this.position < 0) return this.position = this.sections.length;
    };

    App.prototype.changeSection = function(modifier) {
      this.position += modifier;
      this.normalizePosition();
      return this.displaySections();
    };

    return App;

  })();

  $(function() {
    return window.app = new App;
  });

}).call(this);
