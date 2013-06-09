package edu.isi.bmkeg.digitalLibrary.citations.view
{
	
	import edu.isi.bmkeg.digitalLibrary.citations.events.UserRequestArticleEditorEvent;
	
	import mx.controls.Alert;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class ActionControlCitationListItemRendererMediator extends Mediator
	{
		[Inject]
		public var view:ActionControlCitationListItemRenderer;
		
		override public function onRegister():void
		{
			addViewListener(UserRequestArticleEditorEvent.OPEN, dispatch);
		}
	}
}