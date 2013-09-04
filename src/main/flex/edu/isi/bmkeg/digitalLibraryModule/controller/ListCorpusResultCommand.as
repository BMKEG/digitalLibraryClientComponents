package edu.isi.bmkeg.digitalLibraryModule.controller
{	
	
	import edu.isi.bmkeg.digitalLibrary.model.citations.Corpus;
	import edu.isi.bmkeg.digitalLibrary.rl.events.ListCorpusResultEvent;
	import edu.isi.bmkeg.digitalLibraryModule.model.DigitalLibraryModel;
	import edu.isi.bmkeg.vpdmf.model.instances.LightViewInstance;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	
	import org.robotlegs.mvcs.Command;
	
	public class ListCorpusResultCommand extends Command
	{
		
		[Inject]
		public var event:ListCorpusResultEvent;
		
		[Inject]
		public var model:DigitalLibraryModel;
		
		
		override public function execute():void
		{
		
			var l:ArrayCollection = new ArrayCollection();
			
			l.addItem(new Object());
			
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
				
				l.addItem(o);
				
			}
			
			model.corpora = l;
			
		}
		
	}
	
}