package edu.isi.bmkeg.digitalLibrary.citations.view
{
	import edu.isi.bmkeg.digitalLibrary.citations.events.UserRequestCorpusEditorEvent;
	import edu.isi.bmkeg.digitalLibrary.model.citations.Corpus;
	
	import flash.display.DisplayObject;
	import flash.events.Event;
	
	import mx.events.FlexEvent;
	
	import org.robotlegs.mvcs.Mediator;
	
	import spark.components.PopUpAnchor;
	
	public class CorpusEditorPopupAnchorViewMediator extends Mediator
	{
		
		[Inject]
		public var view:CorpusEditorPopupAnchorView;
		
		override public function onRegister():void
		{
		
			// Has to manually create mediator for popup views
			if (PopUpAnchor(viewComponent).popUp != null)
			{
				addPopUpListeners();
			}
			else
			{
				addViewListener("popUpChanged",popUpChangedEventHandler);				
			}
			
			addContextListener(UserRequestCorpusEditorEvent.OPEN, userRequestCorpusEditorOpenEventHandler);
			addContextListener(UserRequestCorpusEditorEvent.CLOSE, userRequestCorpusEditorCloseEventHandler);
			
		}
		
		override public function onRemove():void
		{
			if (PopUpAnchor(viewComponent).popUp != null)
			{
				removePopUpListeners();
			}
		}
		
		private function userRequestCorpusEditorOpenEventHandler(event:UserRequestCorpusEditorEvent):void 
		{
			openCorpusEditor(event.corpusId);
		}

		private function userRequestCorpusEditorCloseEventHandler(event:UserRequestCorpusEditorEvent):void 
		{
			closeCorpusEditor();
		}

		public function openCorpusEditor(corpusId:int):void
		{
//			corporaView.enabled = false;
			if (view.form)
			{
				view.form.clearFormFields();					
			}
			view.openForm();
			view.form.corpusId = corpusId;
		}

		public function closeCorpusEditor():void
		{
			view.closeForm();
//			corporaView.enabled = true;
		}

		//////////////////////////////////////////////
		//////////////////////////////////////////////
		// Creation and destruction of Mediators for PopUp Views
		// Has to be handle manually
		////////////////////////////////////////////
		////////////////////////////////////////////
		private function addPopUpListeners():void
		{
			var popUp:CorpusEditorView = PopUpAnchor(viewComponent).popUp as CorpusEditorView;
			
			if (popUp)
			{
				popUp.addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
				popUp.addEventListener(Event.REMOVED_FROM_STAGE, removedFromStageHandler);	
				
				if (popUp.stage && !mediatorMap.hasMediatorForView(popUp))
				{
					// popUp is already added to stage but not mediarted
					mapMediator(popUp);
				}				
			}
		}
		
		private function removePopUpListeners():void
		{
			PopUpAnchor(viewComponent).popUp.removeEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
			PopUpAnchor(viewComponent).popUp.removeEventListener(Event.REMOVED_FROM_STAGE, removedFromStageHandler);
		}
		
		private function popUpChangedEventHandler(event:Event):void
		{
			if (PopUpAnchor(viewComponent).popUp != null)
			{
				addPopUpListeners();
			}
		}
		
		// TODO Handle manual removal of mediator
		
		private function creationCompleteHandler(event:FlexEvent):void
		{
			mediatorMap.createMediator(event.target);			
		}

		private function addedToStageHandler(event:Event):void
		{
			var popup:CorpusEditorView = event.target as CorpusEditorView;
			if (popup)
			{
				mapMediator(popup);	
			}
		}

		private function removedFromStageHandler(event:Event):void
		{
			mediatorMap.removeMediatorByView(event.target);			
		}
		
		private function mapMediator(popup:CorpusEditorView):void
		{
			mediatorMap.createMediator(popup);			
		}
		
		
	}
}