package edu.isi.bmkeg.digitalLibrary.citations.events
{
	import flash.events.Event;
	
	public class LoadCorporaEvent extends Event
	{
		public static const LOAD:String = "LoadCorporaEvent";

		public function LoadCorporaEvent(bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(LOAD, bubbles, cancelable);
		}

		override public function clone():Event
		{
			return new LoadCorporaEvent(bubbles, cancelable)
		}

	}
}