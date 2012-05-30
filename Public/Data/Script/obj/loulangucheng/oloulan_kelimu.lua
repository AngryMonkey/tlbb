--楼兰NPC....
--宝石工匠....

x001119_g_scriptId = 001119

--**********************************
--事件交互入口
--**********************************
function x001119_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )

		AddText( sceneId, "#{loulan_baoshigongjiang_20080329}" )
		AddNumText( sceneId, x001119_g_scriptId, "宝石相关介绍", 11, 0 )
		AddNumText( sceneId, x001119_g_scriptId, "材料合成介绍", 11, 20 ) -- add by cuiyinjie 20081021
		AddNumText( sceneId, x001119_g_scriptId, "宝石合成", 6, 1 )
		AddNumText( sceneId, x001119_g_scriptId, "装备打孔", 6, 2 )
		AddNumText( sceneId, x001119_g_scriptId, "宝石摘除", 6, 3 )
		AddNumText( sceneId, x001119_g_scriptId, "材料合成", 6, 4 )
		AddNumText( sceneId, x001119_g_scriptId, "宝石镶嵌", 6, 5 )
		AddNumText( sceneId, x001119_g_scriptId, "宝石雕琢", 6, 6 )
		AddNumText( sceneId, x001119_g_scriptId, "宝石熔炼", 6, 7 )

	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end


--**********************************
--事件列表选中一项
--**********************************
function x001119_OnEventRequest( sceneId, selfId, targetId, eventId )

		if GetNumText() == 0 then
			BeginEvent(sceneId)	
			
				AddText(sceneId,"#{function_help_104}#r")
			
				AddNumText(sceneId, x001119_g_scriptId,"装备打孔介绍",11,8);
				AddNumText(sceneId, x001119_g_scriptId,"宝石合成介绍",11,9);
				AddNumText(sceneId, x001119_g_scriptId,"宝石镶嵌介绍",11,10);
				AddNumText(sceneId, x001119_g_scriptId,"宝石摘除介绍",11,11);
--				AddNumText(sceneId, x001119_g_scriptId,"装备修理介绍",11,12);
				AddNumText(sceneId, x001119_g_scriptId,"宝石雕琢介绍",11,13);
				AddNumText(sceneId, x001119_g_scriptId,"宝石熔炼介绍",11,14);
				AddNumText(sceneId, x001119_g_scriptId,"胜利宝石介绍",11,15);

			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
		
		-- addstart 2008-10-21 add by cuiyinjie
		if GetNumText() == 20 then  -- add by cuiyinjie 材料合成介绍
			BeginEvent(sceneId)			
				AddText(sceneId,"#{SJSJ_081021_003}#r")
				AddNumText(sceneId, x001119_g_scriptId,"精铁的操作介绍",11,21);
				AddNumText(sceneId, x001119_g_scriptId,"秘银的操作介绍",11,22);
				AddNumText(sceneId, x001119_g_scriptId,"棉布的操作介绍",11,23);					
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
		
		if GetNumText() == 21 then
			BeginEvent(sceneId)						
				AddText(sceneId,"#{SJSJ_081021_004}#r")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end	
		if GetNumText() == 22 then
			BeginEvent(sceneId)						
				AddText(sceneId,"#{SJSJ_081021_005}#r")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end	
		if GetNumText() == 23 then
			BeginEvent(sceneId)						
				AddText(sceneId,"#{SJSJ_081021_006}#r")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end	
		-- addend 2008-10-21 
	
		if GetNumText() == 8 then
			BeginEvent(sceneId)						
				AddText(sceneId,"#{function_help_039}#r")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end	
		if GetNumText() == 9 then
			BeginEvent(sceneId)						
				AddText(sceneId,"#{function_help_040}#r")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end	
		if GetNumText() == 10 then
			BeginEvent(sceneId)						
				AddText(sceneId,"#{function_help_041}#r")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end

		if GetNumText() == 11 then
			BeginEvent(sceneId)						
				AddText(sceneId,"#{function_help_042}#r")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end	
--		if GetNumText() == 12 then
--			BeginEvent(sceneId)						
--				AddText(sceneId,"#{function_help_043}#r")
--			EndEvent(sceneId)
--			DispatchEventList(sceneId,selfId,targetId)
--			return
--		end

		if GetNumText() == 13 then
			BeginEvent(sceneId)						
				AddText(sceneId,"#{INTERFACE_XML_GemCarve_6}#r")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end	
		if GetNumText() == 14 then
			BeginEvent(sceneId)						
				AddText(sceneId,"#{JKBS_081021_022}#r")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
		if GetNumText() == 15 then
			BeginEvent(sceneId)						
				AddText(sceneId,"#{JKBS_081021_023}#r")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end


		--------------------------------------------------------------------------
		if GetNumText() == 1 then
			BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
			EndUICommand( sceneId )
			DispatchUICommand( sceneId, selfId, 23 )
			return
		end

		if GetNumText() == 2 then
			BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
			EndUICommand( sceneId )
			DispatchUICommand( sceneId, selfId, 25 )
			return
		end

		if GetNumText() == 3 then
			BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
			EndUICommand( sceneId )
			DispatchUICommand( sceneId, selfId, 27 )
			return
		end

		if GetNumText() == 4 then
			BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
			EndUICommand( sceneId )
			DispatchUICommand( sceneId, selfId, 19810424 )
			return
		end

		if GetNumText() == 5 then
			BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
			EndUICommand( sceneId )
			DispatchUICommand( sceneId, selfId, 19830424 )
			return
		end

		if GetNumText() == 6 then
			BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
			EndUICommand( sceneId )
			DispatchUICommand( sceneId, selfId, 112236 )
			return
		end

		if GetNumText() == 7 then
			BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
			EndUICommand( sceneId )
			DispatchUICommand( sceneId, selfId, 112237 )
			return
		end

end
