package edu.isi.bmkeg.digitalLibrary.citations.controller
{
	import edu.isi.bmkeg.digitalLibrary.citations.events.UserRequestSaveArticleEvent;
	import edu.isi.bmkeg.digitalLibrary.citations.service.ICitationsService;
	import edu.isi.bmkeg.digitalLibrary.model.citations.ArticleCitation;
	
	import org.robotlegs.mvcs.Command;
	
	public class SaveArticleCitationCommand extends Command
	{
		
		[Inject]
		public var citationsService:ICitationsService;
		
		[Inject]
		public var event:UserRequestSaveArticleEvent;
		
		override public function execute():void
		{
			var article:ArticleCitation = event.article;
			if (article.vpdmfId == -1)	// Insert new corpus
			{
				citationsService.insertArticle(event.article)
			}
			else
			{
				citationsService.updateArticle(event.article)	
			}
		}
	}
}