--脚本号
x808233_g_scriptId = 808233

function x808233_OnImpactFadeOut( sceneId, selfId, impactId )
	if GetHp( sceneId, selfId ) == 0 then		
		return		
	else
		
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 32415) == 1 then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 32416, 0 )
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 32416) == 1 then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 32417, 0 )
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 32417) == 1 then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 32418, 0 )
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 32418) == 1 then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 32419, 0 )
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 32419) == 1 then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 32420, 0 )
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 32420) == 1 then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 32421, 0 )
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 32421) == 1 then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 32422, 0 )
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 32422) == 1 then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 32423, 0 )
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 32423) == 1 then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 32424, 0 )
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 32424) == 1 then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 32425, 0 )
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 32425) == 1 then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 32426, 0 )
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 32426) == 1 then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 32427, 0 )
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 32427) == 1 then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 32428, 0 )
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 32428) == 1 then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 32429, 0 )
		elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 32429) == 1 then
			LuaFnCancelSpecificImpact(sceneId,selfId,32429)
		else
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 32415, 0 )
		end	
	end
end

--**********************************
-- 心法加成
--**********************************
function x808233_XinFaAddition( sceneId, selfId )
	local nXinfaLevel = LuaFnGetXinFaLevel(sceneId, selfId, 70)
	local nAdditon = 0
	if nXinfaLevel>=150 then
		nAdditon = 15
	elseif nXinfaLevel>=140 and nXinfaLevel<150 then
		nAdditon = 14
	elseif nXinfaLevel>=130 and nXinfaLevel<140 then
		nAdditon = 13
	elseif nXinfaLevel>=120 and nXinfaLevel<130 then
		nAdditon = 12
	elseif nXinfaLevel>=110 and nXinfaLevel<120 then
		nAdditon = 11
	elseif nXinfaLevel>=100 and nXinfaLevel<110 then
		nAdditon = 10
	elseif nXinfaLevel>=90 and nXinfaLevel<100 then
		nAdditon = 9
	elseif nXinfaLevel>=80 and nXinfaLevel<90 then
		nAdditon = 8
	elseif nXinfaLevel>=70 and nXinfaLevel<80 then
		nAdditon = 7
	elseif nXinfaLevel>=60 and nXinfaLevel<70 then
		nAdditon = 6
	elseif nXinfaLevel>=50 and nXinfaLevel<60 then
		nAdditon = 5
	elseif nXinfaLevel>=40 and nXinfaLevel<50 then
		nAdditon = 4
	elseif nXinfaLevel>=30 and nXinfaLevel<40 then
		nAdditon = 4
	elseif nXinfaLevel>=20 and nXinfaLevel<30 then
		nAdditon = 3
	elseif nXinfaLevel>=10 and nXinfaLevel<20 then
		nAdditon = 2
	elseif nXinfaLevel<10 then
		nAdditon = 1
	end
	return nAdditon
end