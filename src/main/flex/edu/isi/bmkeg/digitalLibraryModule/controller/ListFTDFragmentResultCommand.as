package edu.isi.bmkeg.digitalLibraryModule.controller
{	
	import org.robotlegs.mvcs.Command;
	
	import edu.isi.bmkeg.ftd.rl.services.IFtdService;
	import edu.isi.bmkeg.ftd.model.*;
	import edu.isi.bmkeg.ftd.rl.events.*;
	
	import edu.isi.bmkeg.digitalLibraryModule.model.DigitalLibraryModel;
	
	import edu.isi.bmkeg.vpdmf.model.instances.LightViewInstance;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	
	public class ListFTDFragmentResultCommand extends Command
	{
	
		[Inject]
		public var event:ListFTDFragmentResultEvent;

		[Inject]
		public var model:DigitalLibraryModel;
				
		override public function execute():void
		{
			model.fragments = new ArrayCollection();
			
			for each(var lvi:LightViewInstance in event.list) {
				
				var o:Object = new Object();
				o.vpdmfLabel = lvi.vpdmfLabel;
				o.vpdmfId = lvi.vpdmfId;
				var fields:Array = lvi.indexTupleFields.split(/\<\|\>/);
				var tuple:Array = lvi.indexTuple.split(/\<\|\>/);
				
				for(var i:int=0; i<fields.length; i++) {
					var f:String = fields[i] as String;
					var v:String = tuple[i] as String;			
					if( v == null )
						v = "";
					v = v.replace(/,/,", ");
					o[f]=v;	
				}
				
				model.fragments.addItem(o);
				
			}
								
		}
		
	}
	
}