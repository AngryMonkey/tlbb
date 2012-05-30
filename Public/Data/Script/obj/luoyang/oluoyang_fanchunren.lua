--洛阳NPC
--范纯仁
--建立帮会
--脚本号
x000030_g_scriptId = 000030

--所拥有的事件ID列表
x000030_g_eventList={600000}

--**********************************
--事件交互入口
--**********************************
function x000030_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  想要创建帮会就来找我吧！")
	
	AddNumText( sceneId, x000030_g_scriptId, "帮会与领地介绍", 11, 10 )
	
		AddNumText(sceneId,x000030_g_scriptId,"查看帮会列表",6,2)	
		if IsShutout( sceneId, selfId, ONOFF_T_GUILD ) == 0 then
			AddNumText(sceneId,x000030_g_scriptId,"创建帮会",6,1)
		end
		AddNumText(sceneId,x000030_g_scriptId,"管理帮会会员信息",6,3)
		AddNumText(sceneId,x000030_g_scriptId,"查看本帮详细资讯",6,4)
		if(GetHumanGuildID(sceneId, selfId) ~= -1) then
			if IsShutout( sceneId, selfId, ONOFF_T_CITY ) == 0 then
				AddNumText(sceneId,x000030_g_scriptId,"申请城市",6,5)
			end
			if(CityGetSelfCityID(sceneId, selfId) ~= -1) then
				AddNumText(sceneId,x000030_g_scriptId,"进入本帮城市",9,6)
			end
		end
		AddNumText(sceneId,x000030_g_scriptId,"关于帮派繁荣度",11,11)
		AddNumText(sceneId,x000030_g_scriptId,"同盟介绍",11,12)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

function x000030_OnEventRequest( sceneId, selfId, targetId, eventId )

	if GetNumText() == 10 then
			BeginEvent(sceneId)	
					
				AddText( sceneId, "#{function_help_069}" )
								
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
	end
	if GetNumText() == 11 then
			BeginEvent(sceneId)	
					
				AddText( sceneId, "#{Guild_Boom_Help}" )
								
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
	end
	if GetNumText() == 12 then
			BeginEvent(sceneId)	
					
				AddText( sceneId, "#{TM_20080331_07}".."#{TM_20080320_02}" )
								
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
	end
	local sel = GetNumText();
	for i, eventId in x000030_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId, sel)
	end
end
