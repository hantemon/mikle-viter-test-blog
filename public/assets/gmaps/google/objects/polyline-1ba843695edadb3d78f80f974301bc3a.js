(function(){var t={}.hasOwnProperty,e=function(e,o){function n(){this.constructor=e}for(var r in o)t.call(o,r)&&(e[r]=o[r]);return n.prototype=o.prototype,e.prototype=new n,e.__super__=o.prototype,e};this.Gmaps.Google.Objects.Polyline=function(t){function o(t){this.serviceObject=t}return e(o,t),o.include(Gmaps.Google.Objects.Common),o.prototype.updateBounds=function(t){var e,o,n,r,s;for(r=this.serviceObject.getPath().getArray(),s=[],o=0,n=r.length;n>o;o++)e=r[o],s.push(t.extend(e));return s},o}(Gmaps.Base)}).call(this);