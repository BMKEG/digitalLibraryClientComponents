package edu.isi.bmkeg.digitalLibrary.citations.view
{
	import edu.isi.bmkeg.digitalLibrary.citations.events.ArticleCitationRetrievedEvent;
	import edu.isi.bmkeg.digitalLibrary.citations.events.JournalRetrievedEvent;
	import edu.isi.bmkeg.digitalLibrary.citations.events.UserRequestArticleEditorEvent;
	import edu.isi.bmkeg.digitalLibrary.citations.events.UserRequestRetrieveArticleEvent;
	import edu.isi.bmkeg.digitalLibrary.citations.events.UserRequestRetrieveJournalEvent;
	import edu.isi.bmkeg.digitalLibrary.citations.events.UserRequestSaveArticleEvent;
	import edu.isi.bmkeg.digitalLibrary.model.citations.ArticleCitation;
	import edu.isi.bmkeg.digitalLibrary.model.citations.Journal;
	
	import flash.events.Event;
	
	import mx.controls.Alert;
	import mx.managers.PopUpManager;
	import mx.utils.StringUtil;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class ArticleCitationEditorViewMediator extends Mediator
	{
		
		[Inject]
		public var view:ArticleCitationEditorView;
		
		override public function onRegister():void
		{
			
			addViewListener(UserRequestSaveArticleEvent.SAVE,userRequestSaveArticleHandler);
			addViewListener(UserRequestArticleEditorEvent.CLOSE,dispatch);
			addViewListener(ArticleCitationEditorView.VPDMF_ID_CHANGED,vpdmfIdChangedHandler);

			addViewListener(ArticleCitationEditorView.JOURNAL_ABBR_CHANGED, journalAbbrChangedHandler);
			
			addContextListener(JournalRetrievedEvent.JOURNAL_RETRIEVED,journalRetrievedHandler);
			addContextListener(ArticleCitationRetrievedEvent.ARTICLE_RETRIEVED,articleRetrievedHandler);
		}
		
		private function journalAbbrChangedHandler(event:Event):void
		{
			view.clearJournalFields();
			if (view.journalAbbr != null && StringUtil.trim(view.journalAbbr).length > 0)
			{
				dispatch(new UserRequestRetrieveJournalEvent(view.journalAbbr));
			}
		}
		
		private function journalRetrievedHandler(event:JournalRetrievedEvent):void
		{
			var journal:Journal = event.journal;
			if (journal)
			{
				view.clearErrorJournalNotFound();
				view.loadJournalFields(journal);
			}
			else
			{
				view.setErrorJournalNotFound();
			}
		}
		
		private function userRequestSaveArticleHandler(event:UserRequestSaveArticleEvent):void
		{
			dispatch(new UserRequestArticleEditorEvent(UserRequestArticleEditorEvent.CLOSE));
			dispatch(event);
		}
		
		private function vpdmfIdChangedHandler(event:Event):void
		{
			if (view.vpdmfId == -1)
			{
				view.clearFormFields();
			}
			else
			{
				dispatch(new UserRequestRetrieveArticleEvent(view.vpdmfId));
			}
		}

		private function articleRetrievedHandler(event:ArticleCitationRetrievedEvent):void
		{
			var article:ArticleCitation = event.article;
			view.loadArticleCitation(article);
		}
		


	}
}