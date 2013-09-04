package edu.isi.bmkeg.digitalLibraryModule.controller
{	
	import edu.isi.bmkeg.digitalLibrary.events.*;
	import edu.isi.bmkeg.digitalLibrary.services.IExtendedDigitalLibraryService;
	import edu.isi.bmkeg.digitalLibraryModule.model.DigitalLibraryModel;
	import edu.isi.bmkeg.vpdmf.model.instances.LightViewInstance;
	
	import flash.events.Event;
	
	import mx.collections.*;
	
	import org.robotlegs.mvcs.Command;

	public class ListTermViewsResultCommand extends Command
	{
	
		[Inject]
		public var event:ListTermViewsResultEvent;

		[Inject]
		public var model:DigitalLibraryModel;
		
		override public function execute():void
		{
			
			var colorId:int = 0;
			for each (var viewTree:String in event.termList) {
				var o:Object = {'tree':viewTree, 'colorId':colorId++};	
				model.terms.addItem(o);
			}
			
			var srt:Sort = new Sort();
			srt.fields = [new SortField("tree")];
			model.terms.sort = srt;
			model.terms.refresh();
			
		}
		
	}
	
}