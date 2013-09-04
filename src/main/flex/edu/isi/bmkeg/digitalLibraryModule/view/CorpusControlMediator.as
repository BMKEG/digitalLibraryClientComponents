package edu.isi.bmkeg.digitalLibraryModule.view
{
	import edu.isi.bmkeg.digitalLibrary.model.citations.*;
	import edu.isi.bmkeg.digitalLibrary.model.qo.citations.*;
	import edu.isi.bmkeg.digitalLibrary.events.*;
	import edu.isi.bmkeg.digitalLibrary.rl.events.*;
	import edu.isi.bmkeg.digitalLibraryModule.model.*;
	import edu.isi.bmkeg.digitalLibraryModule.view.forms.*;
	import edu.isi.bmkeg.digitalLibraryModule.events.*;
	import edu.isi.bmkeg.vpdmf.model.instances.LightViewInstance;

	import mx.managers.PopUpManager;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class CorpusControlMediator extends Mediator
	{
		[Inject]
		public var view:CorpusControl;
		
		[Inject]
		public var model:DigitalLibraryModel;
		
		override public function onRegister():void
		{
									
			// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
			// list the corpora. 
			addViewListener(ListCorpusEvent.LIST_CORPUS, dispatch);
			addContextListener(ListCorpusResultEvent.LIST_CORPUS_RESULT, 
				listCorpusResultHandler);
			
			addViewListener(FindCorpusByIdEvent.FIND_CORPUS_BY_ID, 
				dispatchFindCorpusById);
			addContextListener(FindCorpusByIdResultEvent.FIND_CORPUSBY_ID_RESULT, 
				handleLoadedTargetCorpus);
	
			addViewListener(ActivateCorpusPopupEvent.ACTIVATE_CORPUS_POPUP, 
				activateCorpusPopup);

			addViewListener(ListArticleCitationPagedEvent.LIST_ARTICLECITATION_PAGED, 
				dispatch);
			
			// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
			// On loading this control, we first list all the corpora on the server
			dispatch(new ListCorpusEvent(new Corpus_qo()));
			
		}

		public function listCorpusResultHandler(event:ListCorpusResultEvent):void {
			view.corpusList = model.corpora;
		}

		
		public function dispatchFindCorpusById(event:FindCorpusByIdEvent):void {
			
			model.corpus = new Corpus();
			model.corpus.vpdmfId = event.id;

			var ac:ArticleCitation_qo = new ArticleCitation_qo();
			var c:Corpus_qo = new Corpus_qo();			
			ac.corpora.addItem(c);
			
			c.vpdmfId = String(model.corpus.vpdmfId);
				
			this.dispatch(new ListArticleCitationPagedEvent(
				ac, 0, model.listPageSize));
			
			this.dispatch( event );
			
		}
		
		private function activateCorpusPopup(e:ActivateCorpusPopupEvent):void {

			var popup:CorpusPopup = new CorpusPopup();

			PopUpManager.addPopUp( popup, contextView ); 
			mediatorMap.createMediator( popup );

			if( e.corpus == null || e.corpus.name == null )			
				popup.cName.text = "";
			else 
				popup.cName.text = e.corpus.name;
				
			if( e.corpus == null || e.corpus.description == null )			
				popup.desc.text = "";
			else 
				popup.desc.text = e.corpus.description;
				
			popup.vpdmfId = e.corpus.vpdmfId;
			
		}
		
		private function handleLoadedTargetCorpus(event:FindCorpusByIdResultEvent):void {

			this.view.corpus = event.object;
	
			var acQ:ArticleCitation_qo = new ArticleCitation_qo();
			var corpQ:Corpus_qo = new Corpus_qo();
			acQ.corpora.addItem(corpQ);
			
			corpQ.name = model.corpus.name;
			corpQ.vpdmfId = model.corpus.vpdmfId + "";
			
			this.dispatch( new ListArticleCitationPagedEvent(acQ, 0, 300) );

		}
		
		// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		// Reset everything
		//
		public function clearCorpusHandler(event:ClearCorpusEvent):void {

			view.currentState = "empty";
			view.corpusCombo.selectedIndex = -1;
			dispatch(new ListCorpusEvent(new Corpus_qo()));
			
		}

		
	}
	
}