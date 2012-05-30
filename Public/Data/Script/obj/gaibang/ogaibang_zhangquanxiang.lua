--丐帮NPC
--张全祥
--普通

x010008_g_scriptId = 010008

x010008_g_xuanWuDaoId=400918 --[tx42913]

--门派信息(门派名称，SceneID，PosX，PosY，门派ID)
x010008_g_mpInfo		= {}
x010008_g_mpInfo[0]	= { "星宿", 16,  96, 152, MP_XINGSU }
x010008_g_mpInfo[1]	= { "逍遥", 14,  67, 145, MP_XIAOYAO }
x010008_g_mpInfo[2]	= { "少林",  9,  95, 137, MP_SHAOLIN }
x010008_g_mpInfo[3]	= { "天山", 17,  95, 120, MP_TIANSHAN }
x010008_g_mpInfo[4]	= { "天龙", 13,  96, 120, MP_DALI }
x010008_g_mpInfo[5]	= { "峨嵋", 15,  89, 144, MP_EMEI }
x010008_g_mpInfo[6]	= { "武当", 12, 103, 140, MP_WUDANG }
x010008_g_mpInfo[7]	= { "明教", 11,  98, 167, MP_MINGJIAO }
x010008_g_mpInfo[8]	= { "丐帮", 10,  91, 116, MP_GAIBANG }

--**********************************
--事件交互入口
--**********************************
function x010008_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"#{MPXL_090113_06}")
		if	GetLevel( sceneId, selfId)>=10  then	
			AddNumText(sceneId,x010008_g_scriptId,"洛阳",9,0)
			AddNumText(sceneId,x010008_g_scriptId,"苏州",9,1)
			AddNumText( sceneId, x010008_g_scriptId, "洛阳 - 九州商会", 9, 3 )
			AddNumText( sceneId, x010008_g_scriptId, "苏州 - 铁匠铺", 9, 4 )
		end
		
		--add by WTT
		if	GetLevel( sceneId, selfId)>=20  then	
			AddNumText( sceneId, x010008_g_scriptId, "束河古镇", 9, 6 )
		end
		
		if	GetLevel( sceneId, selfId)>=75  then	
			AddNumText( sceneId, x010008_g_scriptId, "#{MPCSLL_80925_01}", 9, 5 )
		end
		AddNumText(sceneId,x010008_g_scriptId,"大理",9,2)
		
		--[tx42913]
		CallScriptFunction( x010008_g_xuanWuDaoId, "OnEnumerate",sceneId, selfId, targetId )
		--[/tx42913]		
		
		AddNumText(sceneId,x010008_g_scriptId,"带我去其他门派吧",9,11)

		-- 我怎样才能去敦煌和嵩山
		AddNumText( sceneId, x010008_g_scriptId, "我怎样才能去敦煌和嵩山", 11, 2000 )

	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件列表选中一项
--**********************************
function x010008_OnEventRequest( sceneId, selfId, targetId, eventId )

------------------------------------------------------------------------------------------
--[tx42913]
	if eventId == x010008_g_xuanWuDaoId then --去玄武岛
		CallScriptFunction( x010008_g_xuanWuDaoId, "OnDefaultEvent",sceneId, selfId, targetId )
		return
	end
--[/tx42913]
	if GetNumText() == 2000 then		--
		BeginEvent( sceneId )
			AddText( sceneId, "#{GOTO_DUNHUANF_SONGSHAN}" ) 
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		
		return
	end
  
    if  GetNumText() == 11 then
        
		BeginEvent(sceneId)
		    
		    for i=0, 8 do
				AddNumText( sceneId, x010008_g_scriptId, "门派 - "..x010008_g_mpInfo[i][1], 9, i+12 )
			end			
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)	
		return 
    end
    
    num = GetNumText()

 	if num > 11 then
 		-- 检测玩家身上是不是有113号BUFF
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 113) == 1   then
			BeginEvent( sceneId )
				AddText( sceneId, "  处于漕运，跑商状态是不能从我这里传送的" ) 
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			
			return
 		end
 	
 	    i = num - 12
		CallScriptFunction( (400900), "TransferFuncFromNpc", sceneId, selfId, x010008_g_mpInfo[i][2], x010008_g_mpInfo[i][3], x010008_g_mpInfo[i][4] )
		return
	end
------------------------------------------------------------------------------------------ 

	if	GetNumText()==0	then
		CallScriptFunction((400900), "TransferFuncFromNpc",sceneId, selfId, 0,229,322, 10)
	elseif	GetNumText()==1	then
		CallScriptFunction((400900), "TransferFuncFromNpc",sceneId, selfId, 1,203,258, 10)
	elseif	GetNumText()==3	then
		CallScriptFunction((400900), "TransferFuncFromNpc",sceneId, selfId, 0,330,272, 10)
	elseif	GetNumText()==4	then
		CallScriptFunction((400900), "TransferFuncFromNpc",sceneId, selfId, 1,330,224, 10)
	elseif	GetNumText()==2	then
		CallScriptFunction((400900), "TransferFuncFromNpc",sceneId, selfId, 2,375,227)
	elseif  GetNumText()==5	then
		CallScriptFunction((400900), "TransferFuncFromNpc",sceneId, selfId, 186,288,136,75)
	end
	
	--add by WTT
	if GetNumText()== 6 then					--束河古镇		
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId, x010008_g_scriptId);			
			UICommand_AddInt(sceneId, targetId);
			UICommand_AddString(sceneId, "GotoShuHeGuZhen");
			UICommand_AddString(sceneId, "束河古镇为不加杀气场景，请注意安全。你确认要进入吗？");
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 24)
		return
	end

end

--add by WTT
function x010008_GotoShuHeGuZhen( sceneId, selfId, targetId )
	CallScriptFunction((400900), "TransferFuncFromNpc", sceneId, selfId, 420, 200, 211, 20 );
	return
end
