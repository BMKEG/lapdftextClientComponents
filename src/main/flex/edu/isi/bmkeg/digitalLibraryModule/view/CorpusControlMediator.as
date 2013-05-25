package edu.isi.bmkeg.digitalLibraryModule.view
{
	import edu.isi.bmkeg.digitalLibrary.model.citations.*;
	import edu.isi.bmkeg.digitalLibrary.model.qo.citations.*;
	import edu.isi.bmkeg.digitalLibrary.rl.events.*;
	import edu.isi.bmkeg.digitalLibraryModule.model.DigitalLibraryModel;
	import edu.isi.bmkeg.digitalLibraryModule.events.*;
	import edu.isi.bmkeg.vpdmf.model.instances.LightViewInstance;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class CorpusControlMediator extends Mediator
	{
		[Inject]
		public var view:CorpusControl;
		
		[Inject]
		public var triageModel:DigitalLibraryModel;
		
		override public function onRegister():void
		{
			
//			addViewListener(UserRequestCitationsListFilterChangeToCorpusEvent.CHANGE,dispatch);
						
			// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
			// list the corpora. 
			addViewListener(ListCorpusEvent.LIST_CORPUS, 
				dispatch);
			
			// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
			// When the context loads a corpus, add it to the control
			addContextListener(ListCorpusResultEvent.LIST_CORPUS_RESULT, 
				listCorpusResultHandler);
			
			// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
			// When you select a corpus, load it. 
			addViewListener(FindCorpusByIdEvent.FIND_CORPUS_BY_ID, 
				dispatch);
			
			// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
			// On loading this control, we first list all the corpora on the server
			var c:Corpus_qo = new Corpus_qo();
			dispatch(new ListCorpusEvent(c));
						
		}

		public function listCorpusResultHandler(event:ListCorpusResultEvent):void {
			view.corpusList = triageModel.corpora;
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