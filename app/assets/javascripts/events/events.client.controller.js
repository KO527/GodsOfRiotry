/* jslint indent: false */
/* jshint -W099: false */

'use strict';

angular.module('events').controller('EventsController', ['$scope', 'Events', 'Menus',
	function($scope, Events, Menus) {
		// Events controller logic
		// ...
		$scope.menu = Menus.getMenu('topbar');


		Events.GiveMeImmEvents().success(function(data){
			
			$scope.ImmMonthFestivals = data;
			// if (ImmMonthFestivals.date_tbd == true) {}
		});

		Events.ParsePopularFests().success(function(data){
			
		  	$scope.MonthEvents = data;

		  	var Data = $scope.MonthEvents;
			// Figures out if there is a performer present or not
			$scope.IsPerformerPres = function(index, CurrPerformer){
		  		console.log('Success');
		  		for (var Tax in Data.events.performers.taxonomies){
		  			if (Tax.name === 'concert'){
		  				this.perfomers[index].CurrPerformer.PerformerPres = true;
		  			}
		  			else{
						this.performers[index].CurrPerformer.PerformerPres = false;
		  			}
		  		}
			};
		});
		
	           Events.SuggEvents().success(function(data){
		 	$scope.SuggEvents = data;
		});

	}
 ]);
