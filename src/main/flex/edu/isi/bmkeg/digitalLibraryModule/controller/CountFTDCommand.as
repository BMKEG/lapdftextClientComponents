package edu.isi.bmkeg.digitalLibraryModule.controller
{	
	import edu.isi.bmkeg.pagedList.events.*;
	
	import edu.isi.bmkeg.digitalLibraryModule.model.DigitalLibraryModel;
	
	import edu.isi.bmkeg.ftd.rl.events.CountFTDEvent;
	import edu.isi.bmkeg.ftd.rl.services.IFtdService;
	
	import flash.events.Event;
	
	import org.robotlegs.mvcs.Command;
	
	public class CountFTDCommand extends Command
	{
	
		[Inject]
		public var event:CountFTDEvent;

		[Inject]
		public var model:DigitalLibraryModel;
		
		[Inject]
		public var service:IFtdService;
				
		override public function execute():void
		{
			service.countFTD(event.object);
		}
		
	}
	
}