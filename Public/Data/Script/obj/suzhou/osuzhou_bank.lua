
x001026_g_scriptId = 1026


function x001026_OnDefaultEvent( sceneId, selfId,targetId )
	  BeginEvent(sceneId)
     
			AddNumText(sceneId, 7, "打开银行",5,-1)
			AddNumText(sceneId, 8, "购买新的租赁箱",5,-1)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
end
function x001026_OnEventRequest( sceneId, selfId, targetId, eventId )
	BeginEvent(sceneId)
		--打开银行
		if eventId == 7 then
			BankBegin(sceneId, selfId)	
		--购买新的租赁箱
		elseif eventId == 8 then
			EnableBankRentIndex(sceneId, selfId, 2)
		end

  EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
