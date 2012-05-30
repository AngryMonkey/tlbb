--在线泡点


--脚本号
x898989_g_scriptId = 898989

x898989_g_NormalExpBuffID = 5905	--普通 获得经验的特效....
x898989_g_MoreExpBuffID = 5904		--暴击 获得经验的特效....

x898989_g_ExpTbl = {
	[10]=100,[11]=111,[12]=130,[13]=140,[14]=150,
	[15]=180,[16]=220,[17]=250,[18]=300,[19]=320,
	[20]=350,[21]=380,[22]=400,[23]=430,[24]=450,
	[25]=500,[26]=550,[27]=600,[28]=650,[29]=700,
	[30]=765,[31]=787,[32]=810,[33]=832,[34]=855,
	[35]=877,[36]=900,[37]=922,[38]=945,[39]=967,
	[40]=990,[41]=1012,[42]=1035,[43]=1057,[44]=1080,
	[45]=1102,[46]=1125,[47]=1147,[48]=1170,[49]=1192,
	[50]=1215,[51]=1237,[52]=1260,

}

--**********************************
-- OnTime
--**********************************
function x898989_OnSceneTimer(sceneId)		
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		x898989_DoHanYuLogic( sceneId, nHumanId )
	end

end

--**********************************
-- 挂机加经验逻辑
--**********************************
function x898989_DoHanYuLogic( sceneId, selfId )
	if sceneId~=2 then 
		return
	end
	PlayerX = GetHumanWorldX(sceneId,selfId)
	PlayerZ = GetHumanWorldZ(sceneId,selfId)
	if PlayerX>=150 and PlayerX<=225 and PlayerZ>=225 and PlayerZ<=358 then
		local haveImpact = LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 35)
		if haveImpact==1 then
			ZengDian(sceneId,selfId,-1,1,100)
			LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, x898989_g_MoreExpBuffID, 0)
			BeginEvent( sceneId )
				AddText( sceneId, "泡点系统：您获得了 100 点赠点" )
			EndEvent( sceneId )
			DispatchMissionTips( sceneId, selfId )
		end
	end
end
--**********************************
-- 获取某等级的经验
--**********************************
function x898989_GetPreExpOfThisLevel( sceneId, level )

	local Exp = x898989_g_ExpTbl[level]
	if Exp then
		return Exp
	else
		return 0
	end

end
