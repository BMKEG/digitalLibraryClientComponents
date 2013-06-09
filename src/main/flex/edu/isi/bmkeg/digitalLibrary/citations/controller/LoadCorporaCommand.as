package edu.isi.bmkeg.digitalLibrary.citations.controller
{
	import edu.isi.bmkeg.digitalLibrary.citations.service.ICorporaService;
	
	import org.robotlegs.mvcs.Command;
	
	public class LoadCorporaCommand extends Command
	{
		
		[Inject]
		public var corporaService:ICorporaService;
		
		override public function execute():void
		{
			corporaService.loadCorpora();	
		}
	}
}