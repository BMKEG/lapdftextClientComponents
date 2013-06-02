package edu.isi.bmkeg.digitalLibraryModule.controller
{	
	
	import edu.isi.bmkeg.digitalLibraryModule.model.DigitalLibraryModel;
	
	import edu.isi.bmkeg.ftd.events.*;
	import edu.isi.bmkeg.ftd.rl.events.*;
	
	import flash.events.Event;
	
	import org.robotlegs.mvcs.Command;
	
	public class RunRuleSetCompleteCommand extends Command
	{
	
		[Inject]
		public var event:RunRuleSetEvent;		
				
		override public function execute():void {
			
		}
		
	}
	
}