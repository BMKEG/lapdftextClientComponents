package edu.isi.bmkeg.digitalLibraryModule.view
{
	
	import edu.isi.bmkeg.pagedList.events.*;
	import edu.isi.bmkeg.pagedList.model.*;
	
	import edu.isi.bmkeg.ftd.rl.events.*;
	
	import edu.isi.bmkeg.digitalLibrary.rl.events.*;
	import edu.isi.bmkeg.digitalLibrary.model.citations.*;
	import edu.isi.bmkeg.digitalLibrary.model.qo.citations.*;
	
	import edu.isi.bmkeg.digitalLibraryModule.events.*;
	import edu.isi.bmkeg.digitalLibraryModule.model.*;
	import edu.isi.bmkeg.vpdmf.model.instances.LightViewInstance;
	
	import mx.collections.ArrayCollection;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class ArticleCitationListMediator extends Mediator
	{
		[Inject]
		public var view:ArticleCitationList;
		
		[Inject]
		public var listModel:PagedListModel;

		[Inject]
		public var model:DigitalLibraryModel;
		
		override public function onRegister():void
		{
			
			addContextListener(PagedListUpdatedEvent.UPDATED, 
				triageDocumentsListUpdatedHandler);

			addContextListener(ClearCorpusEvent.CLEAR_CORPUS, 
				clearCorpusHandler);
			
			listModel.pageSize = model.listPageSize;
		
		}
		
		private function triageDocumentsListUpdatedHandler(event:PagedListUpdatedEvent):void
		{
			
			view.triageDocumentsList = listModel.pagedList;
			view.listLength = listModel.pagedListLength;
			
		}
				
		// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		// Reset everything
		//
		public function clearCorpusHandler(event:ClearCorpusEvent):void {
			
			view.triageDocumentsList = listModel.pagedList;
			
		}
		
	}
	
}