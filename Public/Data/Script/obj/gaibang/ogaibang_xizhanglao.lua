--丐帮NPC
--奚长老
--普通

--脚本号
x010007_g_ScriptId = 010007

--**********************************
--事件交互入口
--**********************************
function x010007_OnDefaultEvent( sceneId, selfId,targetId )
	x010007_g_MenPai = GetMenPai(sceneId, selfId)
	if x010007_g_MenPai == 2 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{TYJZ_081103_02}")
			AddNumText(sceneId, x010007_g_ScriptId, "学习技能",12,0)
			AddNumText(sceneId, x010007_g_ScriptId, "关于心法的介绍",11,10)
			--AddNumText(sceneId, x010007_g_ScriptId, "#{JZBZ_081031_02}",11,11)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	else
			BeginEvent(sceneId)
			AddText(sceneId,"你找我有何事啊？")
			
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end
end

function x010007_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 10 then
			BeginEvent(sceneId)	
					
				AddText( sceneId, "#{function_xinfajieshao_001}" )
								
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
	elseif GetNumText() == 11 then
		BeginEvent(sceneId)					
			AddText( sceneId, "#{JZBZ_081031_01}" )							
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	DispatchXinfaLevelInfo( sceneId, selfId, targetId, 2 );
end
