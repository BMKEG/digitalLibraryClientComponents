package edu.isi.bmkeg.digitalLibrary.citations.model
{
	import edu.isi.bmkeg.digitalLibrary.citations.events.CitationsListFilterChangedEvent;
	
	import org.robotlegs.mvcs.Actor;

	public class CitationsListFilterModel extends Actor
	{
		
		public  static const FILTER_CRITERIA_ALL:int = 0;
		public static const  FILTER_CRITERIA_CORPUS:int = 1;
		
		private var _filterCriteria:int;
		private var _corpusName:String;
//		private var _corpusIndex:int;

		public function CitationsListFilterModel()
		{
			_filterCriteria = FILTER_CRITERIA_ALL; // The default
		}
		
		public function get filterCriteria():int
		{
			return _filterCriteria;
		}
		
		public function get corpusName():String
		{
			return _corpusName;
		}
	
		public function setFilterToAll():void
		{
			_filterCriteria = FILTER_CRITERIA_ALL;
			dispatchEvent();
		}
		
		public function setFilterToCorpus(corpusName:String):void
		{
			_filterCriteria = FILTER_CRITERIA_CORPUS;
			_corpusName = corpusName;
			dispatchEvent();
		}
		
		private function dispatchEvent():void
		{
			var event:CitationsListFilterChangedEvent = new CitationsListFilterChangedEvent();
			dispatch(event);			
		}
	}
}