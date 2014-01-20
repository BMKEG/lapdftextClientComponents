package edu.isi.bmkeg.lapdftextModule.controller
{
	import org.robotlegs.mvcs.Command;
	
	import edu.isi.bmkeg.ftd.rl.services.IFtdService;
	import edu.isi.bmkeg.ftd.model.*;
	import edu.isi.bmkeg.ftd.rl.events.*;
	
	import flash.events.Event;
	
	public class UpdateFTDRuleSetCommand extends Command
	{
		
		[Inject]
		public var event:UpdateFTDRuleSetEvent;
		
		[Inject]
		public var service:IFtdService;
		
		override public function execute():void
		{
			service.updateFTDRuleSet(event.object);
		}
		
	}
	
}