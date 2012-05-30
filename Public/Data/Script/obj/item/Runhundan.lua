-- 300068 
-- 润魂丹
-- 使用之后永久增加5点潜能。

-- 脚本号
x300068_g_scriptId = 300068

-- 润魂丹
x300068_g_ItemId = 30008044
--**********************************
-- 事件交互入口
--**********************************
function x300068_OnDefaultEvent( sceneId, selfId, nItemIndex)
	-- 是否使用过润魂丹，目前只有润魂丹会对MD_EX_HUMAN_QIANNENG_SUBJOIN进行操作
	local Runhundan_Point = GetMissionData( sceneId, selfId, MD_EX_HUMAN_QIANNENG_SUBJOIN )
	if( Runhundan_Point > 0 ) then
		BeginEvent( sceneId )
			AddText( sceneId, "润魂丹只能使用一次哦" )
		EndEvent( sceneId )
		DispatchMissionTips( sceneId, selfId )
	else
		if( x300068_DelRunhundan(sceneId, selfId, nItemIndex ) > 0 ) then
			
			--加上5个额外属性点
			local RemainPoint = GetPlayerRemainPoints(sceneId, selfId)
			RemainPoint = RemainPoint + 5
			SetPlayerRemainPoints(sceneId, selfId, RemainPoint)
			
			--记录润魂丹额外加成点，润魂丹加成点只有5
			SetMissionData( sceneId, selfId, MD_EX_HUMAN_QIANNENG_SUBJOIN, 5 )
			AuditRunHunDan( sceneId, selfId, x300068_g_ItemId )
			
			BeginEvent( sceneId )
				AddText( sceneId, "#{DHMB_0728_16}" )
			EndEvent( sceneId )
			DispatchEventList( sceneId,selfId,-1 )
		end
	end
	
--
--		INT nQianNeng = pHuman->GetMissionData(MD_EX_HUMAN_QIANNENG_SUBJOIN) + 5;
--		pHuman->SetMissionData(MD_EX_HUMAN_QIANNENG_SUBJOIN, nQianNeng);
--
end

function x300068_IsSkillLikeScript( sceneId, selfId )
 	return 0
end

function x300068_ShowNotice( sceneId, selfId, strNotice)
	BeginEvent( sceneId )
		AddText( sceneId, strNotice )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )    
end


function x300068_DelRunhundan( sceneId, selfId, nItemIndex)
	local nItemId = GetItemTableIndexByIndex(sceneId, selfId, nItemIndex)
	if nItemId == x300068_g_ItemId then
		local EraseRet = EraseItem( sceneId, selfId, nItemIndex )
		if EraseRet < 0 then      --如果删除失败,将不会增加玩家属性
			return 0
		else
			return 1			--删除成功
		end
	else
		return 0
	end
end
