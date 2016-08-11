/* jslint indent: false */
/* jshint -W099: false */

'use strict';

 // var async = require('async');
 // var _ = require('lodash');

function ElimDupl(n, data){
data = _.filter(data, function(info){
	for (var s in info.events){
		for(var i in s.performers){
			var name = i.name;
			while (n < s.performers.length){
				if (name === s.performers[n].name){
					s.performers.splice(s.performers.indexOf(name, n), 1);
					n++;
				}
				else{
					n++;
				}
			}
			n++;
		}
	}
});
}

function ElimTitleWherabouts(data){
	var pattern = /\-/;
	data = _.filter(data, function(info){
		for(var s in info.events){
			if(pattern.exec(s.title)){
				var pos = (s.title).search(pattern);
				s.title = (s.title).slice(0,[pos-1]);
			}
		}
	});
}

function ListAway(data){
	data = _.filter(data, function(info){
		for(var performers in info.events){
			for (var performer in performers){
				if (performer.away_team){
					performers.splice(performers.indexOf(performer, 0), 1);
				}
			}
		}
	});
}



angular.module('events').factory('Events', ['$http',
  // value service --> if month.now/1/year.now
  // value service --> if month.now+2/31/year.now
  function($http) {
	// Events service logic
	// ...
	// Public API
	return {

	  // https://seatgeek.com/concert-tickets/hip-hop
	  // https://seatgeek.com/concert-tickets/pop
	  // https://seatgeek.com/concert-tickets/rap
	  // https://seatgeek.com/tba/festivals/music-festivals/
	   GiveMeImmEvents: function(){
		
		var url = 'http://api.seatgeek.com/2/events?q=hip-hop&sort=datetime_local.asc&sort=score.desc&taxonomies.name=concert&taxonomies.name=music_festival&datetime_local.gte=2015-12-01&datetime_local.lte=2016-01-31&geoip=true&range=100mi';
		var url2 = 'http://api.seatgeek.com/2/events?q=techno&sort=datetime_local.asc&sort=score.desc&taxonomies.name=concert&taxonomies.name=music_festival&datetime_local.gte=2015-12-01&datetime_local.lte=2016-01-31&geoip=true&range=100mi';
		var url3 = 'http://api.seatgeek.com/2/events?q=rap&sort=datetime_local.asc&sort=score.desc&taxonomies.name=concert&taxonomies.name=music_festival&datetime_local.gte=2015-12-01&datetime_local.lte=2016-01-31&geoip=true&range=100mi';
		
		var request = $http.get(url).success(function(data){
	 	console.log('Success');
	 	var n = 1;
		new ElimDupl(n, data);
		new ElimTitleWherabouts(data);
		}).error(function(err){
		console.log('error');
		console.log(err);
		});
		return request;
	  },
	 ParsePopularFests: function(){
		var url = 'http://api.seatgeek.com/2/events?sort=score.desc&geoip=true&range=100mi&datetime_local.gte=2016-01-01&datetime_local.lte=2016-03-01';
		var request = $http.get(url).success(function(data){
		  console.log('success');
		  var n = 1;
		  // new ElimDupl(n, data);
		  new ElimTitleWherabouts(data);
		  new ListAway(data);
		}).error(function(err){
		  console.log('Error');
		  console.log(err);
		});
		return request;
	  },
	SuggEvents: function(){
		var url = 'https://seatgeek.com/concert-tickets/pop';

		 var request = $http.get(url).success(function(data){
		 console.log('success');
		 console.log(data);
		 }).error(function(err){
		   console.log('error');
		   console.log(err);
		 });
		 return request;
	}
  	};
}]);