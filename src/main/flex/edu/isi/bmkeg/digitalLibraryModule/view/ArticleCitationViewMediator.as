package edu.isi.bmkeg.digitalLibraryModule.view
{

	import edu.isi.bmkeg.pagedList.*;
	import edu.isi.bmkeg.pagedList.model.*;

	import edu.isi.bmkeg.ftd.model.*;
	import edu.isi.bmkeg.ftd.model.qo.*;
	import edu.isi.bmkeg.ftd.rl.events.*;

	import edu.isi.bmkeg.digitalLibrary.model.citations.*;
	import edu.isi.bmkeg.digitalLibrary.model.qo.citations.*;
	import edu.isi.bmkeg.digitalLibrary.rl.events.*;
	
	import edu.isi.bmkeg.digitalLibraryModule.events.*;
	import edu.isi.bmkeg.digitalLibraryModule.view.*;
	import edu.isi.bmkeg.digitalLibraryModule.model.*;
	
	import flash.events.Event;
	
	import mx.collections.ItemResponder;
	import mx.collections.errors.ItemPendingError;
	import mx.controls.Alert;
	import mx.events.CollectionEvent;
	import mx.managers.PopUpManager;
	import mx.utils.StringUtil;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class ArticleCitationViewMediator extends Mediator
	{
		
		[Inject]
		public var view:ArticleCitationView;
		
		[Inject]
		public var model:DigitalLibraryModel;

		[Inject]
		public var listModel:PagedListModel;
		
		override public function onRegister():void {
			
			addContextListener(FindArticleCitationByIdResultEvent.FIND_ARTICLECITATIONBY_ID_RESULT, 
				findArticleCitationByIdResultHandler);

			loadCurrentSelection();
		}
		
		private function findArticleCitationByIdResultHandler(event:FindArticleDocumentByIdResultEvent):void {

			loadCurrentSelection();
		
		}

		private function loadCurrentSelection():void {
			
			try {
				
				var td:ArticleCitation = model.currentArticle;
				
				if (td == null) {

					view.clearFormFields();

				} else {
					
					var a:LiteratureCitation = td;
					
					if (view.loadedArticle !== a) {
						view.loadLiteratureCitation(a);											
					}
				}
			
			} catch (e:ItemPendingError) {

				e.addResponder(new ItemResponder(itemPendingResult,null,listModel.selectedIndex));
			
			}			
		
		}

		private function itemPendingResult(result:Object, token:Object = null):void {

			loadCurrentSelection();
			
//			if (citationsListModel.selectedIndex == int(token) &&
//				result is ArticleCitation)
//			{
//				view.loadArticleCitation(ArticleCitation(result));
//			}
		}
		
		// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		// Reset everything
		//
		public function clearCorpusHandler(event:ClearCorpusEvent):void {
			
			view.clearFormFields();
			
		}

		//
		// This function is called directly from within
		//
		private function requestFetchObjects(list:PagedList, index:int, count:int):void 
		{
			var td:ArticleCitation_qo = model.queryArticle;
						
			dispatch(new ListArticleCitationPagedEvent(td, index, list.pageSize));
			
		}
		
	}

}