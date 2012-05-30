--武当NPC
--萧天逸
--普通

x012035_g_scriptId = 012035

--**********************************
--事件交互入口
--**********************************
function x012035_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"古来修炼之士，皆会遇到心魔之事，适天师在武当山布下大阵，可有机会战败心魔，你愿意试试自己的实力吗？")
		AddNumText(sceneId,x012035_g_scriptId,"去挑战心魔",10,0)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件列表选中一项
--**********************************
function x012035_OnEventRequest( sceneId, selfId, targetId, eventId )
	if	GetNumText()==0	then
		if	GetLevel( sceneId, selfId)<71  then	
			BeginEvent( sceneId )
			local strText = "所谓先修外，后修内，你的等级不到71级，枉自进入，恐怕会走火入魔啊。"
			AddText( sceneId, strText )
			EndEvent( sceneId )
			DispatchEventList(sceneId,selfId,targetId)
		else
			CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 142,91,183)
		end
	end
end
