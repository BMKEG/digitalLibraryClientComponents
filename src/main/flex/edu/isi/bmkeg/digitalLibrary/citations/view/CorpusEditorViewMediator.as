package edu.isi.bmkeg.digitalLibrary.citations.view
{
	import edu.isi.bmkeg.digitalLibrary.citations.events.CorpusRetrievedEvent;
	import edu.isi.bmkeg.digitalLibrary.citations.events.UserRequestCorpusEditorEvent;
	import edu.isi.bmkeg.digitalLibrary.citations.events.UserRequestRetrieveCorpusEvent;
	import edu.isi.bmkeg.digitalLibrary.citations.events.UserRequestSaveCorpusEvent;
	import edu.isi.bmkeg.digitalLibrary.model.citations.Corpus;
	
	import flash.events.Event;
	
	import mx.controls.Alert;
	import mx.managers.PopUpManager;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class CorpusEditorViewMediator extends Mediator
	{
		
		[Inject]
		public var view:CorpusEditorView;
		
		override public function onRegister():void
		{
			
			addViewListener(UserRequestSaveCorpusEvent.SAVE,userRequestSaveCorpusHandler);
			addViewListener(UserRequestCorpusEditorEvent.CLOSE,dispatch);
			addViewListener(CorpusEditorView.CORPUS_ID_CHANGED,corpusIdChangedHandler);
			
			addContextListener(CorpusRetrievedEvent.CORPUS_RETRIEVED,corpusRetrievedHandler);

		}
		
		private function corpusRetrievedHandler(event:CorpusRetrievedEvent):void
		{
			var corpus:Corpus = event.corpus;
			view.loadCorpusFields(corpus);
		}
		
		private function userRequestSaveCorpusHandler(event:UserRequestSaveCorpusEvent):void
		{
			dispatch(new UserRequestCorpusEditorEvent(UserRequestCorpusEditorEvent.CLOSE));
			dispatch(event);
		}
		
		private function corpusIdChangedHandler(event:Event):void
		{
			if (view.corpusId == -1)
			{
				view.clearFormFields();
			}
			else
			{
				dispatch(new UserRequestRetrieveCorpusEvent(view.corpusId));
			}
		}
		
	}
}