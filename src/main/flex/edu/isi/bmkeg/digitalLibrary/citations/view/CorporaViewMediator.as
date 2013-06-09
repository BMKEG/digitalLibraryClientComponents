package edu.isi.bmkeg.digitalLibrary.citations.view
{
	import edu.isi.bmkeg.digitalLibrary.citations.events.CorporaUpdatedEvent;
	import edu.isi.bmkeg.digitalLibrary.citations.events.UserRequestCorpusEditorEvent;
	import edu.isi.bmkeg.digitalLibrary.citations.model.CorporaModel;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class CorporaViewMediator extends Mediator
	{
		[Inject]
		public var view:CorporaView;
		
		[Inject]
		public var corporaModel:CorporaModel;
		
		override public function onRegister():void
		{
			addContextListener(CorporaUpdatedEvent.UPDATED, corporaUpdatedHandler);
			
			addViewListener(UserRequestCorpusEditorEvent.OPEN,dispatch);
			
			view.corpora = corporaModel.corpora;
		}
		
		private function corporaUpdatedHandler(event:CorporaUpdatedEvent):void
		{
			view.corpora = corporaModel.corpora;
		}

	}
}