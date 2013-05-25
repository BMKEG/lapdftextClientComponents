package edu.isi.bmkeg.digitalLibraryModule.controller
{	

	import edu.isi.bmkeg.digitalLibraryModule.events.*;
	import edu.isi.bmkeg.ftd.rl.events.FindArticleDocumentByIdEvent;
	import edu.isi.bmkeg.ftd.rl.services.IFtdService;

	import org.robotlegs.mvcs.Command;
	
	public class FindArticleDocumentByIdCommand extends Command {
		
		[Inject]
		public var event:FindArticleDocumentByIdEvent;
		
		[Inject]
		public var service:IFtdService;

		override public function execute():void {
			service.findArticleDocumentById( event.id );	
		}
		
	}
	
}