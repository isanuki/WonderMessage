trigger WonderMsgTrigger on WonderMsg__c (before update) {
	
	WonderMsgTriggerHandler handler = new WonderMsgTriggerHandler();
	
	if(Trigger.isBefore && Trigger.isUpdate){
		handler.onBeforeUpdate(Trigger.new, Trigger.oldMap);
	}

}