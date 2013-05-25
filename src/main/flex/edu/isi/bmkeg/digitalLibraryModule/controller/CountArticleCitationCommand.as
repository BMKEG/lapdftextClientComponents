package edu.isi.bmkeg.digitalLibraryModule.controller
{	
	import edu.isi.bmkeg.pagedList.events.*;
	
	import edu.isi.bmkeg.digitalLibrary.model.citations.*;

	import edu.isi.bmkeg.digitalLibraryModule.model.DigitalLibraryModel;
	import edu.isi.bmkeg.digitalLibrary.rl.services.IDigitalLibraryService;
	
	import flash.events.Event;
	
	import org.robotlegs.mvcs.Command;
	
	public class CountArticleCitationCommand extends Command
	{
	
		[Inject]
		public var event:CountPagedListLengthEvent;

		[Inject]
		public var model:DigitalLibraryModel;
		
		[Inject]
		public var service:IDigitalLibraryService;
				
		override public function execute():void
		{
			
			service.countArticleCitation(model.queryArticle);
		
		}
		
	}
	
}