package edu.isi.bmkeg.digitalLibrary.citations.view
{
	import edu.isi.bmkeg.digitalLibrary.citations.events.UserRequestArticleEditorEvent;
	
	import flash.display.DisplayObject;
	import flash.events.Event;
	
	import mx.events.FlexEvent;
	
	import org.robotlegs.mvcs.Mediator;
	
	import spark.components.PopUpAnchor;
	
	public class ArticleCitationEditorPopupAnchorViewMediator extends Mediator
	{
		
		[Inject]
		public var view:ArticleCitationEditorPopupAnchorView;
		
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
			
			addContextListener(UserRequestArticleEditorEvent.OPEN, userRequestArticleEditorOpenEventHandler);
			addContextListener(UserRequestArticleEditorEvent.CLOSE, userRequestArticleEditorCloseEventHandler);
			
		}
		
		override public function onRemove():void
		{
			if (PopUpAnchor(viewComponent).popUp != null)
			{
				removePopUpListeners();
			}
		}
		
		private function userRequestArticleEditorOpenEventHandler(event:UserRequestArticleEditorEvent):void 
		{
			openArticleCitationEditor(event.vpdmfId);
		}

		private function userRequestArticleEditorCloseEventHandler(event:UserRequestArticleEditorEvent):void 
		{
			closeCorpusEditor();
		}

		public function openArticleCitationEditor(vpdmfId:int):void
		{
//			TODO disable other views that interfere with editing
			if (view.form)
			{
				view.form.clearFormFields();					
			}
			view.openForm();
			view.form.vpdmfId = vpdmfId;
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
			var popUp:ArticleCitationEditorView = PopUpAnchor(viewComponent).popUp as ArticleCitationEditorView;
			
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
			var popup:ArticleCitationEditorView = event.target as ArticleCitationEditorView;
			if (popup)
			{
				mapMediator(popup);	
			}
		}

		private function removedFromStageHandler(event:Event):void
		{
			mediatorMap.removeMediatorByView(event.target);			
		}
		
		private function mapMediator(popup:ArticleCitationEditorView):void
		{
			mediatorMap.createMediator(popup);			
		}
		
		
	}
}