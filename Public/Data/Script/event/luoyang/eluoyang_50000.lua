--出售珍兽
--MisDescBegin
--脚本号
x250000_g_ScriptId = 250000

--任务号
x250000_g_MissionId = 720

--任务目标npc
x250000_g_Name	="沙洲冷" 

--存储随机数
x250000_g_rand = 0					--变量第1位

--任务文本描述
x250000_g_MissionName="我要出售珍兽"
x250000_g_MissionInfo="    请帮我家小姐捕捉珍兽。"  --任务描述
x250000_g_MissionTarget="    完成沙洲冷的任务。"		--任务目标
x250000_g_ContinueInfo="任务做完了么？"		--未完成任务的npc对话
x250000_g_MissionComplete="太谢谢你了！"					--完成任务npc说的话

--任务奖励


--**********************************
--任务入口函数
--**********************************
function x250000_OnDefaultEvent( sceneId, selfId, targetId )	--点击该任务后执行此脚本
    
    DispatchMissionDemandInfo(sceneId,selfId,targetId,x250000_g_ScriptId,x250000_g_MissionId, 2)
    --petdataid = LuaFnGetPet_DataID(sceneId, selfId, indexpet )
end

--**********************************
--如果玩家  有  任务所作的处理
--**********************************
function x250000_HaveMissionToDo( sceneId, selfId,targetId )
 
end

--**********************************
--如果玩家没有任务所作的处理
--**********************************
function x250000_NoMissionToDo( sceneId, selfId, targetId )
 
end

--**********************************
--列举事件
--**********************************
function x250000_OnEnumerate( sceneId, selfId, targetId )
 		
 		if GetName(sceneId,targetId) == x250000_g_Name then		--如果是发任务的npc		  
			AddNumText(sceneId,x250000_g_ScriptId,x250000_g_MissionName,6,-1)
		end
		
end

--**********************************
--检测接受条件
--**********************************
function x250000_CheckAccept( sceneId, selfId )
		return 1
end

--**********************************
--接受
--**********************************
function x250000_OnAccept( sceneId, selfId )
end

--**********************************
--放弃
--**********************************
function x250000_OnAbandon( sceneId, selfId )
 
end

--**********************************
--继续
--**********************************
function x250000_OnContinue( sceneId, selfId, targetId )
 
end

--**********************************
--检测是否可以提交
--**********************************
function x250000_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x250000_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

end

--**********************************
--提交
--**********************************
function x250000_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	
end

--**********************************
--杀死怪物或玩家
--**********************************
function x250000_OnKillObject( sceneId, selfId, objdataId )

end

--**********************************
--进入区域事件
--**********************************
function x250000_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x250000_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--接任务后显示的界面
--**********************************
function x250000_AcceptDialog(sceneId, selfId,x250000_g_rand,g_Dialog,targetId)
 
end

--**********************************
--交任务后显示的界面
--**********************************
function x250000_SubmitDialog(sceneId, selfId,x250000_g_rand)

end

--**********************************
--把信送到后显示的界面
--**********************************
function x250000_SubmitDialog(sceneId, selfId,x250000_g_rand)

end

function x250000_DisplayMissionTips(sceneId,selfId,g_MissionTip)
	BeginEvent(sceneId)
		strText = g_MissionTip
		AddText(sceneId,strText)
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
end

--**********************************
--取得本事件的MissionId，用于obj文件中对话情景的判断
--**********************************
function x250000_GetEventMissionId(sceneId, selfId)
	return x250000_g_MissionId
end

function x250000_PetValue( PetLevel )

    local MoneyNum = 0
    if PetLevel > 0  and PetLevel <=5 then		    
        MoneyNum = 225
    end
		    
    if PetLevel > 5  and PetLevel <=15 then
        MoneyNum = 595
    end

    if PetLevel > 15  and PetLevel <=25 then
        MoneyNum = 1191
    end
		    
    if PetLevel > 25  and PetLevel <=35 then
        MoneyNum = 1779
    end
		    
    if PetLevel > 35  and PetLevel <=45 then
        MoneyNum = 2450
    end
		    
    if PetLevel > 45  and PetLevel <=55 then
        MoneyNum = 3205
 	  end
		    
    if PetLevel > 55  and PetLevel <=65 then
        MoneyNum = 4042
    end
		    
    if PetLevel > 65  and PetLevel <=75 then
        MoneyNum = 4964
    end
		    
    if PetLevel > 75  and PetLevel <=85 then
        MoneyNum = 5968
    end
		    
    if PetLevel > 85  and PetLevel <=95 then
		    MoneyNum = 7056
		end
		    		    		
    if PetLevel > 95 then
        MoneyNum = 7056
		end

    return MoneyNum
end
--**********************************
--玩家提交的物品及珍兽
--**********************************
function x250000_OnMissionCheck( sceneId, selfId, npcid, scriptId, index1, index2, index3, indexpet )
  --PrintNum( indexpet )           
  --indexpet 此索引为"绝对索引值"，即在0-5 这6个栏位中的序号。
  
	if indexpet == 255 then --索引值返回255表示空，没提交珍兽
		BeginEvent(sceneId)
			strText = "请把珍兽拖动到窗口中!"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	else	
	
	  ValidIndex = indexpet
    if 255 == ValidIndex then        
        return        
    end
	
    local PetLevel = LuaFnGetPet_Level( sceneId, selfId, ValidIndex )		    --得到珍兽级别				    
		
		local DataID = LuaFnGetPet_DataID( sceneId, selfId, ValidIndex )       --得到珍兽ID
		local PetName = GetPetName( DataID )  
				
    --PrintNum( PetLevel )				
				
				
		ret1 = LuaFnDeletePet(sceneId, selfId, ValidIndex ) --删除珍兽				
		if ret1 > 0 then     --成功删除珍兽		    		    
		    --PrintStr( "删除成功拉" )
		    --删除珍兽后，将根据珍兽等级计算玩家所得金钱数目
		    local MoneyNum = x250000_PetValue( PetLevel )
		    AddMoney( sceneId, selfId, MoneyNum )
		    
		    --PrintNum( PetLevel )
		    Msg2Player(  sceneId, selfId,"您出售了"..PetName..",获得了#{_MONEY"..MoneyNum.."}",MSG2PLAYER_PARA )
		    
		end
		

	end
end

