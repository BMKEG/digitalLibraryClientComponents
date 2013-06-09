package edu.isi.bmkeg.digitalLibrary.citations.testutils
{
    import flash.events.Event;
    import flash.events.EventDispatcher;
    import flash.events.IEventDispatcher;

	/**
	 * Based on MockEventDispatcher from kanbanapp application distributed with the robotlegs book.
	 **/
    public class MockEventDispatcher implements IEventDispatcher
    {
        private var eventDispatcher:EventDispatcher = new EventDispatcher();
		
        public var dispatchedEvents:Array = [];

		public function get dispatchedEventTypes():Array
		{
			return dispatchedEvents.map(function(item:*, index:int, array:Array):Object {return Event(item).type;});
		}
		
		public function resetDispatchedEvents():void
		{
			dispatchedEvents.length = 0;
		}
		
        public function addEventListener(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false):void
        {
            eventDispatcher.addEventListener(type, listener, useCapture, priority, useWeakReference);
        }

        public function removeEventListener(type:String, listener:Function, useCapture:Boolean = false):void
        {
            eventDispatcher.removeEventListener(type, listener, useCapture);
        }

        public function dispatchEvent(event:Event):Boolean
        {
            dispatchedEvents.push(event);
            return eventDispatcher.dispatchEvent(event);
        }

        public function hasEventListener(type:String):Boolean
        {
            return true;
        }

        public function willTrigger(type:String):Boolean
        {
            return eventDispatcher.willTrigger(type);
        }

        public function MockEventDispatcher()
        {
        }
    }
}