--了解九大门派特色

--脚本号
x210237_g_ScriptId	= 210237

--门派信息(门派名称，特色描述，接引人坐标，接引人名称，传送坐标)
x210237_g_mpInfo		= {}
x210237_g_mpInfo[0]	= { "【天龙】", "#{OBJ_dali_0045}", 189, 124, "破贪",    185, 128 }
x210237_g_mpInfo[1]	= { "【峨嵋】", "#{OBJ_dali_0046}", 192, 129, "路三娘",  185, 128 }
x210237_g_mpInfo[2]	= { "【丐帮】", "#{OBJ_dali_0047}", 126, 135, "简宁",    133, 130 }
x210237_g_mpInfo[3]	= { "【明教】", "#{OBJ_dali_0048}", 130, 121, "石宝",    133, 130 }
x210237_g_mpInfo[4]	= { "【少林】", "#{OBJ_dali_0049}", 187, 122, "慧易",    185, 128 }
x210237_g_mpInfo[5]	= { "【天山】", "#{OBJ_dali_0050}", 131, 124, "程青霜",  133, 130 }
x210237_g_mpInfo[6]	= { "【武当】", "#{OBJ_dali_0051}", 127, 131, "张获",    133, 130 }
x210237_g_mpInfo[7]	= { "【逍遥】", "#{OBJ_dali_0052}", 188, 133, "澹台子羽",185, 128 }
x210237_g_mpInfo[8]	= { "【星宿】", "#{OBJ_dali_0053}", 134, 120, "海风子",  133, 130 }

--任务入口函数
--**********************************
function x210237_OnDefaultEvent( sceneId, selfId, targetId )
	local	key	= GetNumText()
	local	mp
	local	i		= 0
	
	--了解门派特色
	if key == 100 then
		BeginEvent( sceneId )
			AddText( sceneId, "  了解九大门派特色：" )
			for i, mp in x210237_g_mpInfo do
				AddNumText( sceneId, x210237_g_ScriptId, mp[1], 11, i+1 )
			end
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	--选择各门派
	elseif key >= 1 and key <= 9 then
		mp	= x210237_g_mpInfo[key-1]
		BeginEvent( sceneId )
			AddText( sceneId, mp[2] )
			AddNumText( sceneId, x210237_g_ScriptId, "送我去见传送人", 9, -1*key )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	--送我去见传送人
	elseif key >= -9 and key <= -1 then
		mp	= x210237_g_mpInfo[-1*key-1]
		CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, mp[3], mp[4], mp[5] )
		SetPos( sceneId, selfId, mp[6], mp[7] )
		
		--关闭界面
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )

	--其他
	else
		return
	end
end

--**********************************
--列举事件
--**********************************
function x210237_OnEnumerate( sceneId, selfId, targetId )
	if GetLevel( sceneId, selfId ) >= 10 and GetMenPai( sceneId, selfId ) == MP_WUMENPAI then
		AddNumText( sceneId, x210237_g_ScriptId, "了解九大门派特色", 11, 100 )
	end
end

--**********************************
--检测接受条件
--**********************************
function x210237_CheckAccept( sceneId, selfId )
	--需要10级才能接
	if GetLevel( sceneId, selfId ) >= 10 and GetMenPai( sceneId, selfId ) == MP_WUMENPAI then
		return 1
	else
		return 0
	end
end

--**********************************
--接受
--**********************************
function x210237_OnAccept( sceneId, selfId )
end

--**********************************
--放弃
--**********************************
function x210237_OnAbandon( sceneId, selfId )
end

--**********************************
--继续
--**********************************
function x210237_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--检测是否可以提交
--**********************************
function x210237_CheckSubmit( sceneId, selfId )
	return 1
end

--**********************************
--提交
--**********************************
function x210237_OnSubmit( sceneId, selfId, targetId, selectRadioId )
end

--**********************************
--杀死怪物或玩家
--**********************************
function x210237_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--进入区域事件
--**********************************
function x210237_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x210237_OnItemChanged( sceneId, selfId, itemdataId )
end
